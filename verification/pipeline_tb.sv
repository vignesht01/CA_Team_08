`include "Cpu_Pipeline_top.v"
module pipelined_cpu_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [31:0] result;

	// Instantiate the Unit Under Test (UUT)
	cpu_pipelined uut (
		.clk(clk), 
		.reset(reset), 
		.result(result)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
	
		
		forever #20 clk = !clk;
        
		// Add stimulus here

	end
	initial begin
	reset = 1;
	#50 reset = 0;
	$finish;
	end
	
      
endmodule
