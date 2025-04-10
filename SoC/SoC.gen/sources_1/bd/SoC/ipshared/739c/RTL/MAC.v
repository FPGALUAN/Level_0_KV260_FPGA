/*-----------------------------------------------------------------------------
 * File          : MAC.v
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
 
 module Multiply_Accumulate
  (
   input wire					CLK,
   input wire					RST,  
   input wire					Start_in,
   input wire					Done_in,
   input wire [31:0]			A_in, // Q15.16
   input wire [31:0]			X_in, // Q15.16
   input wire [31:0]			B_in, // Q15.16
   output wire [31:0]			Y_out, // Q15.16
   output wire					Valid_out
   );
   
   	/* Khai báo trạng thái cho FSM */
	
	parameter IDLE 				= 0;
	parameter EXECUTE			= 1;
	parameter WAIT_DONE			= 2;	

   	/* Khai báo tín hiệu wire */
	
	wire [63:0] 				mul_raw_result_w;
				
	wire [31:0] 				mul_fixed_result_w;
	wire [31:0] 				add_result_w;

   	/* Khai báo tín hiệu reg */
	
	reg [1:0]					state_r, next_state_r;
	
	reg [31:0]					Y_r;
	reg							valid_r;
	

	/* FSM điều khiển */
	
	// 1. Cập nhật trạng thái hiện tại
	always @(posedge CLK or negedge RST) begin
		if (RST == 0)
			state_r <= IDLE;
		else
			state_r <= next_state_r;
	end

	// 2. FSM tổ hợp
	always @(*) begin
		case (state_r)
			IDLE: begin
				if (Start_in)
					next_state_r = EXECUTE;
				else
					next_state_r = IDLE;
			end
			EXECUTE: begin
				next_state_r = WAIT_DONE;
			end
			WAIT_DONE: begin
				if (Done_in)
					next_state_r = IDLE;
				else
					next_state_r = WAIT_DONE;
			end
			default: next_state_r = IDLE;
		endcase
	end

   	/* Mạch tổ hợp */

	assign mul_raw_result_w   	= $signed(A_in) * $signed(X_in);  // Q15.16 x Q15.16 = Q30.32
    assign mul_fixed_result_w 	= mul_raw_result_w[47:16];         // Dịch phải 16 bit → Q15.16
    assign add_result_w       	= mul_fixed_result_w + $signed(B_in); // MAC: acc = A*X + B
	
	assign Y_out				= Y_r;
	assign Valid_out			= valid_r;
	
    /* Mạch tuần tự cập nhật output */
    always @(posedge CLK or negedge RST) begin
        if (RST == 0) begin
            Y_r     <= 32'sd0;
            valid_r <= 1'b0;
        end 
		else begin
            case (state_r)
                IDLE: begin
                    valid_r <= 1'b0;
					Y_r     <= 32'sd0;
                end

                EXECUTE: begin
                    Y_r     <= add_result_w;
                    valid_r <= 1'b1;
                end

                WAIT_DONE: begin
                    valid_r <= valid_r;
					Y_r     <= Y_r;
                end
				default: begin
				    valid_r <= 1'b0;
					Y_r     <= 32'sd0;
				end
            endcase
        end
    end

endmodule