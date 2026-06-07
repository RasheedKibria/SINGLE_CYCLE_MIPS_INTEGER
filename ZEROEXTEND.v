// -------------------------------------------------------------------
// Copyright (C) 2020-2026 Rasheed Kibria 
// All rights reserved.
// This Verilog code is provided for educational and research purposes.
// -------------------------------------------------------------------

module ZEROEXTEND (zero_in, zero_out);
	input [15:0] zero_in; // Input 16 bit data //
	output [31:0] zero_out; // Extended 32 bit output data //

	assign zero_out = {16'b0, zero_in};
	
endmodule