`include "Cpu_Pipelined_top.v"
module pipelined_cpu_tb;

	reg clk;
	reg reset;
		
	wire [31:0]result;

	cpu_pipelined DUT(.clk(clk),.reset(reset),.result(result));

	initial begin
		clk=0;
		reset=0;


		forever #20 clk=~clk;
	end

	initial begin
		reset=1;
		#50 reset=0;
		$finish;
	end
endmodule
