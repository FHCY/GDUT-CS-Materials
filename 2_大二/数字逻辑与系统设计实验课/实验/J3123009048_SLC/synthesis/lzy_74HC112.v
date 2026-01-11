`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


module lzy_74HC112(
       Rd,
       Sd,
       Clk,
       J,
       K,
       Q,
       Qn
    );
input  Rd;
input  Sd;
input  Clk;
input  J;
input  K;
output Q;
output Qn;

    wire Q18_net_1, N_21_mux, GND, VCC, Rd_c, Sd_c, Clk_c, J_c, K_c, 
        Q_c, Q_c_i_net_1, Sd_c_i;
    
    OUTBUF Q_pad (.D(Q_c), .PAD(Q));
    DFN0P1C1 Q_inst_1 (.D(N_21_mux), .CLK(Clk_c), .PRE(Sd_c_i), .CLR(
        Q18_net_1), .Q(Q_c));
    INBUF Rd_pad (.PAD(Rd), .Y(Rd_c));
    MX2B Q_0 (.A(J_c), .B(K_c), .S(Q_c), .Y(N_21_mux));
    OUTBUF Qn_pad (.D(Q_c_i_net_1), .PAD(Qn));
    INBUF J_pad (.PAD(J), .Y(J_c));
    INBUF Sd_pad (.PAD(Sd), .Y(Sd_c));
    INV Q_c_i (.A(Q_c), .Y(Q_c_i_net_1));
    VCC VCC_i (.Y(VCC));
    INBUF K_pad (.PAD(K), .Y(K_c));
    INV Q_RNO (.A(Sd_c), .Y(Sd_c_i));
    NOR2A Q18 (.A(Sd_c), .B(Rd_c), .Y(Q18_net_1));
    GND GND_i (.Y(GND));
    INBUF Clk_pad (.PAD(Clk), .Y(Clk_c));
    
endmodule
