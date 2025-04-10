// Created by: LPham Hoai Luan
// Created on: 2025-04-10
// Description: This file is used to test the FPGA driver by sending data to the FPGA and receiving the result back from the FPGA.


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>


#include <fcntl.h>
#include <stdint.h>
#include <math.h>

#include "./FPGA_Driver.c" // call fpga driver


#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

/// Address in Write Channel
#define START_BASE_PHYS	 		 	(0x0000000 >> 2)
#define DONE_BASE_PHYS	 		 	(0x0000004 >> 2)
									
#define A_IN_BASE_PHYS	 			(0x0000008 >> 2)
#define X_IN_BASE_PHYS	 			(0x000000C >> 2)
#define B_IN_BASE_PHYS	 			(0x0000010 >> 2)
		
/// Address in Read Channel                
#define VALID_BASE_PHYS	 		 	(0x0000000 >> 2)
								
#define Y_BASE_PHYS	 				(0x0000004 >> 2)

// Fixed-point format: 1 sign bit, 15 integer bits, 16 fractional bits
// Return: 32-bit unsigned int representing the fixed-point value
uint32_t float_to_fixed_hex32(double value) {
    int is_negative = value < 0;
    double abs_val = fabs(value);

    // Scale by 2^16 to shift fractional part
    double scaled = abs_val * (1 << 16);

    // Round to nearest integer
    uint32_t fixed_val = (uint32_t)(scaled + 0.5);

    // If value is negative, take two's complement
    if (is_negative) {
        fixed_val = (~fixed_val + 1) & 0xFFFFFFFF;
    }

    return fixed_val;
}

int main() {
    if (fpga_open() != 1) {
        fprintf(stderr, "Failed to open FPGA device.\n");
        exit(EXIT_FAILURE);
    }

    char input[32];

    while (1) {
        printf("\n=== FPGA Calculator ===\n");
        printf("Enter 'q' to quit, or press Enter to continue.\n");
        printf("Your choice: ");
        fgets(input, sizeof(input), stdin);
        
        if (input[0] == 'q' || input[0] == 'Q') {
            printf("Exiting program.\n");
            break;
        }

        double A_val, X_val, B_val;

        printf("Enter A (real number): ");
        scanf("%lf", &A_val);
        printf("Enter X (real number): ");
        scanf("%lf", &X_val);
        printf("Enter B (real number): ");
        scanf("%lf", &B_val);
        getchar(); // Consume newline character after scanf

        uint32_t A_fix = float_to_fixed_hex32(A_val);
        uint32_t X_fix = float_to_fixed_hex32(X_val);
        uint32_t B_fix = float_to_fixed_hex32(B_val);

        *(MY_IP_info.pio_32_mmap + A_IN_BASE_PHYS) = A_fix;
        *(MY_IP_info.pio_32_mmap + X_IN_BASE_PHYS) = X_fix;
        *(MY_IP_info.pio_32_mmap + B_IN_BASE_PHYS) = B_fix;

        *(MY_IP_info.pio_32_mmap + START_BASE_PHYS) = 1;

        while (1){
			if(*(MY_IP_info.pio_32_mmap + VALID_BASE_PHYS) == 1){	
				printf("MY_IP completed the calculation!\n");
				break;
			}
		}

        uint32_t Y_fix = *(MY_IP_info.pio_32_mmap + Y_BASE_PHYS);
        double Y_result = (int32_t)Y_fix / (double)(1 << 16);

        printf("Result from FPGA: Y = %.6f (hex = 0x%08X)\n", Y_result, Y_fix);
		
		*(MY_IP_info.pio_32_mmap + DONE_BASE_PHYS) = 1;
    }

    return 0;
}