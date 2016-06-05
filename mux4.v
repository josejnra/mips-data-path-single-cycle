module mux4(controleMux, pcincrementado, Addresult, novoPC);
	input [31:0] pcincrementado, Addresult;
	input controleMux;
	output reg [31:0] novoPC;
	
	
	always @(controleMux or pcincrementado or Addresult) begin
		begin
		if((Addresult >= 0) & (pcincrementado >= 0))
			if(controleMux)
				novoPC = Addresult;
			else
				novoPC = pcincrementado;
			
		else
			novoPC = 0;
		end
	end
	
endmodule

/*
module simulamux4();
	reg [31:0] pcincrementado, Addresult;
	reg controleMux;
	wire [31:0] novoPC;
	
	mux4 inst(controleMux, pcincrementado, Addresult, novoPC);
	
	initial begin
		$dumpfile("teste.vcd");
		$dumpvars;
		
		    pcincrementado = 123; Addresult = 146; controleMux = 1;
		#4  pcincrementado = 153; Addresult = 9431; controleMux = 1;
		#4  pcincrementado = 1763; Addresult = 76; controleMux = 0;
		#4  pcincrementado = 161; Addresult = 457; controleMux = 1;
		#4  pcincrementado = 1432; Addresult = 8732; controleMux = 0;
		#4  pcincrementado = 1613; Addresult = 8327; controleMux = 1;
		#4  pcincrementado = 151; Addresult = 854; controleMux = 0;
		#4  pcincrementado = 161; Addresult = 8134; controleMux = 0;
		#4  pcincrementado = 658; Addresult = 14711; controleMux = 1;
		#4  pcincrementado = 942; Addresult = 8653; controleMux = 0;
		
		#3 $finish;
	end
endmodule
*/
