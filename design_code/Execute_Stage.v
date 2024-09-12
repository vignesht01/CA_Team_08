module execute_stage(
input clk,
input reg_flag,
input [31:0]result,
input reg_wr_en,
input [4:0]rd,
input [31:0]data_in,	
output reg reg_wr_en2,
output reg  [4:0]rd_out,
output  reg [31:0]data_out,
output reg[31:0]write_data,
output reg flag_out
);

always@(posedge clk)
begin
flag_out <= reg_flag;
reg_wr_en2 <= reg_wr_en;
rd_out <= rd;
data_out <= data_in;
write_data <= result;
end
endmodule

