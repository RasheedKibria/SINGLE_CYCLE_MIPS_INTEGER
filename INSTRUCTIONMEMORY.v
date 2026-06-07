// -------------------------------------------------------------------
// Copyright (C) 2020-2026 Rasheed Kibria 
// All rights reserved.
// This Verilog code is provided for educational and research purposes.
// -------------------------------------------------------------------

module INSTRUCTIONMEMORY (ReadAddress, Instruction);
	input [31:0] ReadAddress;        /// The adrress bits those come from the Program Counter ///
	output reg [31:0] Instruction;   /// The instruction stored in the address provided by the program counter ///
	
	//// Stored Program ////
	always @(ReadAddress)
		case (ReadAddress)
			 1: Instruction = 32'b001001_00000_00000_0000000000000100; // addi $t0, $t0, 4 //
			 2: Instruction = 32'b001001_00001_00001_1111111111111101; // addi $t1, $t1, -3 //
			 3: Instruction = 32'b000000_00000_00001_00001_00000_100001; // add $t1, $t0, $t1 //
			 4: Instruction = 32'b000011_00000000000000000000001000; // jal 8 //
			 5: Instruction = 32'b001001_00010_00010_0000000000001000; // addi $t2, $t2, 8 //
			 6: Instruction = 32'b000000_00010_00001_00001_00000_001001; // sub $t1, $t2, $t1 //
			 7: Instruction = 32'b000010_00000000000000000000001011; // j 11 //
			 8: Instruction = 32'b001001_00011_00011_0000000000001001; // addi $t3, $t3, 9 //
			 9: Instruction = 32'b000000_00001_00011_00100_00000_100001; // add $t4, $t1, $t3 //
			10: Instruction = 32'b000101_10010_000000000000000000000; // jr $ra //
			11: Instruction = 32'b100000_00001_00010_00000_00000_011001; // multu $t1, $t2 //
			12: Instruction = 32'b000110_10000_00000_00001_00000000000; // mflo $t1 //
			13: Instruction = 32'b010100_00001_00000_00101_00000000000; // move $t1, $t5 //
			14: Instruction = 32'b110011_00001_00101_0000000000000011; // beql $t1, $t5, 3 //
			15: Instruction = 32'b110000_00101_00000_00000_00000_011011; // divu $t5, $t0 //
			16: Instruction = 32'b000110_10000_00000_00101_00000000000; // mflo $t5 //
			17: Instruction = 32'b000010_00000000000000000000010101; // j 21 //
			18: Instruction = 32'b001100_00001_00001_0000000000000000; // andi $t1, $t1, 0 // 
			19: Instruction = 32'b000000_00001_00010_00010_00000_100110; // xor $t2, $t1, $t2 //
			20: Instruction = 32'b000101_10010_000000000000000000000; // jr $ra // 
			21: Instruction = 32'b100001_00101_00000_00101_00000_000000; // sll $t5, $t5, 5 //
			22: Instruction = 32'b100010_00010_00010_00110_00000_000000; // sllv $t6, $t2, $t2 //
			23: Instruction = 32'b000000_00101_00110_00111_00000_101010; // sltu $t7, $t5, $t6 //
			24: Instruction = 32'b001001_00111_00111_0000000000000000; // addi $t7, $t7, 0 //
			default: Instruction = 32'b0; // For other addresses (No operation) //					   
		endcase
		
endmodule