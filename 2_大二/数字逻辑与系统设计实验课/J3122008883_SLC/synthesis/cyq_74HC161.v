`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


module cyq_74HC161(
       MR,
       clk,
       Cep,
       Cet,
       PE,
       D,
       Q,
       TC
    );
input  MR;
input  clk;
input  Cep;
input  Cet;
input  PE;
input  [3:0] D;
output [3:0] Q;
output TC;

    wire GND, VCC, MR_c, clk_c, Cep_c, Cet_c, PE_c, \D_c[0] , \D_c[1] , 
        \D_c[2] , \D_c[3] , \Q_c[0] , \Q_c[1] , \Q_c[2] , \Q_c[3] , 
        TC_c, Qe, Q_n3_net_1, Q_n2_net_1, Q_n1_net_1, N_20, N_11, N_13, 
        N_15, TC_3, Q_6_0_net_1, TC_3_0, TC_3_1;
    
    MX2 Q_9 (.A(\D_c[3] ), .B(\Q_c[3] ), .S(PE_c), .Y(N_15));
    NOR2B Cet_pad_RNIBJVB (.A(Cet_c), .B(\Q_c[2] ), .Y(TC_3_0));
    DFN1E1C0 \Q[1]  (.D(Q_n1_net_1), .CLK(clk_c), .CLR(MR_c), .E(Qe), 
        .Q(\Q_c[1] ));
    NOR2B \Q_RNIJ6QN[1]  (.A(\Q_c[1] ), .B(\Q_c[0] ), .Y(TC_3_1));
    MX2B Q_n0 (.A(\D_c[0] ), .B(\Q_c[0] ), .S(PE_c), .Y(N_20));
    VCC VCC_i (.Y(VCC));
    INBUF PE_pad (.PAD(PE), .Y(PE_c));
    DFN1E1C0 \Q[0]  (.D(N_20), .CLK(clk_c), .CLR(MR_c), .E(Qe), .Q(
        \Q_c[0] ));
    OUTBUF \Q_pad[2]  (.D(\Q_c[2] ), .PAD(Q[2]));
    INBUF \D_pad[1]  (.PAD(D[1]), .Y(\D_c[1] ));
    AX1C Q_n1 (.A(PE_c), .B(\Q_c[0] ), .C(N_11), .Y(Q_n1_net_1));
    DFN1E1C0 \Q[3]  (.D(Q_n3_net_1), .CLK(clk_c), .CLR(MR_c), .E(Qe), 
        .Q(\Q_c[3] ));
    AX1C Q_n3 (.A(PE_c), .B(TC_3), .C(N_15), .Y(Q_n3_net_1));
    AO1B Qlde (.A(Cep_c), .B(Cet_c), .C(PE_c), .Y(Qe));
    NOR2B Cet_pad_RNIUPP31 (.A(TC_3_1), .B(TC_3_0), .Y(TC_3));
    GND GND_i (.Y(GND));
    INBUF MR_pad (.PAD(MR), .Y(MR_c));
    INBUF \D_pad[2]  (.PAD(D[2]), .Y(\D_c[2] ));
    OUTBUF \Q_pad[3]  (.D(\Q_c[3] ), .PAD(Q[3]));
    MX2 Q_5 (.A(\D_c[1] ), .B(\Q_c[1] ), .S(PE_c), .Y(N_11));
    DFN1E1C0 \Q[2]  (.D(Q_n2_net_1), .CLK(clk_c), .CLR(MR_c), .E(Qe), 
        .Q(\Q_c[2] ));
    NOR2B TC_pad_RNO (.A(TC_3), .B(\Q_c[3] ), .Y(TC_c));
    OUTBUF \Q_pad[1]  (.D(\Q_c[1] ), .PAD(Q[1]));
    OUTBUF \Q_pad[0]  (.D(\Q_c[0] ), .PAD(Q[0]));
    MX2 Q_7 (.A(\D_c[2] ), .B(\Q_c[2] ), .S(PE_c), .Y(N_13));
    INBUF \D_pad[0]  (.PAD(D[0]), .Y(\D_c[0] ));
    INBUF Cep_pad (.PAD(Cep), .Y(Cep_c));
    AX1C Q_n2 (.A(\Q_c[0] ), .B(Q_6_0_net_1), .C(N_13), .Y(Q_n2_net_1));
    INBUF Cet_pad (.PAD(Cet), .Y(Cet_c));
    NOR2B Q_6_0 (.A(PE_c), .B(\Q_c[1] ), .Y(Q_6_0_net_1));
    INBUF \D_pad[3]  (.PAD(D[3]), .Y(\D_c[3] ));
    OUTBUF TC_pad (.D(TC_c), .PAD(TC));
    CLKBUF clk_pad (.PAD(clk), .Y(clk_c));
    
endmodule
