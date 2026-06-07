// -------------------------------------------------------------------
// Copyright (C) 2020-2026 Rasheed Kibria 
// All rights reserved.
// This Verilog code is provided for educational and research purposes.
// -------------------------------------------------------------------

module SSDDECODER(BCD, SSD);
	input [3:0] BCD;
	output reg [6:0] SSD;
	
	always @(BCD)
		case(BCD)
			0: SSD = 7'b1000000;
			1: SSD = 7'b1111001; 
			2: SSD = 7'b0100100; 
			3: SSD = 7'b0110000; 
			4: SSD = 7'b0011001; 
			5: SSD = 7'b0010010; 
			6: SSD = 7'b0000010; 
			7: SSD = 7'b1111000; 
			8: SSD = 7'b0000000;
			9: SSD = 7'b0010000; 
		  	10: SSD = 7'b0001000; 
		  	11: SSD = 7'b0000011; 
		  	12: SSD = 7'b1000110; 
		  	13: SSD = 7'b0100001; 
		  	14: SSD = 7'b0000110; 
		  	15: SSD = 7'b0001110; 
		  	default: SSD = 7'b1000000;
		endcase
		
endmodule