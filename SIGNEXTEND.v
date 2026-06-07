// -------------------------------------------------------------------
// Copyright (C) 2020-2026 Rasheed Kibria 
// All rights reserved.
// This Verilog code is provided for educational and research purposes.
// -------------------------------------------------------------------

module SIGNEXTEND (sign_in, sign_out);
	input [15:0] sign_in; // Input 16 bit data //
	output reg [31:0] sign_out; // Extended 32 bit output data //

	always @(sign_in)
		if (sign_in[15] == 0)
			sign_out = {16'b0, sign_in};
		else
			sign_out = {16'b1111111111111111, sign_in};

endmodule