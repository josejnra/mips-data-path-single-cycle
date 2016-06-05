module addalu(valorEstendidoDeslocado, pcincrementado, Addresult);
	input [31:0] valorEstendidoDeslocado, pcincrementado;
	output [31:0] Addresult;
	
	assign Addresult = valorEstendidoDeslocado + pcincrementado;	
endmodule

/*
module simulaaddalu();
	reg [31:0] valorEstendidoDeslocado, pcincrementado;
	wire [31:0] Addresult;	

	addalu inst(valorEstendidoDeslocado, pcincrementado, Addresult);
	
	initial begin
		$dumpfile("teste.vcd");
		$dumpvars;
		
		   valorEstendidoDeslocado = 50; pcincrementado = 40;
		#4 valorEstendidoDeslocado = 50*4; pcincrementado = 44;
		#4 valorEstendidoDeslocado = 60; pcincrementado = 48;
		#4 valorEstendidoDeslocado = 70; pcincrementado = 52;
		#4 valorEstendidoDeslocado = 80; pcincrementado = 56;
		#4 valorEstendidoDeslocado = 90; pcincrementado = 60;
		#4 valorEstendidoDeslocado = 91; pcincrementado = 64;
		#4 valorEstendidoDeslocado = 95; pcincrementado = 68;
		
		#5 $finish;
	end
endmodule
*/
