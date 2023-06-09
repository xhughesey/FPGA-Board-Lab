module reg8 (reset, CLK, D, Q);
input reset;
input CLK;
input [7:0] D;
output [7:0] Q;
reg [7:0] Q;
always @(posedge CLK)
	if (reset)
		Q = 0;
	else
		Q = D;
endmodule // reg8