module mux_2to1 #(parameter WIDTH = 32 ) (
 input [WIDTH-1:0] I0,  // First input, WIDTH-bit wide
    input [WIDTH-1:0] I1,  // Second input, WIDTH-bit wide
    input S,              // Select signal, 1-bit wide
    output [WIDTH-1:0] Y   // Output, WIDTH-bit wide
);
 assign Y = S ? I1 : I0;

endmodule

