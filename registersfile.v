module registersfile (EndRS, EndRT, EndEscRD, DadoRD, ControleEsc, DadoRS, DadoRT, clock);
	input [4:0] EndRS, EndRT, EndEscRD; // enderecos de leitura e escrita
	input [31:0] DadoRD; // dado a ser escrito
	input ControleEsc, clock; // controle de escrita e o clock
	output [31:0] DadoRS, DadoRT; // conteudo dos registradores lidos
	reg [31:0] RF [0:31]; // 32 registradores de 32 bits
		
	integer i;

	//Todos registradores são iniciados com zero
	initial
		begin
			for(i = 0; i < 32; i = i + 1)
				RF[i] = 32'b0;
		end
		
	//DadoRS e DadoRT recebem os valores nos endereços EndRS e EndRT
	
	assign DadoRS = RF[EndRS];	//Operacao de leitura
	assign DadoRT = RF[EndRT];	//Operacao de leitura	

	// escreve o valor no registradores se Controle de Escrita é alto
	always @(negedge clock)begin
		if (ControleEsc) begin
			RF[EndEscRD] = DadoRD;
			//$display("dadors = %d\n", RF[EndEscRD]);
		end
	end
	
endmodule

/*
module simularegistersfile();
	reg [4:0] endrs, endrt, endescrd;
	reg [31:0] dadord;
	reg controleesc, clock = 0;
	wire [31:0] dadors, dadort;
	
	always #1 clock = !clock;
	
	registersfile insta(endrs, endrt, endescrd, dadord, controleesc, dadors, dadort, clock);
	
	initial begin
		$dumpfile("teste.vcd");
		$dumpvars;
		
		   endrs = 2; endrt = 3; controleesc = 0;  //ler
		#3 endrs = 5; endrt = 8; controleesc = 0;  //ler 
		#2 endescrd = 1; dadord = 80; controleesc = 1;  //gravar 80
		#2 endrs = 1; endrt = 2; controleesc = 0;  //ler
		#3 endescrd = 2; dadord = 55; controleesc = 1;  //gravar 55
		#4 endrs = 2; endrt = 3; controleesc = 0;  //ler
		#2 endrs = 1; endrt = 3; controleesc = 0;  //ler
		#3 endrs = 2; endrt = 3; endescrd = 1'bx; dadord = 1'bx; controleesc = 0;  //ler
		
		#5 $finish;
	end
endmodule
*/
