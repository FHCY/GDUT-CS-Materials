`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


module lly_74HC4511(
       Y_c,
       GS_OUT_PRE_INV0_0,
       AND2_1_Y,
       AND2_2_Y,
       AND2_3_Y
    );
output [6:0] Y_c;
input  GS_OUT_PRE_INV0_0;
input  AND2_1_Y;
input  AND2_2_Y;
input  AND2_3_Y;

    wire \S_0_0[1]_net_1 , \S_1_i_a4_0[4]_net_1 , N_36, N_53, N_40, 
        N_39, N_35, N_46, GND, VCC;
    
    OA1C \S_1_i_a4_0_RNIC45C4[4]  (.A(\S_1_i_a4_0[4]_net_1 ), .B(
        AND2_2_Y), .C(GS_OUT_PRE_INV0_0), .Y(Y_c[4]));
    NOR3B \S_1_i_a4_0[0]  (.A(AND2_1_Y), .B(AND2_3_Y), .C(AND2_2_Y), 
        .Y(N_35));
    NOR3C \S_1_i_a2[3]  (.A(AND2_1_Y), .B(AND2_3_Y), .C(AND2_2_Y), .Y(
        N_53));
    OA1C \S_1_0_a4_RNI30P74[2]  (.A(AND2_3_Y), .B(N_39), .C(
        GS_OUT_PRE_INV0_0), .Y(Y_c[2]));
    NOR2 \S_1_i_a4_1_RNIPGBB4[6]  (.A(N_46), .B(GS_OUT_PRE_INV0_0), .Y(
        Y_c[6]));
    VCC VCC_i (.Y(VCC));
    NOR2A \S_1_0_a4[2]  (.A(AND2_1_Y), .B(AND2_2_Y), .Y(N_39));
    NOR3B \S_1_i_a4_1[0]  (.A(AND2_2_Y), .B(AND2_1_Y), .C(AND2_3_Y), 
        .Y(N_36));
    NOR2A \S_1_i_a4_1_RNINJGG4[0]  (.A(Y_c[5]), .B(N_36), .Y(Y_c[0]));
    MX2C \S_0_0[1]  (.A(AND2_3_Y), .B(AND2_2_Y), .S(AND2_1_Y), .Y(
        \S_0_0[1]_net_1 ));
    GND GND_i (.Y(GND));
    NOR3A \S_1_i_a4[3]  (.A(AND2_2_Y), .B(AND2_1_Y), .C(AND2_3_Y), .Y(
        N_40));
    NOR2A \S_0[1]  (.A(\S_0_0[1]_net_1 ), .B(GS_OUT_PRE_INV0_0), .Y(
        Y_c[1]));
    NOR2A \S_1_i_a4_0[4]  (.A(AND2_1_Y), .B(AND2_3_Y), .Y(
        \S_1_i_a4_0[4]_net_1 ));
    NOR3A \S_1_i_a4_1[6]  (.A(AND2_3_Y), .B(AND2_2_Y), .C(AND2_1_Y), 
        .Y(N_46));
    NOR2 \S_1_i_a4_0_RNII78A4[0]  (.A(N_35), .B(GS_OUT_PRE_INV0_0), .Y(
        Y_c[5]));
    NOR3 \S_1_i_a2_RNISRI25[3]  (.A(N_53), .B(GS_OUT_PRE_INV0_0), .C(
        N_40), .Y(Y_c[3]));
    
endmodule


module lly_74HC148_1(
       A_i,
       I1_c,
       A_i_a2_0,
       GS_OUT_PRE_INV0_0,
       A62,
       EI_c
    );
output [1:0] A_i;
input  [7:0] I1_c;
output A_i_a2_0;
output GS_OUT_PRE_INV0_0;
output A62;
input  EI_c;

    wire \A_i_a2_0[1] , un1_I_3_net_1, un1_I_2_net_1, un1_I_1_net_1, 
        un1_I_0_net_1, un1_I_4_net_1, \A_i_a2_1[0]_net_1 , N_51, N_49, 
        N_52, N_53, GND, VCC;
    
    NOR2A \A_i_a2_0_0[1]  (.A(un1_I_3_net_1), .B(un1_I_2_net_1), .Y(
        \A_i_a2_0[1] ));
    AO1C \A_i_o2[0]  (.A(I1_c[1]), .B(I1_c[2]), .C(I1_c[3]), .Y(N_49));
    NOR2B un1_I_2 (.A(I1_c[2]), .B(I1_c[3]), .Y(un1_I_2_net_1));
    VCC VCC_i (.Y(VCC));
    NOR3B A62_inst_1 (.A(un1_I_0_net_1), .B(un1_I_1_net_1), .C(EI_c), 
        .Y(A62));
    NOR3C un1_I_0 (.A(un1_I_4_net_1), .B(un1_I_3_net_1), .C(
        un1_I_2_net_1), .Y(un1_I_0_net_1));
    AO1A \A_i[1]  (.A(\A_i_a2_0[1] ), .B(un1_I_4_net_1), .C(EI_c), .Y(
        A_i[1]));
    GND GND_i (.Y(GND));
    NOR2A \A_i_a2_1_0[0]  (.A(I1_c[4]), .B(EI_c), .Y(
        \A_i_a2_1[0]_net_1 ));
    NOR2B un1_I_3 (.A(I1_c[5]), .B(I1_c[4]), .Y(un1_I_3_net_1));
    AO1 \A_i_a2[2]  (.A(un1_I_3_net_1), .B(un1_I_4_net_1), .C(EI_c), 
        .Y(A_i_a2_0));
    NOR3C \A_i_a2[0]  (.A(I1_c[6]), .B(N_49), .C(\A_i_a2_1[0]_net_1 ), 
        .Y(N_51));
    NOR2B un1_I_1 (.A(I1_c[0]), .B(I1_c[1]), .Y(un1_I_1_net_1));
    AO1 GS (.A(un1_I_1_net_1), .B(un1_I_0_net_1), .C(EI_c), .Y(
        GS_OUT_PRE_INV0_0));
    NOR3A \A_i_a2_1[0]  (.A(I1_c[6]), .B(EI_c), .C(I1_c[5]), .Y(N_53));
    NOR2B un1_I_4 (.A(I1_c[7]), .B(I1_c[6]), .Y(un1_I_4_net_1));
    NOR3 \A_i[0]  (.A(N_52), .B(N_53), .C(N_51), .Y(A_i[0]));
    NOR2 \A_i_a2_0[0]  (.A(I1_c[7]), .B(EI_c), .Y(N_52));
    
endmodule


module lly_74HC148_0(
       A_i_a2_0_0,
       I2_c,
       A_i_0_0_d0,
       A_i_0_0_0,
       A62
    );
output A_i_a2_0_0;
input  [7:1] I2_c;
output A_i_0_0_d0;
output A_i_0_0_0;
input  A62;

    wire \A_i_a2_1[0] , N_57, \A_i_a2_0[0] , \A_i_0[0]_net_1 , 
        \A_i_a2_1_0[0]_net_1 , \A_i_a2_0[1] , N_48, N_46, GND, VCC;
    
    OA1A \A_i_a2_1_1[0]  (.A(I2_c[3]), .B(N_57), .C(I2_c[6]), .Y(
        \A_i_a2_1[0] ));
    AOI1 \A_i[0]  (.A(\A_i_a2_1[0] ), .B(\A_i_a2_0[0] ), .C(
        \A_i_0[0]_net_1 ), .Y(A_i_0_0_0));
    OA1A \A_i_0[0]  (.A(I2_c[7]), .B(\A_i_a2_1_0[0]_net_1 ), .C(A62), 
        .Y(\A_i_0[0]_net_1 ));
    OR2B \A_i_o2[1]  (.A(I2_c[6]), .B(I2_c[7]), .Y(N_46));
    OR2B \A_i_o3[1]  (.A(I2_c[4]), .B(I2_c[5]), .Y(N_48));
    NOR2A \A_i_a3[0]  (.A(I2_c[2]), .B(I2_c[1]), .Y(N_57));
    VCC VCC_i (.Y(VCC));
    NOR2B \A_i_a2_0_0[0]  (.A(I2_c[4]), .B(A62), .Y(\A_i_a2_0[0] ));
    GND GND_i (.Y(GND));
    NOR2A \A_i_a2_1_0[0]  (.A(I2_c[6]), .B(I2_c[5]), .Y(
        \A_i_a2_1_0[0]_net_1 ));
    OAI1 \A_i_a2[2]  (.A(N_46), .B(N_48), .C(A62), .Y(A_i_a2_0_0));
    AOI1 \A_i_a2_0_0[1]  (.A(I2_c[2]), .B(I2_c[3]), .C(N_48), .Y(
        \A_i_a2_0[1] ));
    OAI1 \A_i[1]  (.A(N_46), .B(\A_i_a2_0[1] ), .C(A62), .Y(A_i_0_0_d0)
        );
    
endmodule


module lly_SD1(
       EI,
       I1,
       I2,
       Y
    );
input  EI;
input  [7:0] I1;
input  [7:0] I2;
output [7:0] Y;

    wire AND2_1_Y, AND2_2_Y, AND2_3_Y, VCC, \A_i_0[0] , \A_i_0[1] , 
        \A_i_a2_0[2] , \lly_74HC148_0.A62 , \A_i[0] , \A_i[1] , 
        \A_i_a2[2] , EI_c, \I1_c[0] , \I1_c[1] , \I1_c[2] , \I1_c[3] , 
        \I1_c[4] , \I1_c[5] , \I1_c[6] , \I1_c[7] , \I2_c[1] , 
        \I2_c[2] , \I2_c[3] , \I2_c[4] , \I2_c[5] , \I2_c[6] , 
        \I2_c[7] , \Y_c[0] , \Y_c[1] , \Y_c[2] , \Y_c[3] , \Y_c[4] , 
        \Y_c[5] , \Y_c[6] , GND, GS_OUT_PRE_INV0_0;
    
    INBUF \I2_pad[4]  (.PAD(I2[4]), .Y(\I2_c[4] ));
    lly_74HC4511 lly_74HC4511_0 (.Y_c({\Y_c[6] , \Y_c[5] , \Y_c[4] , 
        \Y_c[3] , \Y_c[2] , \Y_c[1] , \Y_c[0] }), .GS_OUT_PRE_INV0_0(
        GS_OUT_PRE_INV0_0), .AND2_1_Y(AND2_1_Y), .AND2_2_Y(AND2_2_Y), 
        .AND2_3_Y(AND2_3_Y));
    INBUF \I1_pad[6]  (.PAD(I1[6]), .Y(\I1_c[6] ));
    lly_74HC148_1 lly_74HC148_0 (.A_i({\A_i[1] , \A_i[0] }), .I1_c({
        \I1_c[7] , \I1_c[6] , \I1_c[5] , \I1_c[4] , \I1_c[3] , 
        \I1_c[2] , \I1_c[1] , \I1_c[0] }), .A_i_a2_0(\A_i_a2[2] ), 
        .GS_OUT_PRE_INV0_0(GS_OUT_PRE_INV0_0), .A62(
        \lly_74HC148_0.A62 ), .EI_c(EI_c));
    INBUF \I1_pad[4]  (.PAD(I1[4]), .Y(\I1_c[4] ));
    INBUF \I1_pad[1]  (.PAD(I1[1]), .Y(\I1_c[1] ));
    AND2 AND2_3 (.A(\A_i_a2[2] ), .B(\A_i_a2_0[2] ), .Y(AND2_3_Y));
    INBUF \I1_pad[3]  (.PAD(I1[3]), .Y(\I1_c[3] ));
    AND2 AND2_1 (.A(\A_i[0] ), .B(\A_i_0[0] ), .Y(AND2_1_Y));
    INBUF \I1_pad[0]  (.PAD(I1[0]), .Y(\I1_c[0] ));
    INBUF \I1_pad[5]  (.PAD(I1[5]), .Y(\I1_c[5] ));
    OUTBUF \Y_pad[6]  (.D(\Y_c[6] ), .PAD(Y[6]));
    VCC VCC_i (.Y(VCC));
    INBUF \I1_pad[2]  (.PAD(I1[2]), .Y(\I1_c[2] ));
    INBUF \I2_pad[2]  (.PAD(I2[2]), .Y(\I2_c[2] ));
    OUTBUF \Y_pad[7]  (.D(GND), .PAD(Y[7]));
    INBUF \I2_pad[3]  (.PAD(I2[3]), .Y(\I2_c[3] ));
    GND GND_i (.Y(GND));
    INBUF \I1_pad[7]  (.PAD(I1[7]), .Y(\I1_c[7] ));
    OUTBUF \Y_pad[4]  (.D(\Y_c[4] ), .PAD(Y[4]));
    OUTBUF \Y_pad[0]  (.D(\Y_c[0] ), .PAD(Y[0]));
    INBUF EI_pad (.PAD(EI), .Y(EI_c));
    INBUF \I2_pad[1]  (.PAD(I2[1]), .Y(\I2_c[1] ));
    AND2 AND2_2 (.A(\A_i[1] ), .B(\A_i_0[1] ), .Y(AND2_2_Y));
    lly_74HC148_0 lly_74HC148_1 (.A_i_a2_0_0(\A_i_a2_0[2] ), .I2_c({
        \I2_c[7] , \I2_c[6] , \I2_c[5] , \I2_c[4] , \I2_c[3] , 
        \I2_c[2] , \I2_c[1] }), .A_i_0_0_d0(\A_i_0[1] ), .A_i_0_0_0(
        \A_i_0[0] ), .A62(\lly_74HC148_0.A62 ));
    INBUF \I2_pad[5]  (.PAD(I2[5]), .Y(\I2_c[5] ));
    OUTBUF \Y_pad[5]  (.D(\Y_c[5] ), .PAD(Y[5]));
    OUTBUF \Y_pad[1]  (.D(\Y_c[1] ), .PAD(Y[1]));
    OUTBUF \Y_pad[2]  (.D(\Y_c[2] ), .PAD(Y[2]));
    OUTBUF \Y_pad[3]  (.D(\Y_c[3] ), .PAD(Y[3]));
    INBUF \I2_pad[7]  (.PAD(I2[7]), .Y(\I2_c[7] ));
    INBUF \I2_pad[6]  (.PAD(I2[6]), .Y(\I2_c[6] ));
    
endmodule
