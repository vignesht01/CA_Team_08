
`include "../Cpu_Pipelined_top.v"
module tb_ALU();
  reg [31:0] operand1, operand2;
  reg [3:0] alu_opcode;
  wire [31:0] result;

  ALU #(.WIDTH(32)) alu1 (
    .operand1(operand1),
    .operand2(operand2),
    .alu_opcode(alu_opcode),
    .result(result)
  );

  initial begin
    operand1 = 32'd10;
    operand2 = 32'd5;
    
    // Test ADD operation
    alu_opcode = 4'b0001;
    #10 $display("ADD: %d + %d = %d", operand1, operand2, result);
    
    // Test SUB operation
    alu_opcode = 4'b0010;
    #10 $display("SUB: %d - %d = %d", operand1, operand2, result);

    // Test AND operation
    alu_opcode = 4'b0011;
    #10 $display("AND: %b & %b = %b", operand1, operand2, result);

    // Test OR operation
    alu_opcode = 4'b0100;
    #10 $display("OR: %b | %b = %b", operand1, operand2, result);

    // Test XOR operation
    alu_opcode = 4'b0101;
    #10 $display("XOR: %b ^ %b = %b", operand1, operand2, result);
    
    // Test default
    alu_opcode = 4'b0000;
    #10 $display("DEFAULT: %d", result);
    
    $finish;
  end
endmodule


