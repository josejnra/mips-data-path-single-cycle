module datamemory (Address, WriteData, ReadData, MemWrite, MemRead, clock);
	/*WriteData é o dado do segundo registrador lido do banco de registradores*/
	input [31:0] Address, WriteData; 
	
	/*Opcode de lw e sw*/
	input MemWrite, MemRead;

	input clock;
	
	/*Em caso de leitura, o valor será recebido por ReadData*/
	output reg [31:0] ReadData;
	
	/*Memória de Dado*/
	reg [7:0] memoriaDeDados [0:8192]; //memoria com 8192 bytes
	
	integer i;

	initial
	begin
		//Inicializa memoria com valores 0
		for (i = 0; i < 8192; i = i+1) memoriaDeDados[i] = 32'b0;
		      
		//iniciando com alguns valores      
		memoriaDeDados[43]    = 100; 
		memoriaDeDados[47]    = 99; 
		memoriaDeDados[51]    = 12;
		memoriaDeDados[55]    = 76;
		memoriaDeDados[59]    = 15;
		memoriaDeDados[63]    = 12;
		memoriaDeDados[67]    = 11;
		memoriaDeDados[71]    = 1;
		memoriaDeDados[75]    = 7;
		memoriaDeDados[79]    = 4;
		memoriaDeDados[303]   = 35;
		memoriaDeDados[1203]  = 150;
		memoriaDeDados[4803]  = 200;
		
		
		$readmemb("bancodememoria.txt", memoriaDeDados);
		
	end
	
	always @(clock) begin
		//escrevendo na memoria
		if(MemWrite)begin
			memoriaDeDados[Address] = WriteData[31:24];
			memoriaDeDados[Address+1] = WriteData[23:16];
			memoriaDeDados[Address+2] = WriteData[15:8];
			memoriaDeDados[Address+3] = WriteData[7:0];
			end
		//lendo da memoria
		if(MemRead)
			ReadData[31:24] = memoriaDeDados[Address];
			ReadData[23:16] = memoriaDeDados[Address+1];
			ReadData[15:8] = memoriaDeDados[Address+2];
			ReadData[7:0] = memoriaDeDados[Address+3];
	end

endmodule

/*
module simuladatamemory();
	reg [31:0] endereco, dadoparaescrever;
	wire [31:0] dadolido;
	reg memwrite, memread, clock = 1;
	integer i;
	
	always #1 clock = !clock;
	
	datamemory inst(endereco, dadoparaescrever, dadolido, memwrite, memread, clock);
	
	initial begin
		$dumpfile("teste.vcd");
		$dumpvars;
		
		//teste leitura
			endereco = 0;  memwrite = 0; memread = 1; //ler		
		for (i = 4; i < 256; i = i+4) begin
			#2 endereco = i; memwrite = 0; memread = 1;  //ler
		end
		
		//teste gravação
		#2 endereco = 0; memwrite = 1; memread = 0;  dadoparaescrever = 99;  //gravar
		for (i = 4; i < 256; i = i+4) begin
			#2 endereco = i; memwrite = 1; memread = 0;  dadoparaescrever = 80;  //gravar
		end
		
		
		//teste leitura
			endereco = 0;  memwrite = 0; memread = 1; //ler		
		for (i = 4; i < 256; i = i+4) begin
			#2 endereco = i; memwrite = 0; memread = 1;  //ler
		end
				
		#5 $finish;
	end
endmodule
*/
