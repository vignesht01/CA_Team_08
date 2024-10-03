`include "../Cpu_Pipelined_top.v"
module tb_register_file();
  reg clk, reg_write_en;
  reg [4:0] source1_reg, source2_reg, destination_reg;
  reg [31:0] write_data;
  wire [31:0] read_data1, read_data2;

  register_file #(5, 32, 16) rf (
    .clk(clk),
    .reg_write_en(reg_write_en),
    .source1_reg(source1_reg),
    .source2_reg(source2_reg),
    .destination_reg(destination_reg),
    .write_data(write_data),
    .read_data1(read_data1),
    .read_data2(read_data2)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    reg_write_en = 1;
    destination_reg = 5'd1;
    write_data = 32'd100;
    #10 $display("Write to Reg1: %d", write_data);

    reg_write_en = 0;
    source1_reg = 5'd1;
    source2_reg = 5'd1;
    #10 $display("Read from Reg1: %d, Reg2: %d", read_data1, read_data2);

    $finish;
  end
endmodule




