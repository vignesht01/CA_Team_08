`include "../Cpu_Pipelined_top.v"
module tb_instruction_decoder;
  reg [31:0] instruction;
  wire [6:0] opcode;
  wire [4:0] destination_reg;
  wire [2:0] func3;
  wire [4:0] source1_reg;
  wire [4:0] source2_reg;
  wire [6:0] func7;
  wire [19:0] immediate_data;

  instruction_decoder uut (
    .instruction(instruction),
    .opcode(opcode),
    .destination_reg(destination_reg),
    .func3(func3),
    .source1_reg(source1_reg),
    .source2_reg(source2_reg),
    .func7(func7),
    .immediate_data(immediate_data)
  );

  initial begin
    $monitor("At time %0t, instruction = %b, opcode = %b, destination_reg = %d, func3 = %b, source1_reg = %d, source2_reg = %d, func7 = %b, immediate_data = %b", 
             $time, instruction, opcode, destination_reg, func3, source1_reg, source2_reg, func7, immediate_data);

    instruction = 32'b00000000000100001000001110110011; // R-type: ADD (opcode = 0110011)
    #10;
    
    instruction = 32'b01000000000100001000001110110011; // R-type: SUB (opcode = 0110011, func7 = 0100000)
    #10;
    
    instruction = 32'b00000000001000001001000010000011; // I-type: LOAD (opcode = 0000011)
    #10;
    
    instruction = 32'b11111111111000001010000010100011; // S-type: STORE (opcode = 0100011)
    #10;
    
    instruction = 32'b00000000000100001000000001101111; // J-type: JAL (opcode = 1101111)
    #10;
    
    $finish; 
  end

endmodule


