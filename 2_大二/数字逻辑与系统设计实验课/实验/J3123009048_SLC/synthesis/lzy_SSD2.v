`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


module multiplexor(
       multiplexor_0_Result,
       B_c,
       A_c,
       D_c,
       C_c,
       Q_net_0
    );
output [3:0] multiplexor_0_Result;
input  [3:0] B_c;
input  [3:0] A_c;
input  [3:0] D_c;
input  [3:0] C_c;
input  [1:0] Q_net_0;

    wire MX2_1_Y, \SelAux_0[0] , MX2_6_Y, MX2_7_Y, MX2_2_Y, 
        \SelAux_0[4] , MX2_0_Y, MX2_3_Y, MX2_5_Y, MX2_4_Y, GND, VCC;
    
    MX2 MX2_7 (.A(C_c[1]), .B(D_c[1]), .S(\SelAux_0[0] ), .Y(MX2_7_Y));
    MX2 MX2_5 (.A(C_c[0]), .B(D_c[0]), .S(\SelAux_0[0] ), .Y(MX2_5_Y));
    MX2 MX2_4 (.A(A_c[3]), .B(B_c[3]), .S(\SelAux_0[4] ), .Y(MX2_4_Y));
    MX2 \MX2_Result[1]  (.A(MX2_6_Y), .B(MX2_7_Y), .S(Q_net_0[1]), .Y(
        multiplexor_0_Result[1]));
    MX2 MX2_6 (.A(A_c[1]), .B(B_c[1]), .S(\SelAux_0[0] ), .Y(MX2_6_Y));
    BUFF \BUFF_SelAux_0[4]  (.A(Q_net_0[0]), .Y(\SelAux_0[4] ));
    MX2 \MX2_Result[0]  (.A(MX2_1_Y), .B(MX2_5_Y), .S(Q_net_0[1]), .Y(
        multiplexor_0_Result[0]));
    MX2 MX2_1 (.A(A_c[0]), .B(B_c[0]), .S(\SelAux_0[0] ), .Y(MX2_1_Y));
    BUFF \BUFF_SelAux_0[0]  (.A(Q_net_0[0]), .Y(\SelAux_0[0] ));
    MX2 \MX2_Result[2]  (.A(MX2_0_Y), .B(MX2_3_Y), .S(Q_net_0[1]), .Y(
        multiplexor_0_Result[2]));
    VCC VCC_i (.Y(VCC));
    MX2 MX2_3 (.A(C_c[2]), .B(D_c[2]), .S(\SelAux_0[4] ), .Y(MX2_3_Y));
    GND GND_i (.Y(GND));
    MX2 \MX2_Result[3]  (.A(MX2_4_Y), .B(MX2_2_Y), .S(Q_net_0[1]), .Y(
        multiplexor_0_Result[3]));
    MX2 MX2_2 (.A(C_c[3]), .B(D_c[3]), .S(\SelAux_0[4] ), .Y(MX2_2_Y));
    MX2 MX2_0 (.A(A_c[2]), .B(B_c[2]), .S(\SelAux_0[4] ), .Y(MX2_0_Y));
    
endmodule


module lzy_74HC138(
       DG_c,
       Q_net_0
    );
output [4:1] DG_c;
input  [1:0] Q_net_0;

    wire GND, VCC;
    
    NOR2A un5_Y_1_0 (.A(Q_net_0[0]), .B(Q_net_0[1]), .Y(DG_c[2]));
    NOR2B un5_Y_3_0 (.A(Q_net_0[1]), .B(Q_net_0[0]), .Y(DG_c[4]));
    NOR2 un5_Y_0 (.A(Q_net_0[1]), .B(Q_net_0[0]), .Y(DG_c[1]));
    VCC VCC_i (.Y(VCC));
    NOR2A un5_Y_2_0 (.A(Q_net_0[1]), .B(Q_net_0[0]), .Y(DG_c[3]));
    GND GND_i (.Y(GND));
    
endmodule


module _counter(
       Q_net_0,
       Aclr_c,
       Clk_c
    );
output [1:0] Q_net_0;
input  Aclr_c;
input  Clk_c;

    wire \Q_net_0_i[0] , SUM1, GND, VCC;
    
    DFN1C0 \Q[1]  (.D(SUM1), .CLK(Clk_c), .CLR(Aclr_c), .Q(Q_net_0[1]));
    DFN1C0 \Q[0]  (.D(\Q_net_0_i[0] ), .CLK(Clk_c), .CLR(Aclr_c), .Q(
        Q_net_0[0]));
    XOR2 un3_Q_1_SUM1 (.A(Q_net_0[0]), .B(Q_net_0[1]), .Y(SUM1));
    VCC VCC_i (.Y(VCC));
    INV \Q_RNO[0]  (.A(Q_net_0[0]), .Y(\Q_net_0_i[0] ));
    GND GND_i (.Y(GND));
    
endmodule


module lzy_74HC4511(
       S_1_i_6,
       S_1_i_3,
       S_1_i_0,
       S_1_i_1,
       S_1_i_4,
       multiplexor_0_Result,
       seg_c_3,
       seg_c_0
    );
output S_1_i_6;
output S_1_i_3;
output S_1_i_0;
output S_1_i_1;
output S_1_i_4;
input  [3:0] multiplexor_0_Result;
output seg_c_3;
output seg_c_0;

    wire \S_1_0_0[5]_net_1 , N_30, N_53, N_45, N_47, N_46, N_35, N_41, 
        N_54, N_29, N_40, N_36, N_37, N_31, N_38, N_43, N_47_1, GND, 
        VCC;
    
    AOI1 \S_1_i[1]  (.A(N_30), .B(multiplexor_0_Result[0]), .C(N_38), 
        .Y(S_1_i_1));
    NOR3C \S_1_i_a4_0[0]  (.A(multiplexor_0_Result[0]), .B(
        multiplexor_0_Result[2]), .C(N_47_1), .Y(N_36));
    NOR3C \S_1_i_a2[3]  (.A(multiplexor_0_Result[0]), .B(
        multiplexor_0_Result[2]), .C(multiplexor_0_Result[1]), .Y(N_54)
        );
    AXOI7 \S_1_0_o4[5]  (.A(multiplexor_0_Result[2]), .B(
        multiplexor_0_Result[1]), .C(multiplexor_0_Result[3]), .Y(N_30)
        );
    NOR3 \S_1_i[3]  (.A(N_35), .B(N_41), .C(N_54), .Y(S_1_i_3));
    OR3A \S_1_0[2]  (.A(N_29), .B(N_40), .C(N_53), .Y(seg_c_0));
    VCC VCC_i (.Y(VCC));
    XA1B \S_1_i_a4[0]  (.A(multiplexor_0_Result[0]), .B(
        multiplexor_0_Result[2]), .C(N_31), .Y(N_35));
    NOR3 \S_1_i[0]  (.A(N_36), .B(N_37), .C(N_35), .Y(S_1_i_0));
    MX2A \S_1_0_m2[2]  (.A(multiplexor_0_Result[0]), .B(
        multiplexor_0_Result[3]), .S(multiplexor_0_Result[2]), .Y(N_29)
        );
    NOR2A \S_1_0_a2[2]  (.A(multiplexor_0_Result[3]), .B(
        multiplexor_0_Result[2]), .Y(N_53));
    NOR3B \S_1_i_a4[1]  (.A(multiplexor_0_Result[2]), .B(N_31), .C(
        multiplexor_0_Result[0]), .Y(N_38));
    NOR3 \S_1_i[6]  (.A(N_45), .B(N_47), .C(N_46), .Y(S_1_i_6));
    OA1C \S_1_0_a4[2]  (.A(multiplexor_0_Result[2]), .B(
        multiplexor_0_Result[0]), .C(multiplexor_0_Result[1]), .Y(N_40)
        );
    NOR3C \S_1_i_a4_1[0]  (.A(multiplexor_0_Result[1]), .B(
        multiplexor_0_Result[0]), .C(N_53), .Y(N_37));
    OA1B \S_1_i[4]  (.A(multiplexor_0_Result[1]), .B(N_29), .C(N_43), 
        .Y(S_1_i_4));
    GND GND_i (.Y(GND));
    NOR2A \S_1_i_a4_0[6]  (.A(N_54), .B(multiplexor_0_Result[3]), .Y(
        N_46));
    NOR2 \S_1_i_a4[6]  (.A(N_31), .B(multiplexor_0_Result[2]), .Y(N_45)
        );
    NOR3B \S_1_i_a4[3]  (.A(multiplexor_0_Result[1]), .B(N_53), .C(
        multiplexor_0_Result[0]), .Y(N_41));
    OR3 \S_1_0[5]  (.A(N_30), .B(N_53), .C(\S_1_0_0[5]_net_1 ), .Y(
        seg_c_3));
    NOR2A \S_1_i_a4_0[4]  (.A(multiplexor_0_Result[0]), .B(
        multiplexor_0_Result[3]), .Y(N_43));
    NOR2A \S_1_i_a4_1_1[6]  (.A(multiplexor_0_Result[3]), .B(
        multiplexor_0_Result[1]), .Y(N_47_1));
    OA1C \S_1_0_0[5]  (.A(multiplexor_0_Result[1]), .B(
        multiplexor_0_Result[2]), .C(multiplexor_0_Result[0]), .Y(
        \S_1_0_0[5]_net_1 ));
    NOR3B \S_1_i_a4_1[6]  (.A(multiplexor_0_Result[2]), .B(N_47_1), .C(
        multiplexor_0_Result[0]), .Y(N_47));
    OR2 \S_1_i_o2[1]  (.A(multiplexor_0_Result[3]), .B(
        multiplexor_0_Result[1]), .Y(N_31));
    
endmodule


module lzy_SSD2(
       A,
       Aclr,
       B,
       C,
       Clk,
       D,
       DG,
       seg
    );
input  [3:0] A;
input  Aclr;
input  [3:0] B;
input  [3:0] C;
input  Clk;
input  [3:0] D;
output [1:4] DG;
output [7:0] seg;

    wire \Q_net_0[0] , \Q_net_0[1] , VCC, \multiplexor_0_Result[0] , 
        \multiplexor_0_Result[1] , \multiplexor_0_Result[2] , 
        \multiplexor_0_Result[3] , \S_1_i[0] , \S_1_i[1] , \S_1_i[3] , 
        \S_1_i[4] , \S_1_i[6] , \A_c[0] , \A_c[1] , \A_c[2] , \A_c[3] , 
        Aclr_c, \B_c[0] , \B_c[1] , \B_c[2] , \B_c[3] , \C_c[0] , 
        \C_c[1] , \C_c[2] , \C_c[3] , Clk_c, \D_c[0] , \D_c[1] , 
        \D_c[2] , \D_c[3] , \DG_c[4] , \DG_c[3] , \DG_c[2] , \DG_c[1] , 
        \seg_c[2] , \seg_c[5] , GND;
    
    OUTBUF \DG_pad[3]  (.D(\DG_c[3] ), .PAD(DG[3]));
    INBUF \B_pad[3]  (.PAD(B[3]), .Y(\B_c[3] ));
    OUTBUF \seg_pad[0]  (.D(\S_1_i[0] ), .PAD(seg[0]));
    OUTBUF \seg_pad[2]  (.D(\seg_c[2] ), .PAD(seg[2]));
    multiplexor multiplexor_0 (.multiplexor_0_Result({
        \multiplexor_0_Result[3] , \multiplexor_0_Result[2] , 
        \multiplexor_0_Result[1] , \multiplexor_0_Result[0] }), .B_c({
        \B_c[3] , \B_c[2] , \B_c[1] , \B_c[0] }), .A_c({\A_c[3] , 
        \A_c[2] , \A_c[1] , \A_c[0] }), .D_c({\D_c[3] , \D_c[2] , 
        \D_c[1] , \D_c[0] }), .C_c({\C_c[3] , \C_c[2] , \C_c[1] , 
        \C_c[0] }), .Q_net_0({\Q_net_0[1] , \Q_net_0[0] }));
    INBUF \C_pad[2]  (.PAD(C[2]), .Y(\C_c[2] ));
    VCC VCC_i (.Y(VCC));
    OUTBUF \seg_pad[1]  (.D(\S_1_i[1] ), .PAD(seg[1]));
    INBUF Aclr_pad (.PAD(Aclr), .Y(Aclr_c));
    lzy_74HC138 lzy_74HC138_0 (.DG_c({\DG_c[4] , \DG_c[3] , \DG_c[2] , 
        \DG_c[1] }), .Q_net_0({\Q_net_0[1] , \Q_net_0[0] }));
    INBUF \B_pad[2]  (.PAD(B[2]), .Y(\B_c[2] ));
    _counter _counter_0 (.Q_net_0({\Q_net_0[1] , \Q_net_0[0] }), 
        .Aclr_c(Aclr_c), .Clk_c(Clk_c));
    INBUF \D_pad[1]  (.PAD(D[1]), .Y(\D_c[1] ));
    INBUF \A_pad[3]  (.PAD(A[3]), .Y(\A_c[3] ));
    OUTBUF \seg_pad[5]  (.D(\seg_c[5] ), .PAD(seg[5]));
    INBUF \C_pad[0]  (.PAD(C[0]), .Y(\C_c[0] ));
    OUTBUF \DG_pad[4]  (.D(\DG_c[4] ), .PAD(DG[4]));
    OUTBUF \seg_pad[7]  (.D(GND), .PAD(seg[7]));
    INBUF \B_pad[1]  (.PAD(B[1]), .Y(\B_c[1] ));
    INBUF \A_pad[0]  (.PAD(A[0]), .Y(\A_c[0] ));
    INBUF \C_pad[3]  (.PAD(C[3]), .Y(\C_c[3] ));
    GND GND_i (.Y(GND));
    INBUF \D_pad[2]  (.PAD(D[2]), .Y(\D_c[2] ));
    OUTBUF \seg_pad[4]  (.D(\S_1_i[4] ), .PAD(seg[4]));
    lzy_74HC4511 lzy_74HC4511_0 (.S_1_i_6(\S_1_i[6] ), .S_1_i_3(
        \S_1_i[3] ), .S_1_i_0(\S_1_i[0] ), .S_1_i_1(\S_1_i[1] ), 
        .S_1_i_4(\S_1_i[4] ), .multiplexor_0_Result({
        \multiplexor_0_Result[3] , \multiplexor_0_Result[2] , 
        \multiplexor_0_Result[1] , \multiplexor_0_Result[0] }), 
        .seg_c_3(\seg_c[5] ), .seg_c_0(\seg_c[2] ));
    INBUF \B_pad[0]  (.PAD(B[0]), .Y(\B_c[0] ));
    OUTBUF \DG_pad[2]  (.D(\DG_c[2] ), .PAD(DG[2]));
    INBUF \A_pad[2]  (.PAD(A[2]), .Y(\A_c[2] ));
    INBUF \D_pad[0]  (.PAD(D[0]), .Y(\D_c[0] ));
    OUTBUF \DG_pad[1]  (.D(\DG_c[1] ), .PAD(DG[1]));
    OUTBUF \seg_pad[3]  (.D(\S_1_i[3] ), .PAD(seg[3]));
    INBUF \A_pad[1]  (.PAD(A[1]), .Y(\A_c[1] ));
    INBUF \C_pad[1]  (.PAD(C[1]), .Y(\C_c[1] ));
    OUTBUF \seg_pad[6]  (.D(\S_1_i[6] ), .PAD(seg[6]));
    INBUF \D_pad[3]  (.PAD(D[3]), .Y(\D_c[3] ));
    CLKBUF Clk_pad (.PAD(Clk), .Y(Clk_c));
    
endmodule
