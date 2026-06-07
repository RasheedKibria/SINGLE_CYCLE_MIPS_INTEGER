// -------------------------------------------------------------------
// Copyright (C) 2020-2026 Rasheed Kibria 
// All rights reserved.
// This Verilog code is provided for educational and research purposes.
// -------------------------------------------------------------------

module MUX32bit2to1 (mux_in_1, mux_in_2, sel, mux_out);
	input [31:0] mux_in_1, mux_in_2;
	input sel;
	output reg [31:0] mux_out;

	always @(sel, mux_in_1, mux_in_2)
		if (sel)
			mux_out = mux_in_2;
		else
			mux_out = mux_in_1;

endmodule