// -------------------------------------------------------------------
// Copyright (C) 2020-2026 Rasheed Kibria 
// All rights reserved.
// This Verilog code is provided for educational and research purposes.
// -------------------------------------------------------------------

module ZEROEXTENDLUI (zero_in_lui, zero_out_lui);
	input [15:0] zero_in_lui; // Input 16 bit data //
	output [31:0] zero_out_lui; // Extended 32 bit output data //

	assign zero_out_lui = {zero_in_lui, 16'b0};
	
endmodule