// -------------------------------------------------------------------
// Copyright (C) 2020-2026 Rasheed Kibria 
// All rights reserved.
// This Verilog code is provided for educational and research purposes.
// -------------------------------------------------------------------

module MUX32bit9to1 (mux_in0, mux_in1, mux_in2, mux_in3, mux_in4, mux_in5, mux_in6, mux_in7, mux_in8, select, out);
	input [31:0] mux_in0, mux_in1, mux_in2, mux_in3, mux_in4, mux_in5, mux_in6, mux_in7, mux_in8;
	input [3:0] select;
	output reg [31:0] out;

	always @(select, mux_in0, mux_in1, mux_in2, mux_in3, mux_in4, mux_in5, mux_in6, mux_in7, mux_in8)
		case(select)
			4'b0000: out = mux_in0;
			4'b0001: out = mux_in1;
			4'b0010: out = mux_in2;
			4'b0011: out = mux_in3;
			4'b0100: out = mux_in4;
			4'b0101: out = mux_in5;
			4'b0110: out = mux_in6;
			4'b0111: out = mux_in7;
			4'b1000: out = mux_in8;
			default: out = 32'b0;
		endcase

endmodule