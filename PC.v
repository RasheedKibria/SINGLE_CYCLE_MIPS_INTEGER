// -------------------------------------------------------------------
// Copyright (C) 2020-2026 Rasheed Kibria 
// All rights reserved.
// This Verilog code is provided for educational and research purposes.
// -------------------------------------------------------------------

module PC (clk, reset, PCin, PCout);
	input clk, reset;
	input [31:0] PCin;
	output reg [31:0] PCout;

	always @(posedge clk or negedge reset)
		if (reset == 0)
			PCout = 32'b0;
		else
			PCout = PCin;
			
endmodule