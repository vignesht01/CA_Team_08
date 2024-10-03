`include "../Cpu_Pipelined_top.v"
module tb_decode_reg;

  reg clk;
  reg [3:0] alu_opcode;
  reg reg_flag;
  reg [4:0] rd;
  reg [31:0] rs1;
  reg [31:0] rs2;
  reg [31:0] immidiate_data;
  reg reg_wr_en;

  wire [3:0] alu_opout;
  wire [4:0] rd_out;
  wire [31:0] op1;
  wire [31:0] op2;
  wire reg_wr_en_out;
  wire flag_out;
  wire [31:0] data;

  decode_reg uut (
    .clk(clk),
    .alu_opcode(alu_opcode),
    .reg_flag(reg_flag),
    .rd(rd),
    .rs1(rs1),
    .rs2(rs2),
    .immidiate_data(immidiate_data),
    .reg_wr_en(reg_wr_en),
    .alu_opout(alu_opout),
    .rd_out(rd_out),
    .op1(op1),
    .op2(op2),
    .reg_wr_en_out(reg_wr_en_out),
    .flag_out(flag_out),
    .data(data)
  );

  initial begin
    clk = 0;
    alu_opcode = 4'b0000;
    reg_flag = 0;
    rd = 5'b00000;
    rs1 = 32'h00000000;
    rs2 = 32'h00000000;
    immidiate_data = 32'h00000000;
    reg_wr_en = 0;

    #5;
    alu_opcode = 4'b1010;
    reg_flag = 1;
    rd = 5'b10001;
    rs1 = 32'h00000001;
    rs2 = 32'h00000010;
    immidiate_data = 32'h11111111;
    reg_wr_en = 1;

    #10;
    alu_opcode = 4'b0101;
    reg_flag = 0;
    rd = 5'b01010;
    rs1 = 32'h00000011;
    rs2 = 32'h00000100;
    immidiate_data = 32'h22222222;
    reg_wr_en = 1;

    #10 $finish;
  end

  always #5 clk = ~clk;

  always @(posedge clk) begin
    $display("Time: %0t | alu_opcode: %b | rd: %b | rs1: %h | rs2: %h | immidiate_data: %h | reg_wr_en: %b",
             $time, alu_opcode, rd, rs1, rs2, immidiate_data, reg_wr_en);
    $display("Decoded: alu_opout: %b | rd_out: %b | op1: %h | op2: %h | reg_wr_en_out: %b | flag_out: %b | data: %h",
             alu_opout, rd_out, op1, op2, reg_wr_en_out, flag_out, data);
    $display("-------------------------------------------------------------");
  end

endmodule

