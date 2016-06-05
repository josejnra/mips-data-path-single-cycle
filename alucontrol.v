module alucontrol (ALUOp, codigoFuncao, ALUcontrole);
	input [1:0] ALUOp;
	input [5:0] codigoFuncao;
	output reg [3:0] ALUcontrole;
	
	always @(*) begin
		case(ALUOp)
			0: ALUcontrole <= 2;  //lw, sw....nao possuem o campo funct
			1: ALUcontrole <= 6; //branch
			2: begin  
                      if(codigoFuncao == 32)
                        ALUcontrole <= 2; //add	
                        
                      else if(codigoFuncao == 34) 
                        ALUcontrole <= 6; //subtract	
                      
                      else if(codigoFuncao == 37)
                        ALUcontrole <= 1; //or
                      
                      else if(codigoFuncao == 39)
                        ALUcontrole <= 12; //nor
                        
                      else if(codigoFuncao == 36)
                        ALUcontrole <= 0; //and	
                      
                      else if(codigoFuncao == 42)
                        ALUcontrole <= 7;  //slt
                      
                      else
                        ALUcontrole <= 2; //add
                      end
			
		default: ALUcontrole <= 2; //add
		endcase
	end
	
	/*always @(*) begin
		case(codigoFuncao)
			32: ALUcontrole = 2; // add
			34: ALUcontrole = 6; //subtract
			36: ALUcontrole = 0; // and
			37: ALUcontrole = 1; // or
			39: ALUcontrole = 12; // nor
			42: ALUcontrole = 7; // slt
			default: ALUcontrole = 15; // Não devia acontecer
		endcase
	end*/
endmodule

/*
module simulaalucontrol();
	reg [1:0] aluop;
	reg [5:0] codfunct;
	wire [3:0] alucontrole;
	
	alucontrol inst(aluop, codfunct, alucontrole);
	
	initial begin
		$dumpfile("teste.vcd");
		$dumpvars;
		
		   aluop = 0; codfunct = 1'bx; //operacao lw, sw
		#4 aluop = 1; codfunct = 1'bx; //operacao beq
		#4 aluop = 2; codfunct = 6'b100000; //operacao add
		#4 aluop = 2; codfunct = 6'b100010; //operacao subtract
		#4 aluop = 2; codfunct = 6'b100100; //operacao and
		#4 aluop = 2; codfunct = 6'b100101; //operacao or
		#4 aluop = 2; codfunct = 39; //operacao or
		#4 aluop = 2; codfunct = 6'b101010; //operacao slt
		
		#3 $finish;
	end
endmodule
*/
