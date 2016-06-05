module simulacao();
	reg clock = 0;
	
	always #1 clock = !clock;
	
	/*pc*/
	wire [31:0] readAddress;
	
	pc pc(clock, novoPC, readAddress);
		
	/*instruction memory*/
	wire [31:0] Instruction;
	
	instructionmemory instructionmemory(readAddress, Instruction);
	
	/*mux1*/
	wire [4:0] WriteRegister;
	
	mux1 mux1(RegDst, Instruction[20:16], Instruction[15:11], WriteRegister);
	
	/*registerfile*/	
	wire [31:0] ReadData1, ReadData2;
	
	registersfile registersfile(Instruction[25:21], Instruction[20:16], WriteRegister, WriteData, RegWrite, ReadData1, ReadData2, clock);

	/*mux2*/	
	wire [31:0] valor2ALU;
	
	mux2 mux2(ALUSrc, ReadData2, ConstanteEstentida, valor2ALU);
	
	/*alu*/
	wire [31:0] ALUresult;
	wire Zero;
	
	alu alu(alucontrole, ReadData1, valor2ALU, ALUresult, Zero);
	
	/*datamemory*/	
	wire [31:0] ReadData;
	
	datamemory datamemory(ALUresult, ReadData2, ReadData, MemWrite, MemRead, clock);
	
	/*mux3*/
	wire [31:0] WriteData;
	
	mux3 mux3(MemtoReg, ReadData, ALUresult, WriteData);
	
	/*control*/
	wire [1:0] ALUOp;
	wire MemRead, MemWrite, MemtoReg, RegDst, RegWrite, ALUSrc, Branch;
	
	control control(Instruction[31:26], ALUOp, MemRead, MemWrite, MemtoReg, RegDst, RegWrite, ALUSrc, Branch);
	
	/*signextend*/
	wire [31:0] ConstanteEstentida;
	
	signextend signextend(Instruction[15:0], ConstanteEstentida);
	
	/*alucontrol*/
	wire [3:0] alucontrole;
	
	alucontrol alucontrol(ALUOp, Instruction[5:0], alucontrole);
	
	/*pcmais4*/
	wire [31:0] pc4;
	
	pcmais4 pcmais4(readAddress, pc4);
	
	/*shiftleft2*/
	wire [31:0] ConstanteEstendidaDeslocada;
  
	shiftleft shiftleft(ConstanteEstentida, ConstanteEstendidaDeslocada);
	
	/*addalu*/
	wire [31:0] Addresult;
	
	addalu addalu(ConstanteEstendidaDeslocada, pc4, Addresult);
	
	/*portaand*/
	wire controleMux4;
	
	portaand portaand(Branch, Zero, controleMux4);
	
	/*mux4*/	
	wire [31:0] novoPC;
	
	mux4 mux4(controleMux4, pc4, Addresult, novoPC);
	
	/*assign readAddress = 40;*/
		
	
	initial
	begin
		$dumpfile ("Ondas - Caminho de Dados.vcd");
		$dumpvars;
		
		#100 $finish;
		
	end	
endmodule
