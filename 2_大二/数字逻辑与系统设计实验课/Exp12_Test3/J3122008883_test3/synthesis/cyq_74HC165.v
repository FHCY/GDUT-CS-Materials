`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


module cyq_74HC165(
       PL,
       CE,
       CP,
       Ds,
       D,
       Y,
       Yn
    );
input  PL;
input  CE;
input  CP;
input  Ds;
input  [0:7] D;
output Y;
output Yn;

    wire \Q_RNO_0[7]_net_1 , \Q_RNO[7]_net_1 , \Q_RNO_0[6]_net_1 , 
        \Q_RNO[6]_net_1 , \Q_RNO_0[5]_net_1 , \Q_RNO[5]_net_1 , 
        \Q_RNO_0[4]_net_1 , \Q_RNO[4]_net_1 , \Q_RNO_0[3]_net_1 , 
        \Q_RNO[3]_net_1 , \Q_RNO_0[2]_net_1 , \Q_RNO[2]_net_1 , 
        \Q_RNO_0[1]_net_1 , \Q_RNO[1]_net_1 , \Q_RNO_0[0]_net_1 , 
        \Q_RNO[0]_net_1 , \Q_4[7]_net_1 , \Q_4[6]_net_1 , 
        \Q_4[5]_net_1 , \Q_4[4]_net_1 , \Q_4[3]_net_1 , \Q_4[2]_net_1 , 
        \Q_4[1]_net_1 , \Q_4[0]_net_1 , \Q[6]_net_1 , \Q[5]_net_1 , 
        \Q[4]_net_1 , \Q[3]_net_1 , \Q[2]_net_1 , \Q[1]_net_1 , 
        \Q[0]_net_1 , GND, VCC, PL_c, CE_c, CP_c, Ds_c, \D_c[7] , 
        \D_c[6] , \D_c[5] , \D_c[4] , \D_c[3] , \D_c[2] , \D_c[1] , 
        \D_c[0] , Y_c, Y_c_i;
    
    INV Yn_pad_RNO (.A(Y_c), .Y(Y_c_i));
    NOR2A \Q_RNO_0[0]  (.A(\D_c[0] ), .B(PL_c), .Y(\Q_RNO_0[0]_net_1 ));
    NOR2 \Q_RNO[7]  (.A(\D_c[7] ), .B(PL_c), .Y(\Q_RNO[7]_net_1 ));
    OUTBUF Yn_pad (.D(Y_c_i), .PAD(Yn));
    NOR2 \Q_RNO[4]  (.A(\D_c[4] ), .B(PL_c), .Y(\Q_RNO[4]_net_1 ));
    NOR2 \Q_RNO[3]  (.A(\D_c[3] ), .B(PL_c), .Y(\Q_RNO[3]_net_1 ));
    DFN1P1C1 \Q[1]  (.D(\Q_4[1]_net_1 ), .CLK(CP_c), .PRE(
        \Q_RNO_0[1]_net_1 ), .CLR(\Q_RNO[1]_net_1 ), .Q(\Q[1]_net_1 ));
    NOR2 \Q_RNO[1]  (.A(\D_c[1] ), .B(PL_c), .Y(\Q_RNO[1]_net_1 ));
    MX2 \Q_4[3]  (.A(\Q[2]_net_1 ), .B(\Q[3]_net_1 ), .S(CE_c), .Y(
        \Q_4[3]_net_1 ));
    DFN1P1C1 \Q[5]  (.D(\Q_4[5]_net_1 ), .CLK(CP_c), .PRE(
        \Q_RNO_0[5]_net_1 ), .CLR(\Q_RNO[5]_net_1 ), .Q(\Q[5]_net_1 ));
    MX2 \Q_4[5]  (.A(\Q[4]_net_1 ), .B(\Q[5]_net_1 ), .S(CE_c), .Y(
        \Q_4[5]_net_1 ));
    NOR2A \Q_RNO_0[3]  (.A(\D_c[3] ), .B(PL_c), .Y(\Q_RNO_0[3]_net_1 ));
    VCC VCC_i (.Y(VCC));
    NOR2A \Q_RNO_0[1]  (.A(\D_c[1] ), .B(PL_c), .Y(\Q_RNO_0[1]_net_1 ));
    INBUF CE_pad (.PAD(CE), .Y(CE_c));
    DFN1P1C1 \Q[0]  (.D(\Q_4[0]_net_1 ), .CLK(CP_c), .PRE(
        \Q_RNO_0[0]_net_1 ), .CLR(\Q_RNO[0]_net_1 ), .Q(\Q[0]_net_1 ));
    DFN1P1C1 \Q[7]  (.D(\Q_4[7]_net_1 ), .CLK(CP_c), .PRE(
        \Q_RNO_0[7]_net_1 ), .CLR(\Q_RNO[7]_net_1 ), .Q(Y_c));
    MX2 \Q_4[1]  (.A(\Q[0]_net_1 ), .B(\Q[1]_net_1 ), .S(CE_c), .Y(
        \Q_4[1]_net_1 ));
    INBUF \D_pad[1]  (.PAD(D[1]), .Y(\D_c[1] ));
    INBUF \D_pad[6]  (.PAD(D[6]), .Y(\D_c[6] ));
    MX2 \Q_4[4]  (.A(\Q[3]_net_1 ), .B(\Q[4]_net_1 ), .S(CE_c), .Y(
        \Q_4[4]_net_1 ));
    INBUF PL_pad (.PAD(PL), .Y(PL_c));
    INBUF \D_pad[7]  (.PAD(D[7]), .Y(\D_c[7] ));
    NOR2A \Q_RNO_0[5]  (.A(\D_c[5] ), .B(PL_c), .Y(\Q_RNO_0[5]_net_1 ));
    MX2 \Q_4[0]  (.A(Ds_c), .B(\Q[0]_net_1 ), .S(CE_c), .Y(
        \Q_4[0]_net_1 ));
    DFN1P1C1 \Q[3]  (.D(\Q_4[3]_net_1 ), .CLK(CP_c), .PRE(
        \Q_RNO_0[3]_net_1 ), .CLR(\Q_RNO[3]_net_1 ), .Q(\Q[3]_net_1 ));
    INBUF \D_pad[5]  (.PAD(D[5]), .Y(\D_c[5] ));
    NOR2 \Q_RNO[2]  (.A(\D_c[2] ), .B(PL_c), .Y(\Q_RNO[2]_net_1 ));
    DFN1P1C1 \Q[6]  (.D(\Q_4[6]_net_1 ), .CLK(CP_c), .PRE(
        \Q_RNO_0[6]_net_1 ), .CLR(\Q_RNO[6]_net_1 ), .Q(\Q[6]_net_1 ));
    GND GND_i (.Y(GND));
    INBUF \D_pad[2]  (.PAD(D[2]), .Y(\D_c[2] ));
    NOR2A \Q_RNO_0[2]  (.A(\D_c[2] ), .B(PL_c), .Y(\Q_RNO_0[2]_net_1 ));
    NOR2A \Q_RNO_0[6]  (.A(\D_c[6] ), .B(PL_c), .Y(\Q_RNO_0[6]_net_1 ));
    NOR2A \Q_RNO_0[4]  (.A(\D_c[4] ), .B(PL_c), .Y(\Q_RNO_0[4]_net_1 ));
    NOR2 \Q_RNO[6]  (.A(\D_c[6] ), .B(PL_c), .Y(\Q_RNO[6]_net_1 ));
    MX2 \Q_4[6]  (.A(\Q[5]_net_1 ), .B(\Q[6]_net_1 ), .S(CE_c), .Y(
        \Q_4[6]_net_1 ));
    DFN1P1C1 \Q[2]  (.D(\Q_4[2]_net_1 ), .CLK(CP_c), .PRE(
        \Q_RNO_0[2]_net_1 ), .CLR(\Q_RNO[2]_net_1 ), .Q(\Q[2]_net_1 ));
    OUTBUF Y_pad (.D(Y_c), .PAD(Y));
    MX2 \Q_4[2]  (.A(\Q[1]_net_1 ), .B(\Q[2]_net_1 ), .S(CE_c), .Y(
        \Q_4[2]_net_1 ));
    INBUF \D_pad[0]  (.PAD(D[0]), .Y(\D_c[0] ));
    CLKBUF CP_pad (.PAD(CP), .Y(CP_c));
    DFN1P1C1 \Q[4]  (.D(\Q_4[4]_net_1 ), .CLK(CP_c), .PRE(
        \Q_RNO_0[4]_net_1 ), .CLR(\Q_RNO[4]_net_1 ), .Q(\Q[4]_net_1 ));
    NOR2 \Q_RNO[0]  (.A(\D_c[0] ), .B(PL_c), .Y(\Q_RNO[0]_net_1 ));
    NOR2 \Q_RNO[5]  (.A(\D_c[5] ), .B(PL_c), .Y(\Q_RNO[5]_net_1 ));
    NOR2A \Q_RNO_0[7]  (.A(\D_c[7] ), .B(PL_c), .Y(\Q_RNO_0[7]_net_1 ));
    MX2 \Q_4[7]  (.A(\Q[6]_net_1 ), .B(Y_c), .S(CE_c), .Y(
        \Q_4[7]_net_1 ));
    INBUF \D_pad[4]  (.PAD(D[4]), .Y(\D_c[4] ));
    INBUF \D_pad[3]  (.PAD(D[3]), .Y(\D_c[3] ));
    INBUF Ds_pad (.PAD(Ds), .Y(Ds_c));
    
endmodule
