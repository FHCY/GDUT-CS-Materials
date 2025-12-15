`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


module counter(
       Q_net_0,
       Aclr_c_i,
       Clk_c
    );
output [1:0] Q_net_0;
input  Aclr_c_i;
input  Clk_c;

    wire INV_1_Y, INV_0_Y, GND, VCC;
    
    INV INV_0 (.A(Q_net_0[1]), .Y(INV_0_Y));
    VCC VCC_i (.Y(VCC));
    DFN1C1 DFN1C1_NU_0 (.D(INV_1_Y), .CLK(Clk_c), .CLR(Aclr_c_i), .Q(
        Q_net_0[0]));
    INV INV_1 (.A(Q_net_0[0]), .Y(INV_1_Y));
    GND GND_i (.Y(GND));
    DFN1E1C1 DFN1E1C1_NU_1 (.D(INV_0_Y), .CLK(Clk_c), .CLR(Aclr_c_i), 
        .E(Q_net_0[0]), .Q(Q_net_0[1]));
    
endmodule


module cyq_74HC138(
       Y_net_2_0,
       Q_net_0,
       un8_Y_2_0,
       un8_Y_1_0,
       un8_Y_0
    );
output Y_net_2_0;
input  [1:0] Q_net_0;
output un8_Y_2_0;
output un8_Y_1_0;
output un8_Y_0;

    wire GND, VCC;
    
    OR2B un8_Y_3_0 (.A(Q_net_0[1]), .B(Q_net_0[0]), .Y(Y_net_2_0));
    OR2 un8_Y_0_inst_1 (.A(Q_net_0[1]), .B(Q_net_0[0]), .Y(un8_Y_0));
    OR2A un8_Y_2_0_inst_1 (.A(Q_net_0[1]), .B(Q_net_0[0]), .Y(
        un8_Y_2_0));
    OR2A un8_Y_1_0_inst_1 (.A(Q_net_0[0]), .B(Q_net_0[1]), .Y(
        un8_Y_1_0));
    VCC VCC_i (.Y(VCC));
    GND GND_i (.Y(GND));
    
endmodule


module cyq_SSD2(
       Aclr,
       Clk,
       COM_1,
       COM_2,
       COM_3,
       COM_4,
       a,
       b,
       c,
       d,
       e,
       f,
       g
    );
input  Aclr;
input  Clk;
output COM_1;
output COM_2;
output COM_3;
output COM_4;
output a;
output b;
output c;
output d;
output e;
output f;
output g;

    wire \Q_net_0[0] , \Q_net_0[1] , GND, un8_Y_0, un8_Y_1_0, 
        un8_Y_2_0, \Y_net_2[0] , Aclr_c, Clk_c, VCC, Aclr_c_i;
    
    OUTBUF f_pad (.D(\Y_net_2[0] ), .PAD(f));
    OUTBUF COM_2_pad (.D(un8_Y_1_0), .PAD(COM_2));
    OUTBUF COM_4_pad (.D(\Y_net_2[0] ), .PAD(COM_4));
    INBUF Aclr_pad (.PAD(Aclr), .Y(Aclr_c));
    CLKBUF Clk_pad (.PAD(Clk), .Y(Clk_c));
    OUTBUF a_pad (.D(VCC), .PAD(a));
    VCC VCC_i (.Y(VCC));
    OUTBUF c_pad (.D(VCC), .PAD(c));
    OUTBUF b_pad (.D(VCC), .PAD(b));
    INV Aclr_pad_RNIMJ6D (.A(Aclr_c), .Y(Aclr_c_i));
    counter counter_0 (.Q_net_0({\Q_net_0[1] , \Q_net_0[0] }), 
        .Aclr_c_i(Aclr_c_i), .Clk_c(Clk_c));
    GND GND_i (.Y(GND));
    OUTBUF COM_3_pad (.D(un8_Y_2_0), .PAD(COM_3));
    OUTBUF d_pad (.D(VCC), .PAD(d));
    cyq_74HC138 cyq_74HC138_0 (.Y_net_2_0(\Y_net_2[0] ), .Q_net_0({
        \Q_net_0[1] , \Q_net_0[0] }), .un8_Y_2_0(un8_Y_2_0), 
        .un8_Y_1_0(un8_Y_1_0), .un8_Y_0(un8_Y_0));
    OUTBUF COM_1_pad (.D(un8_Y_0), .PAD(COM_1));
    OUTBUF g_pad (.D(VCC), .PAD(g));
    OUTBUF e_pad (.D(\Y_net_2[0] ), .PAD(e));
    
endmodule
