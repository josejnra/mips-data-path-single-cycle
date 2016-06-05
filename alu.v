module alu (ALUcontrole, A, B, resultado, Zero);
	input [3:0] ALUcontrole;
	input [31:0] A, B;
	output reg [31:0] resultado;
	output Zero;
	
	assign Zero = (resultado==0); //Zero é verdade se resultado é 0
	always @(ALUcontrole, A, B)
		case (ALUcontrole)
		0: resultado = A & B;
		1: resultado = A | B;
		2: resultado = A + B;
		6: resultado = A - B;
		7: resultado = A < B ? 1:0; //slt
		12: resultado = ~(A | B); // resultado é nor		
		default: resultado <= 0; //default to 0, should not happen;
	endcase
endmodule

/*
module simulaalu();
	reg [31:0] valor1, valor2;
	reg [3:0] alucontrole;
	wire [31:0] result;
	wire zero;
	
	alu inst(alucontrole, valor1, valor2, result, zero);
	
	initial begin
		$dumpfile("teste.vcd");
		$dumpvars;
		
		   valor1 = 40; valor2 = 40; alucontrole = 2;  //soma
		#4 valor1 = 40; valor2 = 40; alucontrole = 6;  //subtracao
		#4 valor1 = 40; valor2 = 40; alucontrole = 0;  //and
		#4 valor1 = 40; valor2 = 40; alucontrole = 1;  //or
		#4 valor1 = 40; valor2 = 40; alucontrole = 7;  //slt
		#4 valor1 = 40; valor2 = 12; alucontrole = 2;  //soma
		#4 valor1 = 55; valor2 = 40; alucontrole = 6;  //subtracao
		#4 valor1 = 40; valor2 = 39; alucontrole = 0;  //and
		#4 valor1 = 40; valor2 = 35; alucontrole = 1;  //or
		#4 valor1 = 40; valor2 = 50; alucontrole = 7;  //slt
		
		#3 $finish;
	end
endmodule
*/
