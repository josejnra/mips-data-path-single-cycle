module pc (clock, novoPC, address);
	input clock;
	input [31:0] novoPC;
	output reg [31:0] address;
	
	always @(posedge clock)
		begin
			address = novoPC;
		end

endmodule

/*
module simulapc();
	reg clock = 0;
	reg [31:0] pcMux;
	wire [31:0] address;

	pc inst(clock, pcMux, address);
	
	always #3 clock = !clock;
	
	initial begin
		$dumpfile("teste.vcd");
		$dumpvars;
		
		   pcMux = 40;
		#4 pcMux = 44;
		#4 pcMux = 48;
		#4 pcMux = 52;
		#4 pcMux = 56;
		#4 pcMux = 60;
		#4 pcMux = 64;
		#4 pcMux = 68;
		#4 pcMux = 72;
		
		#5 $finish;
	end
endmodule
*/
