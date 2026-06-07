// -------------------------------------------------------------------
// Copyright (C) 2020-2026 Rasheed Kibria 
// All rights reserved.
// This Verilog code is provided for educational and research purposes.
// -------------------------------------------------------------------

module ADDER (Data, Sum);
	input [31:0] Data;
	output [31:0] Sum;

	assign Sum = Data + 32'h00000001;
	
endmodule