// -------------------------------------------------------------------
// Copyright (C) 2020-2026 Rasheed Kibria 
// All rights reserved.
// This Verilog code is provided for educational and research purposes.
// -------------------------------------------------------------------

module CONTROL (opcode, RegDst, RegWrite, MulorDivWrite, ALUOp, ShiftSel, ALUSrc, MemWrite, MemRead, MemDataSel, MemtoReg, Jump, BEQ, BNE, BGT, BLT, BGTU, BLTU);
	input [5:0] opcode; // Input Opcode field for the main control unit //
	output reg RegWrite; // The control signal for Register Write Operation //
	output reg [1:0] RegDst; // Control signal that selects register destination for the ReadData2 port of the register file //
	output reg MulorDivWrite; // Control signal that causes Write operation for the multiplication and division instruction to HIGH and LOW registers //
	output reg [3:0] ALUOp; // The ALUOp control signal that selects operation performed by the ALU //
	output reg ShiftSel; // Control signal that selects the amount of shift // 
	output reg ALUSrc; // Control signal that selects source for the 2nd ALU input //
	output reg MemWrite; // Control signal that determines when memory write operation will be done //
	output reg MemRead; // Control signal that determines when memory read operation will be done //
	output reg [2:0] MemDataSel; // Control signal for selecting data to be stored in the Data Memory //
	output reg [3:0] MemtoReg; // Control signal for selecting data to be stored in the Register File //
	output reg [1:0] Jump; // Control signal for selecting the Jump address //
	output reg BEQ; // Control signal which is asserted when branch-on-equal instruction is executed //
	output reg BNE; // Control signal which is asserted when branch-on-not-equal instruction is executed //
	output reg BGT; // Control signal which is asserted when branch on greater than instruction is executed //
	output reg BLT; // Control signal which is asserted when branch on less than instruction is executed //
	output reg BGTU; // Control signal which is asserted when branch on greater than unsigned instruction is executed //
	output reg BLTU; // Control signal which is asserted when branch on less than unsigned instruction is executed //

	always @(opcode)
	begin
		case(opcode)
			// R type Instruction : addu, add, and, nor, or, sub, subu, xor, slt, sltu //
			6'b000000: begin
				ALUOp = 4'b0010;
				RegDst = 2'b01;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 0;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b1000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// addi Instruction //
			6'b001001: begin
				ALUOp = 4'b0011;
				RegDst = 2'b00;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 1;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b1000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// addiu Instruction //
			6'b001000: begin
				ALUOp = 4'b0100;
				RegDst = 2'b00;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 1;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b1000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// andi Instruction //
			6'b001100: begin
				ALUOp = 4'b0101;
				RegDst = 2'b00;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 1;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b1000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// ori Instruction //
			6'b001101: begin
				ALUOp = 4'b0110;
				RegDst = 2'b00;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 1;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b1000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// xori Instruction //
			6'b001110: begin
				ALUOp = 4'b0111;
				RegDst = 2'b00;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 1;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b1000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// slti Instruction //
			6'b001010: begin
				ALUOp = 4'b1000;
				RegDst = 2'b00;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 1;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b1000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// sltiu Instruction //
			6'b001011: begin
				ALUOp = 4'b1001;
				RegDst = 2'b00;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 1;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b1000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// mult or multu Instruction //
			6'b100000: begin
				ALUOp = 4'b1010;
				RegDst = 2'b01;
				RegWrite = 0;
				MulorDivWrite = 1;
				ShiftSel = 0;
				ALUSrc = 0;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b1000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// div or divu Instruction //
			6'b110000: begin
				ALUOp = 4'b1011;
				RegDst = 2'b01;
				RegWrite = 0;
				MulorDivWrite = 1;
				ShiftSel = 0;
				ALUSrc = 0;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b1000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// sll Instruction //
			6'b100001: begin
				ALUOp = 4'b1100;
				RegDst = 2'b01;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 0;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b1000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// sllv Instruction //
			6'b100010: begin
				ALUOp = 4'b1100;
				RegDst = 2'b01;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 1;
				ALUSrc = 0;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b1000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// srl Instruction //
			6'b100101: begin
				ALUOp = 4'b1101;
				RegDst = 2'b01;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 0;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b1000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// srlv Instruction //
			6'b100110: begin
				ALUOp = 4'b1101;
				RegDst = 2'b01;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 1;
				ALUSrc = 0;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b1000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// sra Instruction //
			6'b100011: begin
				ALUOp = 4'b1110;
				RegDst = 2'b01;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 0;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b1000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// srav Instruction //
			6'b100100: begin
				ALUOp = 4'b1110;
				RegDst = 2'b01;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 1;
				ALUSrc = 0;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b1000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// j Instruction //
			6'b000010: begin
				ALUOp = 4'b0000;
				RegDst = 2'b01;
				RegWrite = 0;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 0;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b1000;
				Jump = 2'b10;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// jal Instruction //
			6'b000011: begin
				ALUOp = 4'b0000;
				RegDst = 2'b10;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 0;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b0000;
				Jump = 2'b10;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// jalr Instruction //
			6'b000100: begin
				ALUOp = 4'b0000;
				RegDst = 2'b01;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 0;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b0000;
				Jump = 2'b01;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// jr Instruction //
			6'b000101: begin
				ALUOp = 4'b0000;
				RegDst = 2'b01;
				RegWrite = 0;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 0;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b1000;
				Jump = 2'b01;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// beq Instruction //
			6'b000111: begin
				ALUOp = 4'b0001;
				RegDst = 2'b01;
				RegWrite = 0;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 0;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b0000;
				Jump = 2'b00;
				BEQ = 1;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// bne Instruction //
			6'b110110: begin
				ALUOp = 4'b0001;
				RegDst = 2'b01;
				RegWrite = 0;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 0;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b0000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 1;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// blt Instruction //
			6'b110001: begin
				ALUOp = 4'b0001;
				RegDst = 2'b01;
				RegWrite = 0;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 0;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b0000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 1;
				BGTU = 0;
				BLTU = 0;
			end


			// bgt Instruction //
			6'b110101: begin
				ALUOp = 4'b0001;
				RegDst = 2'b01;
				RegWrite = 0;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 0;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b0000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 1;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// bgtu Instruction //
			6'b010010: begin
				ALUOp = 4'b1111;
				RegDst = 2'b01;
				RegWrite = 0;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 0;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b0000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 1;
				BLTU = 0;
			end


			// bltu Instruction //
			6'b010000: begin
				ALUOp = 4'b1111;
				RegDst = 2'b01;
				RegWrite = 0;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 0;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b0000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 1;
			end


			// beql Instruction //
			6'b110011: begin
				ALUOp = 4'b0001;
				RegDst = 2'b10;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 0;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b0000;
				Jump = 2'b00;
				BEQ = 1;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// bnel Instruction //
			6'b110111: begin
				ALUOp = 4'b0001;
				RegDst = 2'b10;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 0;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b0000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 1;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// bgtl Instruction //
			6'b110100: begin
				ALUOp = 4'b0001;
				RegDst = 2'b10;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 0;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b0000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 1;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// bltl Instruction //
			6'b110010: begin
				ALUOp = 4'b0001;
				RegDst = 2'b10;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 0;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b0000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 1;
				BGTU = 0;
				BLTU = 0;
			end


			// bgtul Instruction //
			6'b010011: begin
				ALUOp = 4'b1111;
				RegDst = 2'b10;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 0;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b0000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 1;
				BLTU = 0;
			end


			// bltul Instruction //
			6'b010001: begin
				ALUOp = 4'b1111;
				RegDst = 2'b10;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 0;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b0000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 1;
			end



			// mfhi, mflo, mthi, mtlo instructions //
			6'b000110: begin
				ALUOp = 4'b0000;
				RegDst = 2'b01;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 0;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b0001;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// move instruction //
			6'b010100: begin
				ALUOp = 4'b0000;
				RegDst = 2'b01;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 0;
				MemWrite = 0;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b0001;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// lb instruction //
			6'b111000: begin
				ALUOp = 4'b0000;
				RegDst = 2'b00;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 1;
				MemWrite = 0;
				MemRead = 1;
				MemDataSel = 3'b000;
				MemtoReg = 4'b0011;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// lbu instruction //
			6'b111001: begin
				ALUOp = 4'b0000;
				RegDst = 2'b00;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 1;
				MemWrite = 0;
				MemRead = 1;
				MemDataSel = 3'b000;
				MemtoReg = 4'b0100;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// lh instruction //
			6'b111010: begin
				ALUOp = 4'b0000;
				RegDst = 2'b00;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 1;
				MemWrite = 0;
				MemRead = 1;
				MemDataSel = 3'b000;
				MemtoReg = 4'b0101;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// lhu instruction //
			6'b111011: begin
				ALUOp = 4'b0000;
				RegDst = 2'b00;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 1;
				MemWrite = 0;
				MemRead = 1;
				MemDataSel = 3'b000;
				MemtoReg = 4'b0110;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// lui instruction //
			6'b111100: begin
				ALUOp = 4'b0000;
				RegDst = 2'b00;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 1;
				MemWrite = 0;
				MemRead = 1;
				MemDataSel = 3'b000;
				MemtoReg = 4'b0111;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// lw instruction //
			6'b111101: begin
				ALUOp = 4'b0000;
				RegDst = 2'b00;
				RegWrite = 1;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 1;
				MemWrite = 0;
				MemRead = 1;
				MemDataSel = 3'b000;
				MemtoReg = 4'b0010;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// sb instruction //
			6'b011000: begin
				ALUOp = 4'b0000;
				RegDst = 2'b00;
				RegWrite = 0;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 1;
				MemWrite = 1;
				MemRead = 0;
				MemDataSel = 3'b001;
				MemtoReg = 4'b0000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// sbu instruction //
			6'b011011: begin
				ALUOp = 4'b0000;
				RegDst = 2'b00;
				RegWrite = 0;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 1;
				MemWrite = 1;
				MemRead = 0;
				MemDataSel = 3'b010;
				MemtoReg = 4'b0000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// sh instruction //
			6'b011001: begin
				ALUOp = 4'b0000;
				RegDst = 2'b00;
				RegWrite = 0;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 1;
				MemWrite = 1;
				MemRead = 0;
				MemDataSel = 3'b011;
				MemtoReg = 4'b0000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// shu instruction //
			6'b011100: begin
				ALUOp = 4'b0000;
				RegDst = 2'b00;
				RegWrite = 0;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 1;
				MemWrite = 1;
				MemRead = 0;
				MemDataSel = 3'b100;
				MemtoReg = 4'b0000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end


			// sw instruction //
			6'b011010: begin
				ALUOp = 4'b0000;
				RegDst = 2'b00;
				RegWrite = 0;
				MulorDivWrite = 0;
				ShiftSel = 0;
				ALUSrc = 1;
				MemWrite = 1;
				MemRead = 0;
				MemDataSel = 3'b000;
				MemtoReg = 4'b0000;
				Jump = 2'b00;
				BEQ = 0;
				BNE = 0;
				BGT = 0;
				BLT = 0;
				BGTU = 0;
				BLTU = 0;
			end
		endcase
	end
	
endmodule