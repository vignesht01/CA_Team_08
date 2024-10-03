`include "../Cpu_Pipelined_top.v"
module tb_mux_2to1();
  reg [31:0] I0, I1;
  reg S;
  wire [31:0] Y;

  mux_2to1 #(32) mux1 (
    .I0(I0),
    .I1(I1),
    .S(S),
    .Y(Y)
  );

  initial begin
    I0 = 32'd10;
    I1 = 32'd20;

    // Select I0
    S = 0;
    #10 $display("Select I0: Y = %d", Y);

    // Select I1
    S = 1;
    #10 $display("Select I1: Y = %d", Y);

    $finish;
  end
endmodule

