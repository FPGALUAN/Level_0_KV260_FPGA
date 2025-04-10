/*-----------------------------------------------------------------------------
 * File          : TB_MAC.v
 * Author        : PHAM HOAI LUAN
 * Created       : 08.04.2025
 * Last modified : 08.04.2025
 *-----------------------------------------------------------------------------
 * Description   : Fixed-point Multiply-Accumulate (MAC) module using Q15.16 format.
 *                 Computes: Y = A * X + B
 *                 Supports FSM-based control with Start and Done handshaking.
 *                 Designed for basic FPGA testing and PIO-based communication.
 *-----------------------------------------------------------------------------
 * Modification history :
 * 08.04.2025 : created
 *-----------------------------------------------------------------------------
 */
 
`timescale 1ns/1ps

module TB_MAC;

    // Khai báo ngõ vào
    reg CLK;
    reg RST;
    reg Start_in;
    reg Done_in;
    reg [31:0] A_in;
    reg [31:0] X_in;
    reg [31:0] B_in;

    // Khai báo ngõ ra
    wire [31:0] Y_out;
    wire Valid_out;

    // Kết nối với mô-đun MAC
    Multiply_Accumulate mac (
        .CLK(CLK),
        .RST(RST),
        .Start_in(Start_in),
        .Done_in(Done_in),
        .A_in(A_in),
        .X_in(X_in),
        .B_in(B_in),
        .Y_out(Y_out),
        .Valid_out(Valid_out)
    );

    // Phát xung clock 100MHz (chu kỳ 10ns)
    always #5 CLK = ~CLK;

    // Hàm chuyển đổi số thực sang fixed-point Q15.16
    function [31:0] real_to_q15_16;
        input real val;
        begin
            real_to_q15_16 = $rtoi(val * (1 << 16));
        end
    endfunction

    // Hàm chuyển đổi Q15.16 sang số thực
    function real q15_16_to_real;
        input [31:0] val;
        begin
            q15_16_to_real = $itor($signed(val)) / (1 << 16);
        end
    endfunction

    // Hàm trị tuyệt đối cho real
    function real abs_real;
        input real val;
        begin
            if (val < 0.0)
                abs_real = -val;
            else
                abs_real = val;
        end
    endfunction

    // Mảng chứa các bộ test
    real test_A [0:9];
    real test_X [0:9];
    real test_B [0:9];
    integer i;

    // Task chạy một test case
    task run_test;
        input real A_val, X_val, B_val;
        input integer index;
        real expected, actual;
        begin
            @(posedge CLK);
            A_in = real_to_q15_16(A_val);
            X_in = real_to_q15_16(X_val);
            B_in = real_to_q15_16(B_val);

            Start_in = 1;
            @(posedge CLK);
            Start_in = 0;

            // Chờ ngõ ra Valid_out lên 1
            wait (Valid_out == 1);
            @(posedge CLK); // Đảm bảo Y_out đã ổn định

            actual   = q15_16_to_real(Y_out);
            expected = A_val * X_val + B_val;

            if (abs_real(actual - expected) < 0.001)
                $display("Test %0d PASSED: A=%.4f, X=%.4f, B=%.4f → Y=%.4f (kỳ vọng %.4f)", 
                         index, A_val, X_val, B_val, actual, expected);
            else
                $display("Test %0d FAILED: A=%.4f, X=%.4f, B=%.4f → Y=%.4f (kỳ vọng %.4f)", 
                         index, A_val, X_val, B_val, actual, expected);

            // Gửi tín hiệu Done sau khi đọc xong
            Done_in = 1;
            @(posedge CLK);
            Done_in = 0;

            #10;
        end
    endtask

    // Khối khởi động mô phỏng
    initial begin
        // Khởi tạo tín hiệu
        CLK = 0;
        RST = 0;
        Start_in = 0;
        Done_in = 0;
        A_in = 0;
        X_in = 0;
        B_in = 0;

        // Kích hoạt reset trong 100ns
        #100;
        RST = 1;
        #20;

        // Gán giá trị cho các bộ test
        test_A[0] =  1.5;    test_X[0] =  2.25;   test_B[0] =  0.75;
        test_A[1] = -1.0;    test_X[1] =  3.00;   test_B[1] =  1.25;
        test_A[2] =  0.0;    test_X[2] =  5.50;   test_B[2] =  2.00;
        test_A[3] =  2.0;    test_X[3] =  0.50;   test_B[3] = -1.00;
        test_A[4] = -2.0;    test_X[4] = -1.5;    test_B[4] =  0.25;
        test_A[5] =  3.75;   test_X[5] =  1.25;   test_B[5] = -0.75;
        test_A[6] =  0.25;   test_X[6] =  0.25;   test_B[6] =  0.25;
        test_A[7] =  1.0;    test_X[7] = -2.0;    test_B[7] =  4.0;
        test_A[8] =  0.5;    test_X[8] =  0.5;    test_B[8] =  0.5;
        test_A[9] = -1.5;    test_X[9] =  2.0;    test_B[9] = -1.0;

        // Chạy lần lượt các bộ test
        for (i = 0; i < 10; i = i + 1) begin
            run_test(test_A[i], test_X[i], test_B[i], i);
            #30;
        end

        $display("Mô phỏng hoàn tất. Tổng cộng %0d test cases.", i);
        $finish;
    end

endmodule
