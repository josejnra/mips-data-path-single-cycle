module mux2(ALUSrc, ReadData2, instrucaoEstendida, valor2ALU);
	input [31:0] ReadData2, instrucaoEstendida;
	input ALUSrc;
	output reg [31:0] valor2ALU;
	
	always @(ReadData2 or instrucaoEstendida or ALUSrc) begin
		if(ALUSrc)
			valor2ALU = instrucaoEstendida;
		else
			valor2ALU = ReadData2;
	end
	
endmodule

/*
module simulamux2();
	reg [31:0] ReadData2, instrucaoEstendida;
	reg ALUSrc;
	wire [31:0] valor2ALU;
	
	mux2 inst(ALUSrc, ReadData2, instrucaoEstendida, valor2ALU);
	
	initial begin
		$dumpfile("teste.vcd");
		$dumpvars;
		
		    ReadData2 = 123; instrucaoEstendida = 146; ALUSrc = 1;
		#4  ReadData2 = 153; instrucaoEstendida = 9431; ALUSrc = 1;
		#4  ReadData2 = 176533; instrucaoEstendida = 76; ALUSrc = 0;
		#4  ReadData2 = 161; instrucaoEstendida = 457; ALUSrc = 1;
		#4  ReadData2 = 1432; instrucaoEstendida = 8732; ALUSrc = 0;
		#4  ReadData2 = 1613; instrucaoEstendida = 8327; ALUSrc = 1;
		#4  ReadData2 = 151; instrucaoEstendida = 854; ALUSrc = 0;
		#4  ReadData2 = 161; instrucaoEstendida = 8134; ALUSrc = 0;
		#4  ReadData2 = 658; instrucaoEstendida = 14711; ALUSrc = 1;
		#4  ReadData2 = 942; instrucaoEstendida = 8653; ALUSrc = 0;
		
		#3 $finish;
	end
endmodule
*/
