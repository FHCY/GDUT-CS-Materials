`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


module lzy_74HC4511(
       Y_c,
       A_net_0_0,
       A_i_1,
       I_c_0,
       I_c_4,
       N_9,
       N_20,
       N_17,
       GS_OUT_PRE_INV0_0,
       N_14
    );
output [6:0] Y_c;
input  A_net_0_0;
input  [1:0] A_i_1;
input  I_c_0;
input  I_c_4;
input  N_9;
input  N_20;
input  N_17;
input  GS_OUT_PRE_INV0_0;
input  N_14;

    wire \S_1_0_0[1]_net_1 , N_33, N_29, N_32, N_34, N_35, GND, VCC;
    
    NOR3 \S_1_i_a3_RNIDDFG4[3]  (.A(N_29), .B(N_32), .C(
        GS_OUT_PRE_INV0_0), .Y(Y_c[3]));
    OAI1 \S_1_0_0[1]  (.A(N_14), .B(A_i_1[0]), .C(I_c_0), .Y(
        \S_1_0_0[1]_net_1 ));
    OA1C \S_1_0_0_RNIMLEV5[1]  (.A(A_net_0_0), .B(\S_1_0_0[1]_net_1 ), 
        .C(GS_OUT_PRE_INV0_0), .Y(Y_c[1]));
    NOR2 \S_1_0_a3[6]  (.A(N_20), .B(N_9), .Y(N_35));
    NOR3A \S_1_i_a3_RNIMEJ38[4]  (.A(A_i_1[0]), .B(N_33), .C(
        GS_OUT_PRE_INV0_0), .Y(Y_c[4]));
    OA1C \S_1_0_a3_RNI08VO4[5]  (.A(I_c_4), .B(N_34), .C(
        GS_OUT_PRE_INV0_0), .Y(Y_c[5]));
    NOR3A \S_1_i_a3[3]  (.A(A_net_0_0), .B(N_14), .C(A_i_1[0]), .Y(
        N_32));
    VCC VCC_i (.Y(VCC));
    NOR2 \S_1_i_a3_RNI8UK84[0]  (.A(N_29), .B(GS_OUT_PRE_INV0_0), .Y(
        Y_c[0]));
    XA1 \S_1_i_a3[0]  (.A(N_9), .B(A_i_1[0]), .C(A_i_1[1]), .Y(N_29));
    GND GND_i (.Y(GND));
    NOR2B \S_1_i_a3[4]  (.A(N_14), .B(A_net_0_0), .Y(N_33));
    OA1 \S_1_0_a3[5]  (.A(N_14), .B(A_i_1[0]), .C(A_net_0_0), .Y(N_34));
    OA1B \S_1_0_a3_RNI36CI4[6]  (.A(N_34), .B(N_35), .C(
        GS_OUT_PRE_INV0_0), .Y(Y_c[6]));
    OA1C \S_0[2]  (.A(N_17), .B(A_i_1[1]), .C(GS_OUT_PRE_INV0_0), .Y(
        Y_c[2]));
    
endmodule


module lzy_74HC148(
       A_i_1,
       I_c,
       A_net_0_0,
       EI_c,
       GS_OUT_PRE_INV0_0,
       N_9,
       N_20,
       N_14,
       N_17
    );
output [1:0] A_i_1;
input  [7:0] I_c;
output A_net_0_0;
input  EI_c;
output GS_OUT_PRE_INV0_0;
output N_9;
output N_20;
output N_14;
output N_17;

    wire GS_0_a3_1_net_1, GS_0_a3_0_net_1, N_8, N_15, N_10, GND, VCC;
    
    NOR3C \A_i_0_a3[0]  (.A(I_c[6]), .B(N_10), .C(I_c[4]), .Y(N_15));
    NOR2A GS_0_a3_0 (.A(A_net_0_0), .B(N_8), .Y(GS_0_a3_0_net_1));
    OR3A \A_i_0[0]  (.A(I_c[7]), .B(N_15), .C(N_17), .Y(A_i_1[0]));
    NOR2A \A_i_0_a3_1[0]  (.A(I_c[6]), .B(I_c[5]), .Y(N_17));
    AO1C \A_i_0_o2[0]  (.A(I_c[1]), .B(I_c[2]), .C(I_c[3]), .Y(N_10));
    AO1 GS_0 (.A(GS_0_a3_1_net_1), .B(GS_0_a3_0_net_1), .C(EI_c), .Y(
        GS_OUT_PRE_INV0_0));
    OR2B \A_i_0_o2_0[1]  (.A(I_c[7]), .B(I_c[6]), .Y(N_9));
    NOR2B \A_i_0_a3_0[1]  (.A(N_20), .B(N_8), .Y(N_14));
    OR2 \A_i_0[1]  (.A(N_14), .B(N_9), .Y(A_i_1[1]));
    NOR2B GS_0_a3_1 (.A(I_c[0]), .B(I_c[1]), .Y(GS_0_a3_1_net_1));
    VCC VCC_i (.Y(VCC));
    GND GND_i (.Y(GND));
    OR2B \A_i_0_o2[1]  (.A(I_c[2]), .B(I_c[3]), .Y(N_8));
    NOR2B \A_i_0_a2[1]  (.A(I_c[5]), .B(I_c[4]), .Y(N_20));
    NOR2A \A_i_a2_i_a2[2]  (.A(N_20), .B(N_9), .Y(A_net_0_0));
    
endmodule


module lzy_SD2(
       EI,
       I,
       Y
    );
input  EI;
input  [7:0] I;
output [7:0] Y;

    wire VCC, EI_c, \I_c[0] , \I_c[1] , \I_c[2] , \I_c[3] , \I_c[4] , 
        \I_c[5] , \I_c[6] , \I_c[7] , \Y_c[0] , \Y_c[1] , \Y_c[2] , 
        \Y_c[3] , \Y_c[4] , \Y_c[5] , \Y_c[6] , GND, 
        \lzy_74HC148_0.N_20 , \A_net_0[2] , \lzy_74HC148_0.N_9 , 
        \lzy_74HC4511_0.A_i_1[1] , \lzy_74HC148_0.N_14 , 
        GS_OUT_PRE_INV0_0, \lzy_74HC4511_0.A_i_1[0] , 
        \lzy_74HC148_0.N_17 ;
    
    INBUF \I_pad[5]  (.PAD(I[5]), .Y(\I_c[5] ));
    INBUF \I_pad[7]  (.PAD(I[7]), .Y(\I_c[7] ));
    INBUF \I_pad[0]  (.PAD(I[0]), .Y(\I_c[0] ));
    OUTBUF \Y_pad[6]  (.D(\Y_c[6] ), .PAD(Y[6]));
    VCC VCC_i (.Y(VCC));
    OUTBUF \Y_pad[7]  (.D(GND), .PAD(Y[7]));
    INBUF \I_pad[4]  (.PAD(I[4]), .Y(\I_c[4] ));
    INBUF \I_pad[3]  (.PAD(I[3]), .Y(\I_c[3] ));
    GND GND_i (.Y(GND));
    OUTBUF \Y_pad[4]  (.D(\Y_c[4] ), .PAD(Y[4]));
    OUTBUF \Y_pad[0]  (.D(\Y_c[0] ), .PAD(Y[0]));
    INBUF \I_pad[6]  (.PAD(I[6]), .Y(\I_c[6] ));
    INBUF EI_pad (.PAD(EI), .Y(EI_c));
    OUTBUF \Y_pad[5]  (.D(\Y_c[5] ), .PAD(Y[5]));
    lzy_74HC4511 lzy_74HC4511_0 (.Y_c({\Y_c[6] , \Y_c[5] , \Y_c[4] , 
        \Y_c[3] , \Y_c[2] , \Y_c[1] , \Y_c[0] }), .A_net_0_0(
        \A_net_0[2] ), .A_i_1({\lzy_74HC4511_0.A_i_1[1] , 
        \lzy_74HC4511_0.A_i_1[0] }), .I_c_0(\I_c[3] ), .I_c_4(\I_c[7] )
        , .N_9(\lzy_74HC148_0.N_9 ), .N_20(\lzy_74HC148_0.N_20 ), 
        .N_17(\lzy_74HC148_0.N_17 ), .GS_OUT_PRE_INV0_0(
        GS_OUT_PRE_INV0_0), .N_14(\lzy_74HC148_0.N_14 ));
    INBUF \I_pad[1]  (.PAD(I[1]), .Y(\I_c[1] ));
    OUTBUF \Y_pad[1]  (.D(\Y_c[1] ), .PAD(Y[1]));
    lzy_74HC148 lzy_74HC148_0 (.A_i_1({\lzy_74HC4511_0.A_i_1[1] , 
        \lzy_74HC4511_0.A_i_1[0] }), .I_c({\I_c[7] , \I_c[6] , 
        \I_c[5] , \I_c[4] , \I_c[3] , \I_c[2] , \I_c[1] , \I_c[0] }), 
        .A_net_0_0(\A_net_0[2] ), .EI_c(EI_c), .GS_OUT_PRE_INV0_0(
        GS_OUT_PRE_INV0_0), .N_9(\lzy_74HC148_0.N_9 ), .N_20(
        \lzy_74HC148_0.N_20 ), .N_14(\lzy_74HC148_0.N_14 ), .N_17(
        \lzy_74HC148_0.N_17 ));
    OUTBUF \Y_pad[2]  (.D(\Y_c[2] ), .PAD(Y[2]));
    INBUF \I_pad[2]  (.PAD(I[2]), .Y(\I_c[2] ));
    OUTBUF \Y_pad[3]  (.D(\Y_c[3] ), .PAD(Y[3]));
    
endmodule
