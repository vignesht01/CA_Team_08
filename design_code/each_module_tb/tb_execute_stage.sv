`include "../Cpu_Pipelined_top.v"
module tb_execute_stage;

  reg clk;
  reg reg_flag;
  reg [31:0] result;
  reg reg_wr_en;
  reg [4:0] rd;
  reg [31:0] data_in;
  
  wire reg_wr_en2;
  wire [4:0] rd_out;
  wire [31:0] data_out;
  wire [31:0] write_data;
  wire flag_out;

  execute_stage uut (
    .clk(clk),
    .reg_flag(reg_flag),
    .result(result),
    .reg_wr_en(reg_wr_en),
    .rd(rd),
    .data_in(data_in),
    .reg_wr_en2(reg_wr_en2),
    .rd_out(rd_out),
    .data_out(data_out),
    .write_data(write_data),
    .flag_out(flag_out)
  );

  initial begin
    clk = 0;
    reg_flag = 0;
    result = 32'h00000000;
    reg_wr_en = 0;
    rd = 5'b00000;
    data_in = 32'h00000000;

    #5;
    reg_flag = 1;
    result = 32'hAAAAAAAA;
    reg_wr_en = 1;
    rd = 5'b10010;
    data_in = 32'h55555555;

    #10;
    reg_flag = 0;
    result = 32'h12345678;
    reg_wr_en = 1;
    rd = 5'b01100;
    data_in = 32'h87654321;

    #10 $finish;
  end

  always #5 clk = ~clk;

  always @(posedge clk) begin
    $display("Time: %0t | reg_flag: %b | result: %h | reg_wr_en: %b | rd: %b | data_in: %h",
             $time, reg_flag, result, reg_wr_en, rd, data_in);
    $display("Outputs: reg_wr_en2: %b | rd_out: %b | data_out: %h | write_data: %h | flag_out: %b",
             reg_wr_en2, rd_out, data_out, write_data, flag_out);
    $display("-------------------------------------------------------------");
  end

endmodule

