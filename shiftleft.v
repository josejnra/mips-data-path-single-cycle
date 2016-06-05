module shiftleft(entrada, saida);
  
  input [31:0] entrada;
  output reg [31:0] saida;
  
  always @(entrada)
    begin
      saida = entrada << 2;
    end
   
endmodule    

/*
module simulashiftleft();
	reg [31:0] entrada;	
	wire [31:0] saida;
	
	shiftleft inst(entrada, saida);
	
	initial begin
		$dumpfile("teste.vcd");
		$dumpvars;
		
		   entrada = 1;
		#4 entrada = 2;
		#4 entrada = 3;
		#4 entrada = 4;
		#4 entrada = 5;
		#4 entrada = 6;
		#4 entrada = 7;
		#4 entrada = 8;
		#4 entrada = 9;
		#4 entrada = 10;
		
		#3 $finish;
	end
endmodule
*/
