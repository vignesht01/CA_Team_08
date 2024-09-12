module ALU #(parameter WIDTH = 32) (
  input [WIDTH-1:0]operand1,
  input [WIDTH-1:0]operand2,
  input [3:0]alu_opcode,
  output reg [WIDTH-1:0]result
  );
  always@(*)
  begin
    case(alu_opcode)
      4'b0001: result = operand1 + operand2;
      4'b0010: result = operand1 - operand2;  
      4'b0011: result = operand1 & operand2;
      4'b0100: result = operand1 | operand2;  
      4'b0101: result = operand1 ^ operand2;
      default : result = 0;
    endcase
    end
endmodule
