// -------------------------------------------------------------------
// Copyright (C) 2020-2026 Rasheed Kibria 
// All rights reserved.
// This Verilog code is provided for educational and research purposes.
// -------------------------------------------------------------------

module REGISTERFILE (clk, ReadRegister1, ReadRegister2, WriteRegister, WriteData1, WriteData2, RegWrite, MulorDivWrite, ReadData1, ReadData2);
	input [4:0] ReadRegister1, ReadRegister2; // The register numbers to read //
	input [4:0] WriteRegister; // The register number to write //
	input [31:0] WriteData1, WriteData2; // Data to be writen //
	input RegWrite; // The Write control for normal operation //
	input MulorDivWrite; // The Write control for multiplication and division operation //
	input clk; // The clock input //
	integer i; // Loop Index //
	output [31:0] ReadData1, ReadData2; // The register values read //
	reg [31:0] RF [0:31]; // We have 32 registers and each of those are 32 bits long //


	// Initialization of the Registers //
	initial begin
		for (i = 0; i < 32; i = i + 1)
			RF[i] = 32'b0;
	end

	// Read Data From the Register File //
	assign ReadData1 = RF[ReadRegister1];
	assign ReadData2 = RF[ReadRegister2];

	// Write Data to the Register File //
	always @(posedge clk)
	begin
		// Normal Write Operation //
		if (RegWrite)
			RF[WriteRegister] = WriteData1; 

		// Write for multiplication and division //
		else if (MulorDivWrite & (~RegWrite))
			begin
				RF[16] = WriteData1;
				RF[17] = WriteData2;
			end
	end

endmodule