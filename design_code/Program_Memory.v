module program_memory #(parameter DEPTH = 4096 ,WIDTH= 32, ADDR_WIDTH = 12 ) (
input clk, 
input [ADDR_WIDTH-1:0]address,
output reg [WIDTH-1:0]instruction
);
reg [WIDTH-1:0] memory [DEPTH-1:0];
 // Loading instructions into program memory
    always@(posedge clk) begin
     
		 
		 
		 memory[0] <= 32'b00000000000000001010_00001_0000011;// LOAD_IMM R1, 5
		 memory[1] <= 32'b00000000000000001010_00010_0000011;// LOAD_IMM R1, 7
       memory[2] <= 32'b00000000_0000000000_0000000000000;
       memory[3] <=32'b1000000_000000000_0000000000000000;		  
       memory[4] <= 32'b0000000_00001_00010_000_00011_0110011; // ADD R3, R1, R2
		 memory[5] <= 32'b0100000_00001_00010_000_00100_0110011; //sub 
		 memory[6] <= 32'b0000000_00001_00010_110_00101_0110011; //and
		 memory[7] <= 32'b0000000_00001_00010_111_00110_0110011; //or
		 memory[8] <= 32'b0000000_00001_00010_100_00111_0110011; //xor
       memory[9] <= 32'b10000000000000000000000000000000;			
		 //memory[8] <= 32'b0000000_00001_00010_100_01000_0110011; //xor
		 memory[10] <= 32'b10000000000000000000000000000000;
		 memory[11] <= 32'b10000000000000000000000000000000;
       end
		 
		 always@(posedge clk)
		 begin
		 instruction <= memory[address];
		 end
endmodule
