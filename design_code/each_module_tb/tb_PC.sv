`include "../Cpu_Pipelined_top.v"
module tb_PC;
  reg clk;
  reg reset;
  wire [11:0] pc_out;

  PC #(.ADDR_WIDTH(12)) uut (
    .clk(clk),
    .reset(reset),
    .pc_out(pc_out)
  );

  initial begin
    $monitor("At time %0t, reset = %b, PC = %d", $time, reset, pc_out); 
    clk = 0;
    reset = 1;
    #10 reset = 0;  
    #100 $finish;
  end

  always #5 clk = ~clk;  
endmodule

