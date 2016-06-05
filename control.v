module control(Opcode, ALUOp, MemRead, MemWrite, MemtoReg, RegDst, RegWrite, ALUSrc, Branch);

	input wire [5:0] Opcode; 
	output reg [1:0] ALUOp;
	output reg MemRead;
	output reg MemWrite; 
	output reg MemtoReg; 
	output reg RegDst;
	output reg RegWrite; 
	output reg ALUSrc;
	output reg Branch;
	
always @(*)
	begin
		/*valores padrões - tipo R*/
		ALUOp[1:0] = 2'b10;
		ALUSrc = 0;
		MemRead = 0;
		MemtoReg = 0;
		MemWrite = 0;
		RegDst = 1;
		RegWrite = 1;
		Branch = 0;
		case(Opcode)
			6'b100011: begin //lw
				RegDst = 0;
				ALUOp = 0;
				ALUSrc = 1;
				MemtoReg = 1;
				RegWrite = 1;
				MemRead = 1;
				MemWrite = 0;
				Branch = 0;
				end
			6'b001000: begin //addi
				RegDst = 0;
				ALUOp = 0;
				ALUSrc = 1;
				MemtoReg = 0;
				RegWrite = 1;
				MemRead = 0;
				MemWrite = 0;
				Branch = 0;
				end
			6'b101011: begin //sw
				RegDst = 1'bx;
				ALUOp = 0;
				ALUSrc = 1;
				MemtoReg = 1'bx;
				RegWrite = 0;
				MemRead = 0;
				MemWrite = 1;
				Branch = 0;
				end
			6'b000000: begin //tipo R
				RegDst = 1;
				ALUOp = 2'b10;
				ALUSrc = 0;
				MemtoReg = 0;
				RegWrite = 1;
				MemRead = 0;
				MemWrite = 0;
				Branch = 0;
				end
			6'b000100: begin //beq
				RegDst = 1'bx;
				ALUOp = 2'b01;
				ALUSrc = 0;
				MemtoReg =1'bx;
				RegWrite = 0;
				MemRead = 0;
				MemWrite = 0;
				Branch = 1;
				end
		endcase
	end
endmodule

/*
module simulacontrol();
	
	reg [5:0] Opcode; 
	wire [1:0] ALUOp;
	wire MemRead;
	wire MemWrite; 
	wire MemtoReg; 
	wire RegDst;
	wire RegWrite; 
	wire ALUSrc;
	wire Branch;
	
	control inst(Opcode, ALUOp, MemRead, MemWrite, MemtoReg, RegDst, RegWrite, ALUSrc, Branch);
	
	initial begin
		$dumpfile("teste.vcd");
		$dumpvars;
		
		   Opcode = 0; //opcode de add
		#4 Opcode = 0; //opcode de or
		#4 Opcode = 35; //opcode de lw
		#4 Opcode = 43; //opcode de sw
		#4 Opcode = 0; //opcode de subtract
		#4 Opcode = 0; //opcode de nor
		#4 Opcode = 0; //opcode de and
		#4 Opcode = 0; //opcode de slt
		#4 Opcode = 4; //opcode de beq
		#4 Opcode = 8; //opcode de addi
		#4 Opcode = 10; //opcode de addi
		#3 $finish;
	end
endmodule
*/
