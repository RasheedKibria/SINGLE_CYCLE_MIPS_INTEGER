// -------------------------------------------------------------------
// Copyright (C) 2020-2026 Rasheed Kibria 
// All rights reserved.
// This Verilog code is provided for educational and research purposes.
// -------------------------------------------------------------------

module SIGNEXTENDBYTE (sign_in_byte, sign_out_byte);
	input [7:0] sign_in_byte; // Input 8 bit data //
	output reg [31:0] sign_out_byte; // Extended 32 bit output data //

	always @(sign_in_byte)
		if (sign_in_byte[7] == 0)
			sign_out_byte = {24'b0, sign_in_byte};
		else
			sign_out_byte = {24'b1111_1111_1111_1111_1111_1111, sign_in_byte};

endmodule