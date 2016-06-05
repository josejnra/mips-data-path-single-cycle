module pcmais4(pc, saida);
	input [31:0] pc;
	output [31:0] saida;
	
	/*pc é um endereço
	 *saida é o pc+4*/
	assign saida = pc + 4;
	
endmodule

/*
module simulapcmais4();
	reg [31:0] pc;
	wire [31:0] saida;
	
	pcmais4 inst(pc, saida);
	
	initial begin
		$dumpfile("teste.vcd");
		$dumpvars;
		
		   pc = 40;
		#4 pc = 44;
		#4 pc = 48;
		#4 pc = 52;
		#4 pc = 56;
		#4 pc = 60;
		#4 pc = 64;
		#4 pc = 68;
		#4 pc = 72;
		
		#4 $finish;
	end
endmodule
*/
