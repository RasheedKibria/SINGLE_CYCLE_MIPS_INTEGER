// -------------------------------------------------------------------
// Copyright (C) 2020-2026 Rasheed Kibria 
// All rights reserved.
// This Verilog code is provided for educational and research purposes.
// -------------------------------------------------------------------

module MUX32bit3to1 (mux_in0, mux_in1, mux_in2, select, out);
	input [31:0] mux_in0, mux_in1, mux_in2;
	input [1:0] select;
	output reg [31:0] out;

	always @(select, mux_in0, mux_in1, mux_in2)
		case(select)
			2'b00: out = mux_in0;
			2'b01: out = mux_in1;
			2'b10: out = mux_in2;
		    default: out = 32'b0;
		endcase

endmodule