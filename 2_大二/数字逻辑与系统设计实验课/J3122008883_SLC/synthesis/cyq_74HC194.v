`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


module cyq_74HC194(
       MR,
       S,
       clk,
       Dsr,
       Dsl,
       D,
       Q
    );
input  MR;
input  [1:0] S;
input  clk;
input  Dsr;
input  Dsl;
input  [3:0] D;
output [0:3] Q;

    wire un1_S_2_net_1, \Q_5[3] , \Q_5[2] , \Q_5[1] , \Q_5[0] , GND, 
        VCC, N_6, N_7, N_8, N_9, Q_5_sn_N_2, MR_c, \S_c[0] , \S_c[1] , 
        clk_c, Dsr_c, Dsl_c, \D_c[0] , \D_c[1] , \D_c[2] , \D_c[3] , 
        \Q_c[3] , \Q_c[2] , \Q_c[1] , \Q_c[0] ;
    
    MX2 \Q_RNO_0[3]  (.A(Dsl_c), .B(\Q_c[2] ), .S(\S_c[0] ), .Y(N_6));
    OUTBUF \Q_pad[1]  (.D(\Q_c[1] ), .PAD(Q[1]));
    MX2 \Q_RNO_0[1]  (.A(\Q_c[2] ), .B(\Q_c[0] ), .S(\S_c[0] ), .Y(N_8)
        );
    CLKBUF clk_pad (.PAD(clk), .Y(clk_c));
    INBUF Dsr_pad (.PAD(Dsr), .Y(Dsr_c));
    MX2 \Q_RNO[3]  (.A(N_6), .B(\D_c[0] ), .S(Q_5_sn_N_2), .Y(\Q_5[3] )
        );
    OUTBUF \Q_pad[2]  (.D(\Q_c[2] ), .PAD(Q[2]));
    DFN1E0C0 \Q[2]  (.D(\Q_5[2] ), .CLK(clk_c), .CLR(MR_c), .E(
        un1_S_2_net_1), .Q(\Q_c[2] ));
    INBUF \D_pad[1]  (.PAD(D[1]), .Y(\D_c[1] ));
    INBUF Dsl_pad (.PAD(Dsl), .Y(Dsl_c));
    VCC VCC_i (.Y(VCC));
    MX2 \Q_RNO[1]  (.A(N_8), .B(\D_c[2] ), .S(Q_5_sn_N_2), .Y(\Q_5[1] )
        );
    INBUF \S_pad[1]  (.PAD(S[1]), .Y(\S_c[1] ));
    INBUF \D_pad[0]  (.PAD(D[0]), .Y(\D_c[0] ));
    INBUF MR_pad (.PAD(MR), .Y(MR_c));
    GND GND_i (.Y(GND));
    INBUF \S_pad[0]  (.PAD(S[0]), .Y(\S_c[0] ));
    OUTBUF \Q_pad[3]  (.D(\Q_c[3] ), .PAD(Q[3]));
    INBUF \D_pad[2]  (.PAD(D[2]), .Y(\D_c[2] ));
    NOR2 un1_S_2 (.A(\S_c[1] ), .B(\S_c[0] ), .Y(un1_S_2_net_1));
    DFN1E0C0 \Q[3]  (.D(\Q_5[3] ), .CLK(clk_c), .CLR(MR_c), .E(
        un1_S_2_net_1), .Q(\Q_c[3] ));
    INBUF \D_pad[3]  (.PAD(D[3]), .Y(\D_c[3] ));
    MX2 \Q_RNO_0[2]  (.A(\Q_c[3] ), .B(\Q_c[1] ), .S(\S_c[0] ), .Y(N_7)
        );
    OUTBUF \Q_pad[0]  (.D(\Q_c[0] ), .PAD(Q[0]));
    DFN1E0C0 \Q[1]  (.D(\Q_5[1] ), .CLK(clk_c), .CLR(MR_c), .E(
        un1_S_2_net_1), .Q(\Q_c[1] ));
    DFN1E0C0 \Q[0]  (.D(\Q_5[0] ), .CLK(clk_c), .CLR(MR_c), .E(
        un1_S_2_net_1), .Q(\Q_c[0] ));
    NOR2B \S_pad_RNIVNV7[1]  (.A(\S_c[1] ), .B(\S_c[0] ), .Y(
        Q_5_sn_N_2));
    MX2 \Q_RNO[2]  (.A(N_7), .B(\D_c[1] ), .S(Q_5_sn_N_2), .Y(\Q_5[2] )
        );
    MX2 \Q_RNO[0]  (.A(N_9), .B(\D_c[3] ), .S(Q_5_sn_N_2), .Y(\Q_5[0] )
        );
    MX2 \Q_RNO_0[0]  (.A(\Q_c[1] ), .B(Dsr_c), .S(\S_c[0] ), .Y(N_9));
    
endmodule
