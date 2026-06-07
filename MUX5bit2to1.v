// -------------------------------------------------------------------
// Copyright (C) 2020-2026 Rasheed Kibria 
// All rights reserved.
// This Verilog code is provided for educational and research purposes.
// -------------------------------------------------------------------

module MUX5bit2to1 (muxin1, muxin2, select, muxout);
	input [4:0] muxin1, muxin2;
	input select;
	output reg [4:0] muxout;

	always @(select, muxin1, muxin2)
		if (select)
			muxout = muxin2;
		else
			muxout = muxin1;

endmodule