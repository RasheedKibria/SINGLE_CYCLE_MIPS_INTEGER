// -------------------------------------------------------------------
// Copyright (C) 2020-2026 Rasheed Kibria 
// All rights reserved.
// This Verilog code is provided for educational and research purposes.
// -------------------------------------------------------------------

module ALU (ALUData1, ALUData2, ALUControl, ALUResult, shamt, isZero, isGreater_signed, isLess_signed, isGreater_unsigned, isLess_unsigned);
	input [31:0] ALUData1, ALUData2; // The ALU inputs each having 32 bit wide bus //
	input [4:0] ALUControl; // The control signals that determines the function performed by the ALU //
	input [4:0] shamt; // Shift amount // 

	output isZero; // Indicates whether the ALU Result is Zero or not //
	output isGreater_signed; // Indicates whether one ALU input is greater than the other input for signed case//
	output isLess_signed; // Indicates whether one ALU input is less than the other input for signed case//
	output isGreater_unsigned; // Indicates whether one ALU input is greater than the other input for unsigned case//
	output isLess_unsigned; // Indicates whether one ALU input is less than the other input for unsigned case//
	output reg [63:0] ALUResult; // The 64 bit ALU Result......We have taken 64 bit output due to multiplication and division operations //


	always @(ALUData1, ALUData2, ALUControl, shamt)
	begin
		case (ALUControl)
			5'b00010: ALUResult = ALUData1 + ALUData2; // addu instruction // 
			5'b00011: ALUResult = $signed(ALUData1) + $signed(ALUData2); // add instruction //
			5'b00000: ALUResult = ALUData1 & ALUData2; // and instruction //
			5'b00001: ALUResult = ~(ALUData1 | ALUData2); // nor instruction //
			5'b00100: ALUResult = ALUData1 | ALUData2; // or instruction //
			5'b00101: ALUResult = $signed(ALUData1) - $signed(ALUData2); // sub instruction //
			5'b00110: ALUResult = ALUData1 - ALUData2; // subu instruction // 
			5'b00111: ALUResult = ALUData1 ^ ALUData2; // xor instruction //
			5'b01000: ALUResult = ($signed(ALUData1) < $signed(ALUData2)) ? 1 : 0; // slt instruction //
			5'b01001: ALUResult = (ALUData1 < ALUData2) ? 1 : 0; // sltu instruction //
			5'b01010: ALUResult = $signed(ALUData1) * $signed(ALUData2); // mult instruction //
			5'b01011: ALUResult = ALUData1 * ALUData2; // multu instruction // 
			5'b01100: begin
				ALUResult[31:0] = $signed(ALUData1) / $signed(ALUData2);
				ALUResult[63:32] = $signed(ALUData1) % $signed(ALUData2); // div instruction
			end
			5'b01101: begin
				ALUResult[31:0] = ALUData1 / ALUData2;
				ALUResult[63:32] = ALUData1 % ALUData2; // divu instruction
			end	
			5'b01110: ALUResult = ALUData1 << shamt; // sll or sllv instruction //
			5'b01111: ALUResult = ALUData1 >> shamt; // srl or srlv instruction //
			5'b10000: ALUResult = $signed(ALUData1) >>> shamt; // sra or srav instruction //	
			default: ALUResult = 64'b0;
		endcase
	end

	assign isZero = (ALUResult == 0); // Checking whether the ALU Result is Zero or not //
	assign isGreater_signed = ($signed(ALUData1) > $signed(ALUData2)) ? 1 : 0; // Greater than check for signed case //
	assign isLess_signed = ($signed(ALUData1) < $signed(ALUData2)) ? 1 : 0; // Less than check for signed case //
	assign isGreater_unsigned = (ALUData1 > ALUData2) ? 1 : 0; // Greater than check for unsigned case //
	assign isLess_unsigned = (ALUData1 < ALUData2) ? 1 : 0; // Less than check for unsigned case //
	
endmodule