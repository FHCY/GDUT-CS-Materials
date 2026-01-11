// lly_test.v
`timescale 10ns/1ns
module test_lly_SD1;
    reg EI;
    reg [7:0]I1;
    reg [7:0]I2;
    wire [7:0]Y;
lly_SD1 u0(.EI(EI), .I1(I1), .I2(I2), .Y(Y));
    initial
        begin
        EI = 1;
        #10 EI = 0;
        end
    initial
        repeat(40) begin
        #10 I1 = $random % 256;I2 = $random % 256;
        end
endmodule