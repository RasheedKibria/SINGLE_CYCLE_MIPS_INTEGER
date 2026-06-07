// -------------------------------------------------------------------
// Copyright (C) 2020-2026 Rasheed Kibria 
// All rights reserved.
// This Verilog code is provided for educational and research purposes.
// -------------------------------------------------------------------

module MIPS_SC (clk, reset, SSD1, SSD2, SSD3, SSD4);
	input wire clk, reset;
	wire [31:0] ALUResult;

	// Connections for the PC //
	wire [31:0] PCin;
	wire [31:0] PCout;

	// Connections for the Instruction Memory //
	wire [31:0] Instruction;

	// Connections for the Register File //
	wire [4:0] WriteRegister;
	wire [31:0] RegisterData;
	wire RegWrite;
	wire MulorDivWrite;
	wire [31:0] ReadData1, ReadData2;

	// Connections for the 5 bit 3-to-1 MUX for the Register File //
	wire [1:0] RegDst;

	// Connections for the ALU Control Unit //
	wire [3:0] ALUOp;
	wire [4:0] ALUControl;

	// Connections for the 5 bit 2-to-1 MUX for the shift selection for ALU //
	wire ShiftSel;
	wire [4:0] shamt;

	// Connections for the Sign Extender Unit before the ALU //
	wire [31:0] SEout;

	// Connections for the 32 bit 2-to-1 MUX for the 2nd ALU data selection for ALU //
	wire ALUSrc;
	wire [31:0] ALUData2;

	// Connections for the ALU //
	wire [63:0] ALUResultTEMP;
	assign ALUResult = ALUResultTEMP[31:0];
	wire isZero;
	wire isGreaterSigned;
	wire isLessSigned;
	wire isGreaterUnsigned;
	wire isLessUnsigned;

	// Connections for the Data Memory //
	wire MemWrite;
	wire MemRead;
	wire [31:0] MemoryData;
	wire [31:0] MemData;

	// Connections for the MUX before the Data Memory //
	wire [31:0] SEout1;
	wire [31:0] ZEout1;
	wire [31:0] SEout2;
	wire [31:0] ZEout2;
	wire [2:0] MemDataSel;

	// Connections for the MUX for selecting the data to be written in the Register File //
	wire [31:0] SEout3;
	wire [31:0] ZEout3;
	wire [31:0] SEout4;
	wire [31:0] ZEout4;
	wire [31:0] ZElui;
	wire [3:0] MemtoReg;
	wire [31:0] PCplus1;

	// Connections for the Program Counter Input //
	wire [31:0] BranchAddress;
	wire BranchorNot;
	wire [31:0] NormalorBranch;
	wire [31:0] JumpAddress;
	wire [1:0] Jump;

	// Connections for the Branch Logic Generator //
	wire BEQ;
	wire BNE;
	wire BGT;
	wire BLT;
	wire BGTU;
	wire BLTU;

	// 7 SEGMENT DISPLAY INTERFACE //
	output wire [6:0] SSD1, SSD2, SSD3, SSD4;


	// MIPS Processor Top Level Module //
	PC myPC(.clk(clk), .reset(reset), .PCin(PCin), .PCout(PCout));

	INSTRUCTIONMEMORY myINSTRUCTIONMEMORY(.ReadAddress(PCout), .Instruction(Instruction));

	MUX5bit3to1 myMUX5bit3to1(.mux_in0(Instruction[20:16]), .mux_in1(Instruction[15:11]), .mux_in2(5'd18), .select(RegDst), .out(WriteRegister));

	REGISTERFILE myREGISTERFILE(.clk(clk), .ReadRegister1(Instruction[25:21]), .ReadRegister2(Instruction[20:16]), .WriteRegister(WriteRegister), .WriteData1(RegisterData), .WriteData2(ALUResultTEMP[63:32]), .RegWrite(RegWrite), .MulorDivWrite(MulorDivWrite), .ReadData1(ReadData1), .ReadData2(ReadData2));

	ALUCONTROL myALUCONTROL(.ALUOp(ALUOp), .FunctionCode(Instruction[5:0]), .ALUControl(ALUControl));

	MUX5bit2to1 myMUX5bit2to1ALU(.muxin1(Instruction[10:6]), .muxin2(ReadData1[4:0]), .select(ShiftSel), .muxout(shamt));

	SIGNEXTEND mySIGNEXTENDALU(.sign_in(Instruction[15:0]), .sign_out(SEout));

	MUX32bit2to1 myMUX32bit2to1ALU(.mux_in_1(ReadData2), .mux_in_2(SEout), .sel(ALUSrc), .mux_out(ALUData2));

	ALU myALU(.ALUData1(ReadData1), .ALUData2(ALUData2), .ALUControl(ALUControl), .ALUResult(ALUResultTEMP), .shamt(shamt), .isZero(isZero), .isGreater_signed(isGreaterSigned), .isLess_signed(isLessSigned), .isGreater_unsigned(isGreaterUnsigned), .isLess_unsigned(isLessUnsigned));

	DATAMEMORY myDATAMEMORY(.clk(clk), .Address(ALUResultTEMP[31:0]), .MemWrite(MemWrite), .MemRead(MemRead), .WriteData_memory(MemoryData), .ReadData_memory(MemData));

	SIGNEXTENDBYTE mySIGNEXTENDBYTEMEMORY(.sign_in_byte(ReadData2[7:0]), .sign_out_byte(SEout1));

	ZEROEXTENDBYTE myZEROEXTENDBYTEMEMORY(.zero_in_byte(ReadData2[7:0]), .zero_out_byte(ZEout1));

	SIGNEXTEND mySIGNEXTENDMEMORY(.sign_in(ReadData2[15:0]), .sign_out(SEout2));

	ZEROEXTEND myZEROEXTENDMEMORY(.zero_in(ReadData2[15:0]), .zero_out(ZEout2));

	MUX32bit5to1 myMUX32bit5to1MEMORY(.mux_in0(ReadData2), .mux_in1(SEout1), .mux_in2(ZEout1), .mux_in3(SEout2), .mux_in4(ZEout2), .select(MemDataSel), .out(MemoryData));

	SIGNEXTENDBYTE mySIGNEXTENDBYTEREGISTER(.sign_in_byte(MemData[7:0]), .sign_out_byte(SEout3));

	ZEROEXTENDBYTE myZEROEXTENDBYTEREGISTER(.zero_in_byte(MemData[7:0]), .zero_out_byte(ZEout3));

	SIGNEXTEND mySIGNEXTENDREGISTER(.sign_in(MemData[15:0]), .sign_out(SEout4));

	ZEROEXTEND myZEROEXTENDREGISTER(.zero_in(MemData[15:0]), .zero_out(ZEout4));

	ZEROEXTENDLUI myZEROEXTENDLUI(.zero_in_lui(Instruction[15:0]), .zero_out_lui(ZElui));

	ADDER myADDER(.Data(PCout), .Sum(PCplus1));

	MUX32bit9to1 myMUX32bit9to1MEMORYTOREGISTER(.mux_in0(PCplus1), .mux_in1(ReadData1), .mux_in2(MemData), .mux_in3(SEout3), .mux_in4(ZEout3), .mux_in5(SEout4), .mux_in6(ZEout4), .mux_in7(ZElui), .mux_in8(ALUResultTEMP[31:0]), .select(MemtoReg), .out(RegisterData));

	ADDER32bit myADDER32bit(.Data1(PCplus1), .Data2(SEout), .Sum(BranchAddress));

	MUX32bit2to1 myMUX32bit2to1BRANCH(.mux_in_1(PCplus1), .mux_in_2(BranchAddress), .sel(BranchorNot), .mux_out(NormalorBranch));

	assign JumpAddress = {PCplus1[31:26], Instruction[25:0]};

	MUX32bit3to1 myMUX32bit3to1BRANCH(.mux_in0(NormalorBranch), .mux_in1(ReadData1), .mux_in2(JumpAddress), .select(Jump), .out(PCin));

	BRANCHLOGIC myBRANCHLOGIC(.isZero(isZero), .BEQ(BEQ), .BNE(BNE), .isGreaterSigned(isGreaterSigned), .isLessSigned(isLessSigned), .BGT(BGT), .BLT(BLT), .isGreaterUnsigned(isGreaterUnsigned), .isLessUnsigned(isLessUnsigned), .BGTU(BGTU), .BLTU(BLTU), .BranchorNot(BranchorNot));

	CONTROL myCONTROL(.opcode(Instruction[31:26]), .RegDst(RegDst), .RegWrite(RegWrite), .MulorDivWrite(MulorDivWrite), .ALUOp(ALUOp), .ShiftSel(ShiftSel), .ALUSrc(ALUSrc), .MemWrite(MemWrite), .MemRead(MemRead), .MemDataSel(MemDataSel), .MemtoReg(MemtoReg), .Jump(Jump), .BEQ(BEQ), .BNE(BNE), .BGT(BGT), .BLT(BLT), .BGTU(BGTU), .BLTU(BLTU));

	SSDDECODER mySSDDECODER1(.BCD(ALUResult[3:0]), .SSD(SSD1));
	
	SSDDECODER mySSDDECODER2(.BCD(ALUResult[7:4]), .SSD(SSD2));
	
	SSDDECODER mySSDDECODER3(.BCD(ALUResult[11:8]), .SSD(SSD3));
	
	SSDDECODER mySSDDECODER4(.BCD(ALUResult[15:12]), .SSD(SSD4));
	
endmodule