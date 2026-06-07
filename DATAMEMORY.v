// -------------------------------------------------------------------
// Copyright (C) 2020-2026 Rasheed Kibria 
// All rights reserved.
// This Verilog code is provided for educational and research purposes.
// -------------------------------------------------------------------

module DATAMEMORY (clk, Address, MemWrite, MemRead, WriteData_memory, ReadData_memory);
		input [31:0] Address;
		input clk, MemWrite, MemRead;
		input [31:0] WriteData_memory;
		output [31:0] ReadData_memory;
		reg [31:0] RAM[0:31];
		integer i;

		initial begin	
			for (i = 0; i < 32; i = i + 1) begin
				RAM[i] = 32'b0;
			end
		end


		always @(posedge clk)
		begin
		        if (MemWrite) begin
					RAM[Address] = WriteData_memory;
				end
		end
		
		assign ReadData_memory = (MemRead == 1) ? RAM[Address] : 32'b0;
		
endmodule