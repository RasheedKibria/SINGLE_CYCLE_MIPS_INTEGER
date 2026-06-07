// -------------------------------------------------------------------
// Copyright (C) 2020-2026 Rasheed Kibria 
// All rights reserved.
// This Verilog code is provided for educational and research purposes.
// -------------------------------------------------------------------

module MUX32bit5to1 (mux_in0, mux_in1, mux_in2, mux_in3, mux_in4, select, out);
	input [31:0] mux_in0, mux_in1, mux_in2, mux_in3, mux_in4;
	input [2:0] select;
	output reg [31:0] out;

	always @(select, mux_in0, mux_in1, mux_in2, mux_in3, mux_in4)
		case(select)
			3'b000: out = mux_in0;
			3'b001: out = mux_in1;
			3'b010: out = mux_in2;
			3'b011: out = mux_in3;
			3'b100: out = mux_in4;
		    default: out = 32'b0;
		endcase

endmodule