`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


module cyq_74HC4511(
       Y_c,
       A_net_0_i_1,
       I_c_0,
       A_net_0_0,
       N_20,
       GS_OUT_PRE_INV3_0,
       N_9
    );
output [6:0] Y_c;
input  [1:0] A_net_0_i_1;
input  I_c_0;
input  A_net_0_0;
input  N_20;
input  GS_OUT_PRE_INV3_0;
input  N_9;

    wire \Y_2_i_a2_0[4]_net_1 , \Y_2_0_0[5]_net_1 , N_35, N_37, N_36, 
        N_33, N_34, GND, VCC;
    
    NOR2 \Y_2_i_a2_RNIVG8G4[3]  (.A(N_37), .B(GS_OUT_PRE_INV3_0), .Y(
        Y_c[6]));
    XA1C \Y_2_i_a2[3]  (.A(N_20), .B(A_net_0_i_1[0]), .C(
        A_net_0_i_1[1]), .Y(N_37));
    OA1B \Y_2_0_a2_0_RNIFKFE4[0]  (.A(N_33), .B(N_34), .C(
        GS_OUT_PRE_INV3_0), .Y(Y_c[0]));
    NOR3 \Y_2_i_a2_RNI8S6B8[2]  (.A(A_net_0_i_1[0]), .B(
        GS_OUT_PRE_INV3_0), .C(N_36), .Y(Y_c[2]));
    NOR2 \Y_2_i_a2[2]  (.A(N_20), .B(N_9), .Y(N_36));
    NOR2 \Y_2_0_a2[1]  (.A(A_net_0_i_1[0]), .B(A_net_0_i_1[1]), .Y(
        N_35));
    AOI1 \Y_2_i_a2_0_RNI8PK47[4]  (.A(\Y_2_i_a2_0[4]_net_1 ), .B(
        A_net_0_i_1[1]), .C(GS_OUT_PRE_INV3_0), .Y(Y_c[4]));
    NOR2 \Y_2_i_a2_0[4]  (.A(A_net_0_i_1[0]), .B(N_9), .Y(
        \Y_2_i_a2_0[4]_net_1 ));
    OA1C \Y_2_0_0_RNIH84H4[5]  (.A(I_c_0), .B(\Y_2_0_0[5]_net_1 ), .C(
        GS_OUT_PRE_INV3_0), .Y(Y_c[5]));
    VCC VCC_i (.Y(VCC));
    OA1B \Y_2_0_a2_RNI1RI14[0]  (.A(N_33), .B(N_35), .C(
        GS_OUT_PRE_INV3_0), .Y(Y_c[1]));
    GND GND_i (.Y(GND));
    NOR3A \Y_2_i_a2_RNIBDKV4[3]  (.A(I_c_0), .B(N_37), .C(
        GS_OUT_PRE_INV3_0), .Y(Y_c[3]));
    NOR2A \Y_2_0_a2_0[0]  (.A(A_net_0_i_1[1]), .B(N_9), .Y(N_34));
    NOR2A \Y_2_0_a2[0]  (.A(I_c_0), .B(A_net_0_0), .Y(N_33));
    OR2 \Y_2_0_0[5]  (.A(A_net_0_0), .B(N_35), .Y(\Y_2_0_0[5]_net_1 ));
    
endmodule


module cyq_74HC148(
       A_net_0_i_1,
       I_c,
       A_net_0_0,
       N_20,
       EI_c,
       GS_OUT_PRE_INV3_0,
       N_9
    );
output [1:0] A_net_0_i_1;
input  [7:0] I_c;
output A_net_0_0;
output N_20;
input  EI_c;
output GS_OUT_PRE_INV3_0;
output N_9;

    wire GS_0_a3_1_net_1, GS_0_a3_0_net_1, N_8, N_15, N_10, N_17, GND, 
        VCC;
    
    NOR3C \A_i_0_a3[0]  (.A(I_c[6]), .B(N_10), .C(I_c[4]), .Y(N_15));
    NOR2A GS_0_a3_0 (.A(A_net_0_0), .B(N_8), .Y(GS_0_a3_0_net_1));
    OR3A \A_i_0[0]  (.A(I_c[7]), .B(N_15), .C(N_17), .Y(A_net_0_i_1[0])
        );
    NOR2A \A_i_0_a3_1[0]  (.A(I_c[6]), .B(I_c[5]), .Y(N_17));
    AO1C \A_i_0_o2[0]  (.A(I_c[1]), .B(I_c[2]), .C(I_c[3]), .Y(N_10));
    AO1 GS_0 (.A(GS_0_a3_1_net_1), .B(GS_0_a3_0_net_1), .C(EI_c), .Y(
        GS_OUT_PRE_INV3_0));
    OR2B \A_i_0_o2_0[1]  (.A(I_c[7]), .B(I_c[6]), .Y(N_9));
    AO1 \A_i_0[1]  (.A(N_20), .B(N_8), .C(N_9), .Y(A_net_0_i_1[1]));
    NOR2B GS_0_a3_1 (.A(I_c[0]), .B(I_c[1]), .Y(GS_0_a3_1_net_1));
    VCC VCC_i (.Y(VCC));
    GND GND_i (.Y(GND));
    OR2B \A_i_0_o2[1]  (.A(I_c[2]), .B(I_c[3]), .Y(N_8));
    NOR2B \A_i_0_a2[1]  (.A(I_c[5]), .B(I_c[4]), .Y(N_20));
    NOR2A \A_i_a2_i_a2[2]  (.A(N_20), .B(N_9), .Y(A_net_0_0));
    
endmodule


module cyq_SD2(
       EI,
       I,
       Y
    );
input  EI;
input  [0:7] I;
output [6:0] Y;

    wire VCC, GND, EI_c, \I_c[7] , \I_c[6] , \I_c[5] , \I_c[4] , 
        \I_c[3] , \I_c[2] , \I_c[1] , \I_c[0] , \Y_c[0] , \Y_c[1] , 
        \Y_c[2] , \Y_c[3] , \Y_c[4] , \Y_c[5] , \Y_c[6] , 
        \cyq_74HC148_0.N_20 , \A_net_0[2] , \cyq_74HC148_0.N_9 , 
        \A_net_0_i_1[1] , GS_OUT_PRE_INV3_0, \A_net_0_i_1[0] ;
    
    INBUF \I_pad[5]  (.PAD(I[5]), .Y(\I_c[5] ));
    INBUF \I_pad[7]  (.PAD(I[7]), .Y(\I_c[7] ));
    cyq_74HC4511 cyq_74HC4511_0 (.Y_c({\Y_c[6] , \Y_c[5] , \Y_c[4] , 
        \Y_c[3] , \Y_c[2] , \Y_c[1] , \Y_c[0] }), .A_net_0_i_1({
        \A_net_0_i_1[1] , \A_net_0_i_1[0] }), .I_c_0(\I_c[7] ), 
        .A_net_0_0(\A_net_0[2] ), .N_20(\cyq_74HC148_0.N_20 ), 
        .GS_OUT_PRE_INV3_0(GS_OUT_PRE_INV3_0), .N_9(
        \cyq_74HC148_0.N_9 ));
    INBUF \I_pad[0]  (.PAD(I[0]), .Y(\I_c[0] ));
    cyq_74HC148 cyq_74HC148_0 (.A_net_0_i_1({\A_net_0_i_1[1] , 
        \A_net_0_i_1[0] }), .I_c({\I_c[7] , \I_c[6] , \I_c[5] , 
        \I_c[4] , \I_c[3] , \I_c[2] , \I_c[1] , \I_c[0] }), .A_net_0_0(
        \A_net_0[2] ), .N_20(\cyq_74HC148_0.N_20 ), .EI_c(EI_c), 
        .GS_OUT_PRE_INV3_0(GS_OUT_PRE_INV3_0), .N_9(
        \cyq_74HC148_0.N_9 ));
    OUTBUF \Y_pad[6]  (.D(\Y_c[6] ), .PAD(Y[6]));
    VCC VCC_i (.Y(VCC));
    INBUF \I_pad[4]  (.PAD(I[4]), .Y(\I_c[4] ));
    INBUF \I_pad[3]  (.PAD(I[3]), .Y(\I_c[3] ));
    GND GND_i (.Y(GND));
    OUTBUF \Y_pad[4]  (.D(\Y_c[4] ), .PAD(Y[4]));
    OUTBUF \Y_pad[0]  (.D(\Y_c[0] ), .PAD(Y[0]));
    INBUF \I_pad[6]  (.PAD(I[6]), .Y(\I_c[6] ));
    INBUF EI_pad (.PAD(EI), .Y(EI_c));
    OUTBUF \Y_pad[5]  (.D(\Y_c[5] ), .PAD(Y[5]));
    INBUF \I_pad[1]  (.PAD(I[1]), .Y(\I_c[1] ));
    OUTBUF \Y_pad[1]  (.D(\Y_c[1] ), .PAD(Y[1]));
    OUTBUF \Y_pad[2]  (.D(\Y_c[2] ), .PAD(Y[2]));
    INBUF \I_pad[2]  (.PAD(I[2]), .Y(\I_c[2] ));
    OUTBUF \Y_pad[3]  (.D(\Y_c[3] ), .PAD(Y[3]));
    
endmodule
