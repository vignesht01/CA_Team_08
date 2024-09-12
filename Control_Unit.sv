module control_unit #(parameter WIDTH_OP = 7)  (immidiate_data,func3, func7, opcode, reg_wen, reg_flag, alu_op,load_data); //this module controles operation of cpu by controling the control signals based on opcode
  input [19:0]immidiate_data;
  input [2:0] func3;
  input [WIDTH_OP-1:0] func7;
  input [WIDTH_OP-1:0] opcode;
  output reg  reg_wen;
  output reg reg_flag;
  output reg [3:0] alu_op;
  output reg [31:0]load_data;
  
  always @(func3, func7, opcode) begin
    case(opcode)
      7'b0110011 :  begin
      case(func7)
        7'b0000000 : begin
          case(func3)
            3'b000 :  begin
              reg_wen = 1'b1;
              reg_flag = 1'b0;
              alu_op = 4'b0001;
            end
            3'b100 : begin
				  reg_wen = 1'b1;
              reg_flag = 1'b0;
              alu_op = 4'b0101;
            end
            3'b110 : begin
              reg_wen = 1'b1;
              reg_flag = 1'b0;
              alu_op = 4'b0011;
            end
            3'b111 : begin
              reg_wen = 1'b1;
              reg_flag = 1'b0;
              alu_op = 4'b0100;
            end
				default : begin
              reg_wen = 1'b0;
              reg_flag = 1'b0;
              alu_op = 4'b0000;
            end
          endcase
        end
        7'b0100000: begin
          reg_wen = 1'b1;
          reg_flag = 1'b0;
          alu_op = 4'b0010;
        end
        default: begin
            reg_wen = 1'b0;
          reg_flag = 1'b0;
          alu_op = 4'b0000;
        end
      endcase
    end
      7'b0000011 : begin
        reg_wen = 1'b1;
        reg_flag = 1'b1;
		  load_data <= {12'b0 ,immidiate_data};
        alu_op = 4'b0000;
      end
		
		default: begin
        reg_wen = 1'b0;
        reg_flag = 1'b0;
        alu_op = 4'b0000;
      end
    endcase
  end
endmodule
