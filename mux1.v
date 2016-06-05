module mux1(RegDst, EndRT, pedacoInstrucao, EndEscRD);
	input [4:0] EndRT, pedacoInstrucao;
	input RegDst;
	output reg [4:0] EndEscRD;
	
	always @(EndRT or RegDst or pedacoInstrucao) begin
		if(RegDst)
			EndEscRD = pedacoInstrucao;
		else
			EndEscRD = EndRT;
	end
	
endmodule

/*
module simulamux1();
	reg [4:0] EndRT, pedacoInstrucao;
	reg RegDst;
	wire [4:0] EndEscRD;
	
	mux1 inst(RegDst, EndRT, pedacoInstrucao, EndEscRD);
	
	initial begin
		$dumpfile("teste.vcd");
		$dumpvars;
		
		   EndRT = 7; pedacoInstrucao = 8; RegDst = 1;
		#4 EndRT = 31; pedacoInstrucao = 9; RegDst = 0;
		#4 EndRT = 15; pedacoInstrucao = 16; RegDst = 0;
		#4 EndRT = 2; pedacoInstrucao = 17; RegDst = 1;
		#4 EndRT = 29; pedacoInstrucao = 11; RegDst = 1;
		#4 EndRT = 26; pedacoInstrucao = 3; RegDst = 1;
		#4 EndRT = 18; pedacoInstrucao = 7; RegDst = 0;
		#4 EndRT = 9; pedacoInstrucao = 10; RegDst = 1;
		#4 EndRT = 10; pedacoInstrucao = 11; RegDst = 0;
		#4 EndRT = 17; pedacoInstrucao = 13; RegDst = 1;
		
		#3 $finish;
	end
endmodule
*/
