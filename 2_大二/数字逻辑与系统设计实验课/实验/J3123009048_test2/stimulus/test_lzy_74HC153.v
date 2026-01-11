// test_lzy_74HC153.v
`timescale 10ns/1ns
module test_lzy_74HC153;
    reg E;
    reg [1:0]S;
    reg [3:0]I;
    wire Y;
    lzy_74HC153 u0(E, S, I, Y);

    initial
        begin
     E = 0; S = $random; I = $random;
     repeat(20) begin
     #5 S = $random; I = $random;
     end
     #5 E = 1;
     end
endmodule

module test_lzy_SD1;
    reg A, B, C;
    wire Y;
    lzy_SD1 u1(A, B, C, Y);

    initial
        begin
        A = 0; B = 0; C = 0;
        #10 C = 1;
        #10 B = 1;
        #10 C = 0;
        #10 A = 1;       
        #10 C = 1;
        #10 B = 0;
        #10 C = 0;
    end
endmodule
