`include "../Cpu_Pipelined_top.v"
module tb_program_memory();
  reg clk;
  reg [11:0] address;
  wire [31:0] instruction;

  program_memory #(.DEPTH(4096), .WIDTH(32), .ADDR_WIDTH(12)) pm (
    .clk(clk),
    .address(address),
    .instruction(instruction)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    address = 12'b000000000000;
    #10 $display("Instruction at Address %d: %b", address, instruction);
    address = 12'b000000000001;
    #10 $display("Instruction at Address %d: %b", address, instruction);
    address = 12'b000000000100;
    #10 $display("Instruction at Address %d: %b", address, instruction);

    $finish;
  end
endmodule

