// -------------------------------------------------------------------
// Copyright (C) 2020-2026 Rasheed Kibria 
// All rights reserved.
// This Verilog code is provided for educational and research purposes.
// -------------------------------------------------------------------

module BRANCHLOGIC (isZero, BEQ, BNE, isGreaterSigned, isLessSigned, BGT, BLT, isGreaterUnsigned, isLessUnsigned, BGTU, BLTU, BranchorNot);
	input isZero, BEQ, BNE, isGreaterSigned, isLessSigned, BGT, BLT, isGreaterUnsigned, isLessUnsigned, BGTU, BLTU;
	output BranchorNot;

	assign BranchorNot = ((isZero & BEQ) | ((~isZero) & BNE) | (isGreaterSigned & BGT) | (isLessSigned & BLT) | (isGreaterUnsigned & BGTU) | (isLessUnsigned & BLTU));

endmodule