module decode_reg(
  input clk,
  input [3:0]alu_opcode,
  input reg_flag,
  input [4:0]rd,
  input [31:0]rs1,
  input [31:0]rs2,
  input [31:0]immidiate_data,
  input reg_wr_en,
  output reg [3:0]alu_opout,
  output reg [4:0]rd_out,
  output  reg [31:0]op1,
  output reg [31:0]op2,
  output reg  reg_wr_en_out,
  output reg flag_out,
  output reg [31:0]data
  );
  always@(posedge clk)
  begin
    alu_opout <= alu_opcode;
    rd_out <= rd;
    op1 <= rs1;
    op2 <= rs2;
    reg_wr_en_out <= reg_wr_en;
    flag_out <= reg_flag;
  data <= immidiate_data;
  end
endmodule
