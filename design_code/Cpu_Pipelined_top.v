`include"Program_Counter.v"
`include"Program_Memory.v"
`include"fetch_stage.v"
`include"Instruction_Decoder.v"
`include"Control_Unit.v"
`include"Register_File.v"
`include"Decode_reg.v"
`include"Alu.v"
`include"Execute_Stage.v"
`include"Mux_2x1.v"














module cpu_pipelined #(parameter WIDTH = 32,ADDR_WIDTH = 12) (
input clk,
input reset,
output wire[WIDTH-1:0]result
);

wire [ADDR_WIDTH-1:0]pc_in;
wire [ADDR_WIDTH-1:0]pc_out;
wire [ADDR_WIDTH-1:0]address; //program_memory address
wire [WIDTH-1:0]instruction,instruction_w; 
wire [6:0]opcode,func7;
wire [2:0]func3;
wire [4:0]source1_reg,source2_reg,destination_reg,destination_reg1,destination_reg2;
wire reg_wr_en,reg_wr_en1,reg_wr_en2;
wire [WIDTH-1:0]write_data; // data into regfile
wire [WIDTH-1:0]read_data1,read_data2,operand1,operand2;   
wire [3:0]alu_opcode,alu_opcode1;
wire [WIDTH-1:0]alu_result,alu_result1;
wire [19:0]immidiate_data; // 20 bit extracted from  the 32 bit data
wire [WIDTH-1:0]load_data,load_data1,load_data2; // 32  bit load value 
wire reg_flag,reg_flag1,reg_flag2; // flag for selection between alu result & load value

assign result = alu_result;


PC  #(.ADDR_WIDTH(ADDR_WIDTH)) instnt1(
.clk(clk),
.reset(reset),
.pc_in(pc_in),
.pc_out(pc_out)
);




program_memory  #(.DEPTH(4096), .WIDTH(32), .ADDR_WIDTH(12)) instnt3(
.clk(clk),
.address(pc_out),
.instruction(instruction)
);


fetch_stage  #(32) instnt2(
.clk(clk),
.input1(instruction),
.output1(instruction_w)
);


instruction_decoder instnt4(
.instruction(instruction_w),
.opcode(opcode),
.source1_reg(source1_reg),
.source2_reg(source2_reg),
.destination_reg(destination_reg),
.func7(func7),
.func3(func3),
.immediate_data(immidiate_data) 
);

  


control_unit  #(7) c1(
.immidiate_data(immidiate_data),
.func3(func3),
.func7(func7),
.opcode(opcode), 
.reg_wen(reg_wr_en),
.reg_flag(reg_flag),
.alu_op(alu_opcode),
.load_data(load_data) 
);


register_file #(.ADDR_WIDTH(5), .WIDTH(32), .DEPTH(16)) instnt6(
.clk(clk),
.reg_write_en(reg_wr_en2),
.source1_reg(source1_reg),
.source2_reg(source2_reg),
.destination_reg(destination_reg2),
.write_data(write_data),
.read_data1(read_data1),
.read_data2(read_data2)
);




decode_reg insttn11(
.clk(clk),
.alu_opcode(alu_opcode),
.reg_flag(reg_flag),
.rd(destination_reg),
.rs1(read_data1),
.rs2(read_data2),
.immidiate_data(load_data),
.reg_wr_en(reg_wr_en),
.alu_opout(alu_opcode1),
.rd_out(destination_reg1),
.op1(operand1),
.op2(operand2),
.reg_wr_en_out(reg_wr_en1),
.data(load_data1),
.flag_out(reg_flag1)
);



ALU #(32) instnt7(
.operand1(operand1),
.operand2(operand2),
.alu_opcode(alu_opcode1),
.result(alu_result)
);



execute_stage instnt8(
.clk(clk),
.reg_flag(reg_flag1),
.result(alu_result),
.reg_wr_en(reg_wr_en1),
.rd(destination_reg1),
.data_in(load_data1),
.reg_wr_en2(reg_wr_en2),//op
.rd_out(destination_reg2),
.data_out(load_data2),
.write_data(alu_result1),
.flag_out(reg_flag2)
);



mux_2to1  #(32) m1(
.I0(alu_result1),
.I1(load_data2),
.S(reg_flag2),
.Y(write_data)
);


endmodule
