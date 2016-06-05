module mux3(MemtoReg, ReadData, ALUresult, WriteData);
	input [31:0] ReadData, ALUresult;
	input MemtoReg;
	output reg [31:0] WriteData;
	
	/*Determina qual dado será gravado no banco de registradores:
	 *se é o resultado da ALU então será o ReadData;
	 *se é o dado lido da memoria será o ALUresult;
	 */
	always @(ReadData or ALUresult or MemtoReg) begin
		if(MemtoReg)
			WriteData = ReadData;
		else
			WriteData = ALUresult;
	end
	
endmodule

/*
module simulamux3();
	reg [31:0] ReadData, ALUresult;
	reg MemtoReg;
	wire [31:0] WriteData;
	
	mux3 inst(MemtoReg, ReadData, ALUresult, WriteData);
	
	initial begin
		$dumpfile("teste.vcd");
		$dumpvars;
		
		    ReadData = 123; ALUresult = 146; MemtoReg = 1;
		#4  ReadData = 153; ALUresult = 9431; MemtoReg = 1;
		#4  ReadData = 176533; ALUresult = 76; MemtoReg = 0;
		#4  ReadData = 161; ALUresult = 457; MemtoReg = 1;
		#4  ReadData = 1432; ALUresult = 8732; MemtoReg = 0;
		#4  ReadData = 1613; ALUresult = 8327; MemtoReg = 1;
		#4  ReadData = 151; ALUresult = 854; MemtoReg = 0;
		#4  ReadData = 161; ALUresult = 8134; MemtoReg = 0;
		#4  ReadData = 658; ALUresult = 14711; MemtoReg = 1;
		#4  ReadData = 942; ALUresult = 8653; MemtoReg = 0;
		
		#3 $finish;
	end
endmodule
*/
