// -------------------------------------------------------------------
// Copyright (C) 2020-2026 Rasheed Kibria 
// All rights reserved.
// This Verilog code is provided for educational and research purposes.
// -------------------------------------------------------------------

module ZEROEXTENDBYTE (zero_in_byte, zero_out_byte);
	input [7:0] zero_in_byte; // Input 8 bit data //
	output [31:0] zero_out_byte; // Extended 32 bit output data //

	assign zero_out_byte = {24'b0, zero_in_byte};
	
endmodule