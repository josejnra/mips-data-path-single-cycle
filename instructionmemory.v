module instructionmemory(address, instruction);

	input [31:0] address;
	output [31:0] instruction;
	reg [7:0] memoria [0:8192];  //memoria com 8192 bytes
	integer i;

	initial
	begin
		//Inicializa memoria com valores 0
		for (i = 0; i < 8192; i = i+1) memoria[i] = 32'b0;
		      
		/*memoria[40]    = 32'b00100000000010000000000000000010; //addi $t0, $0, 2
		memoria[44]    = 32'b00100000000010010000000000000010; //addi $t1, $0, 2
		memoria[48]    = 32'b00010001000010010000000000000010; //branch
		memoria[52]    = 32'b00100000000010100000000000000010; //addi $t2, $0, 2
		memoria[56]    = 32'b00100000000011000000000000000001; //addi $t3, $0, 1
		memoria[60]    = 32'b00100000000011010000000000000011; //addi $t4, $0, 3
		memoria[64]    = 32'b00100000000010000000000000000010; //addi $t0, $0, 2
		memoria[68]    = 32'b10101101101010000000011111010000; //sw $t4(rs),$t0(rt)
		memoria[72]    = 32'b10001101101010000000011111010000; //lw $t0(rs) ,$t4(rt)
		memoria[76]    = 32'b10001110000010000000010010110000; //lw $t0, 1200($s0)
		memoria[80]    = 32'b10001101001010000000010010101110; //lw $t0, 1198($t1)
		*/
		
		
		//lendo instrucoes de um arquivo .txt
		$readmemb("bancodeinstrucoes.txt", memoria);
						
	end

	assign instruction = {memoria[address], memoria[address+1], memoria[address+2], memoria[address+3]};
	
endmodule

/*
module simulainstructionmemory();
	reg [31:0] endereco;
	wire [31:0] instrucao;
	integer i;
	
	instructionmemory inst(endereco, instrucao);
	
	initial begin
		$dumpfile("teste.vcd");
		$dumpvars;
		
		i = 0;
		endereco = 0;			
		for (i = 4; i < 256; i = i+4) begin
			#1 endereco = i;
		end
			
		#5 $finish;
	end
endmodule
*/
