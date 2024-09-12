module fetch_stage #(parameter WIDTH = 32)(  
input [WIDTH-1:0] input1,
input clk,
output reg[WIDTH-1:0]output1
);
always@(posedge clk)
begin
output1 <= input1;
end

endmodule
