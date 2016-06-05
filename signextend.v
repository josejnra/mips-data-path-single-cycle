module signextend(entrada, saida);
	input [15:0] entrada;
	output reg [31:0] saida;

	//sempre que o sinal de entrada mudar
	always@ (entrada)
	begin
		saida = {16'b0000_0000_0000_0000, entrada};
	end
	
endmodule

/*
module simulasignextend();
	reg [15:0] entrada;	
	wire [31:0] saida;
	
	signextend inst(entrada, saida);
	
	initial begin
		$dumpfile("teste.vcd");
		$dumpvars;
		
		   entrada = 7;
		#4 entrada = 15;
		#4 entrada = 31;
		#4 entrada = 63;
		#4 entrada = 64;
		#4 entrada = 32;
		#4 entrada = 511;
		#4 entrada = 255;
		#4 entrada = 512;
		#4 entrada = 256;
		
		#3 $finish;
	end
endmodule
*/
