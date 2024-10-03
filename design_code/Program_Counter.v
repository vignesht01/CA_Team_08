module PC #(parameter ADDR_WIDTH = 12) (
    input clk,    //clk signal for pc
    input reset,   //reset signal for pc
    output [ADDR_WIDTH-1:0] pc_out    //output 
);
    reg [ADDR_WIDTH-1:0] pc_reg;
    always @(posedge clk ) begin
        if (reset) begin
            pc_reg <= 12'b0;  
        end else begin
            pc_reg <= pc_reg + 1'b1; //pc incremented by 1
        end
    end
    assign pc_out = pc_reg; //pc reg value assigned to pc_out
endmodule
 
