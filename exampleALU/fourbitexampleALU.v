module fourbitexampleALU(
           input [3:0] A,B,  // ALU 4-bit Inputs                 
           input [2:0] ALU_Sel,// ALU Selection
			  output[3:0] reg_Sel, 
           output [7:0] ALU_Out, // ALU 8-bit Output
           output CarryOut // Carry Out Flag
    );
    reg [7:0] ALU_Result;
	 reg [3:0] REG_Result = 2'b10;
    wire [8:0] tmp;
    assign ALU_Out = ALU_Result; // ALU out
    assign reg_Sel = REG_Result; // ALU out
    assign tmp = {1'b0,A} + {1'b0,B};
    assign CarryOut = tmp[8]; // Carryout flag
    always @(*)
    begin
        case(ALU_Sel)
			  3'b000: // Addition
				  ALU_Result = A + B ; 
			  3'b001: // Subtraction
				  ALU_Result = A - B ;
			  3'b010: // Multiplication
				  ALU_Result = A * B;
			  3'b011: // Division
				  ALU_Result = A/B;
			  3'b100: // Logical shift left
				  ALU_Result = A<<1;
			  3'b101: // Logical shift right
				  ALU_Result = A>>1;
			  3'b110: // A sqaured
				  ALU_Result = A * A;
			  3'b111: // B sqaured
				  ALU_Result = B * B;
			  default: ALU_Result = A + B ; 
        endcase
		//REG_Result = 4'b0010;
    end

endmodule