`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


module cyq_BasGate(
       A,
       B,
       Y1,
       Y2,
       Y3,
       Y4,
       Y5,
       Y6
    );
input  A;
input  B;
output Y1;
output Y2;
output Y3;
output Y4;
output Y5;
output Y6;

    wire GND, VCC, A_c, B_c, Y1_c, Y3_c, Y5_c, Y3_c_i, Y1_c_i, A_c_i;
    
    OUTBUF Y6_pad (.D(A_c_i), .PAD(Y6));
    INV Y6_pad_RNO (.A(A_c), .Y(A_c_i));
    OUTBUF Y5_pad (.D(Y5_c), .PAD(Y5));
    OUTBUF Y4_pad (.D(Y3_c_i), .PAD(Y4));
    OUTBUF Y3_pad (.D(Y3_c), .PAD(Y3));
    INV Y2_pad_RNO (.A(Y1_c), .Y(Y1_c_i));
    INBUF B_pad (.PAD(B), .Y(B_c));
    OUTBUF Y2_pad (.D(Y1_c_i), .PAD(Y2));
    OUTBUF Y1_pad (.D(Y1_c), .PAD(Y1));
    VCC VCC_i (.Y(VCC));
    INBUF A_pad (.PAD(A), .Y(A_c));
    INV Y4_pad_RNO (.A(Y3_c), .Y(Y3_c_i));
    NOR2B B_pad_RNIB53D_0 (.A(B_c), .B(A_c), .Y(Y1_c));
    XOR2 Y5_inst_1 (.A(A_c), .B(B_c), .Y(Y5_c));
    GND GND_i (.Y(GND));
    OR2 B_pad_RNIB53D (.A(B_c), .B(A_c), .Y(Y3_c));
    
endmodule
