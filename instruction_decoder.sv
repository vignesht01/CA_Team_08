module instruction_decoder(
  input [31:0] instruction,    // 32-bit instruction input
  output reg[6:0] opcode, 
  output  reg[4:0] destination_reg,
output  reg[2:0]func3,
  output reg[4:0]source1_reg,
  output reg[4:0]source2_reg,
  output reg[6:0]func7,
  output reg[19:0]immediate_data
);
 always@(*)
    begin
      
      opcode = instruction[6:0];
      destination_reg = instruction[11:7];
      func3 = instruction[14:12];
      source1_reg = instruction[19:15];
      source2_reg = instruction[24:20];
      func7 = instruction[31:25];        
      immediate_data = instruction[31:12];
    end

endmodule
