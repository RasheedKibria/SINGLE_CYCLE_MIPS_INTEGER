// -------------------------------------------------------------------
// Copyright (C) 2020-2026 Rasheed Kibria 
// All rights reserved.
// This Verilog code is provided for educational and research purposes.
// -------------------------------------------------------------------

module ALUCONTROL (ALUOp, FunctionCode, ALUControl);
	input [3:0] ALUOp; // The ALUOp bits generated from main Control Unit //
	input [5:0] FunctionCode; // The Function field obtained from the machine code //
	output reg [4:0] ALUControl; // The generated ALU control bits //

	always @(ALUOp, FunctionCode)
	begin
		case (ALUOp)
			4'b0000: ALUControl = 5'b00010; // Performs addu operation for load and store instructions //
			4'b0001: ALUControl = 5'b00101; // Performs sub operation for branch signed instructions //
			4'b0010: begin
				case(FunctionCode)
					6'b100000: ALUControl = 5'b00010; // addu instruction //
					6'b100001: ALUControl = 5'b00011; // add instruction //
					6'b100100: ALUControl = 5'b00000; // and instruction //
					6'b100111: ALUControl = 5'b00001; // nor instruction //
					6'b100101: ALUControl = 5'b00100; // or instruction //
					6'b001001: ALUControl = 5'b00101; // sub instruction //
					6'b100011: ALUControl = 5'b00110; // subu instruction //
					6'b100110: ALUControl = 5'b00111; // xor instruction //
					6'b101011: ALUControl = 5'b01000; // slt instruction //
					6'b101010: ALUControl = 5'b01001; // sltu instruction //
				endcase
			end
			4'b0011: ALUControl = 5'b00011; // addi instruction //
			4'b0100: ALUControl = 5'b00010; // addiu instruction //
			4'b0101: ALUControl = 5'b00000; // andi instruction //
			4'b0110: ALUControl = 5'b00100; // ori instruction //
			4'b0111: ALUControl = 5'b00111; // xori instruction //
			4'b1000: ALUControl = 5'b01000; // slti instruction //
			4'b1001: ALUControl = 5'b01001; // sltiu instruction //
			4'b1010: begin
				case(FunctionCode)
					6'b011001: ALUControl = 5'b01010; // mult instruction //
					6'b011000: ALUControl = 5'b01011; // multu instruction //
				endcase
			end
			4'b1011: begin
				case(FunctionCode)
					6'b011010: ALUControl = 5'b01100; // div instruction //
					6'b011011: ALUControl = 5'b01101; // divu instruction //
				endcase
			end
			4'b1100: ALUControl = 5'b01110; // sll or sllv instruction //
			4'b1101: ALUControl = 5'b01111; // srl or srlv instruction //
			4'b1110: ALUControl = 5'b10000; // sra or srav instruction //
			4'b1111: ALUControl = 5'b00110; // Performs subu operation for branch unsigned instructions //
		endcase
	end
	
endmodule