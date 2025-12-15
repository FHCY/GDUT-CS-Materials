`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


module cyq_74HC74(
       sd,
       rd,
       clk,
       D,
       Q,
       Q_n
    );
input  sd;
input  rd;
input  clk;
input  D;
output Q;
output Q_n;

    wire Q_n_RNO_net_1, Q_RNO_net_1, GND, VCC, sd_c, rd_c, clk_c, D_c, 
        Q_c, Q_n_c, D_c_i, rd_c_i, sd_c_i;
    
    OUTBUF Q_pad (.D(Q_c), .PAD(Q));
    OUTBUF Q_n_pad (.D(Q_n_c), .PAD(Q_n));
    NOR2A Q_n_RNO (.A(rd_c), .B(sd_c), .Y(Q_n_RNO_net_1));
    DFN1P1C1 Q_inst_1 (.D(D_c), .CLK(clk_c), .PRE(sd_c_i), .CLR(
        Q_RNO_net_1), .Q(Q_c));
    INBUF rd_pad (.PAD(rd), .Y(rd_c));
    INV Q_n_RNO_0 (.A(D_c), .Y(D_c_i));
    INBUF D_pad (.PAD(D), .Y(D_c));
    INV Q_RNO_0 (.A(sd_c), .Y(sd_c_i));
    INBUF sd_pad (.PAD(sd), .Y(sd_c));
    VCC VCC_i (.Y(VCC));
    NOR2A Q_RNO (.A(sd_c), .B(rd_c), .Y(Q_RNO_net_1));
    GND GND_i (.Y(GND));
    DFN1P1C1 Q_n_inst_1 (.D(D_c_i), .CLK(clk_c), .PRE(rd_c_i), .CLR(
        Q_n_RNO_net_1), .Q(Q_n_c));
    INV Q_n_RNO_1 (.A(rd_c), .Y(rd_c_i));
    CLKBUF clk_pad (.PAD(clk), .Y(clk_c));
    
endmodule
