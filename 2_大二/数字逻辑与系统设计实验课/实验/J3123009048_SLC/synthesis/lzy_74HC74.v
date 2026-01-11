`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


module lzy_74HC74(
       Rd,
       Sd,
       Clk,
       D,
       Q,
       Qn
    );
input  Rd;
input  Sd;
input  Clk;
input  D;
output Q;
output Qn;

    wire GND, VCC, Rd_c, Sd_c, Clk_c, D_c, Q_c, Q_c_i, Sd_c_i, Rd_c_i;
    
    OUTBUF Q_pad (.D(Q_c), .PAD(Q));
    DFN1P1C1 Q_inst_1 (.D(D_c), .CLK(Clk_c), .PRE(Sd_c_i), .CLR(Rd_c_i)
        , .Q(Q_c));
    INBUF Rd_pad (.PAD(Rd), .Y(Rd_c));
    INBUF D_pad (.PAD(D), .Y(D_c));
    INV Q_RNO_0 (.A(Sd_c), .Y(Sd_c_i));
    OUTBUF Qn_pad (.D(Q_c_i), .PAD(Qn));
    INBUF Sd_pad (.PAD(Sd), .Y(Sd_c));
    INV Qn_pad_RNO (.A(Q_c), .Y(Q_c_i));
    VCC VCC_i (.Y(VCC));
    INV Q_RNO (.A(Rd_c), .Y(Rd_c_i));
    GND GND_i (.Y(GND));
    INBUF Clk_pad (.PAD(Clk), .Y(Clk_c));
    
endmodule
