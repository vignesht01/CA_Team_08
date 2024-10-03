`include "../Cpu_Pipelined_top.v"
module tb_control_unit();
  reg [19:0] immidiate_data;
  reg [2:0] func3;
  reg [6:0] func7, opcode;
  wire reg_wen, reg_flag;
  wire [3:0] alu_op;
  wire [31:0] load_data;

  control_unit #(7) cu (
    .immidiate_data(immidiate_data),
    .func3(func3),
    .func7(func7),
    .opcode(opcode),
    .reg_wen(reg_wen),
    .reg_flag(reg_flag),
    .alu_op(alu_op),
    .load_data(load_data)
  );

  initial begin
    // Test ADD operation
    opcode = 7'b0110011; func7 = 7'b0000000; func3 = 3'b000;
    #10 $display("Opcode: %b Func7: %b Func3: %b | ALU Op: %b, Reg Wen: %b, Reg Flag: %b", opcode, func7, func3, alu_op, reg_wen, reg_flag);

    // Test SUB operation
    func7 = 7'b0100000;
    #10 $display("Opcode: %b Func7: %b Func3: %b | ALU Op: %b, Reg Wen: %b, Reg Flag: %b", opcode, func7, func3, alu_op, reg_wen, reg_flag);

    // Test XOR operation
    func7 = 7'b0000000; func3 = 3'b100;
    #10 $display("Opcode: %b Func7: %b Func3: %b | ALU Op: %b, Reg Wen: %b, Reg Flag: %b", opcode, func7, func3, alu_op, reg_wen, reg_flag);

    // Test load operation
    opcode = 7'b0000011; immidiate_data = 20'hAAAA;
    #10 $display("Opcode: %b | Load Data: %h, Reg Wen: %b, Reg Flag: %b", opcode, load_data, reg_wen, reg_flag);

    $finish;
  end
endmodule


