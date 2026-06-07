// -------------------------------------------------------------------
// Copyright (C) 2020-2026 Rasheed Kibria 
// All rights reserved.
// This Verilog code is provided for educational and research purposes.
// -------------------------------------------------------------------

module ADDER32bit (Data1, Data2, Sum);
	input [31:0] Data1, Data2;
	output [31:0] Sum;

	assign Sum = Data1 + Data2;
	
endmodule