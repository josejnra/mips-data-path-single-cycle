module portaand(branch, zero, controleMux);
	input branch, zero;
	output controleMux;
	
	assign controleMux = branch & zero;
endmodule

/*
module simulaportaand();
	reg branch, zero;
	wire controleMux;	

	portaand inst(branch, zero, controleMux);
	
	initial begin
		$dumpfile("teste.vcd");
		$dumpvars;
		
		   branch = 1; zero = 1;
		#4 branch = 1; zero = 0;
		#4 branch = 0; zero = 1;
		#4 branch = 0; zero = 0;
		
		#5 $finish;
	end
endmodule
*/
