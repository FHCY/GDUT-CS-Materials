`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


module cyq_74HC153(
       C_c,
       B_c,
       A_c,
       Y_c
    );
input  C_c;
input  B_c;
input  A_c;
output Y_c;

    wire GND, VCC;
    
    AO16 Y_2s_iv (.A(A_c), .B(B_c), .C(C_c), .Y(Y_c));
    VCC VCC_i (.Y(VCC));
    GND GND_i (.Y(GND));
    
endmodule


module cyq_SD1(
       A,
       B,
       C,
       Y
    );
input  A;
input  B;
input  C;
output Y;

    wire GND, VCC, A_c, B_c, C_c, Y_c;
    
    cyq_74HC153 cyq_74HC153_0 (.C_c(C_c), .B_c(B_c), .A_c(A_c), .Y_c(
        Y_c));
    INBUF C_pad (.PAD(C), .Y(C_c));
    INBUF B_pad (.PAD(B), .Y(B_c));
    OUTBUF Y_pad (.D(Y_c), .PAD(Y));
    VCC VCC_i (.Y(VCC));
    GND GND_i (.Y(GND));
    INBUF A_pad (.PAD(A), .Y(A_c));
    
endmodule
