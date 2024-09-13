module register_file #(parameter ADDR_WIDTH = 5 ,WIDTH = 32, DEPTH = 16)( 
input clk,  //clk signal
input reg_write_en, 
input [ADDR_WIDTH-1:0] source1_reg, 
input [ADDR_WIDTH-1:0] source2_reg,
input [ADDR_WIDTH-1:0] destination_reg,
input [WIDTH-1:0] write_data,
output wire [WIDTH-1:0] read_data1, 
output wire [WIDTH-1:0] read_data2 
);	 
    
 
 reg [WIDTH-1:0] register [DEPTH-1:0];
   
 always @(posedge clk) begin
    if (reg_write_en) 
            register[destination_reg] <= write_data; //writing data into register
    end
assign read_data1 = register[source1_reg]; //reading data from register
assign read_data2 = register[source2_reg]; 
	  
	  
endmodule
