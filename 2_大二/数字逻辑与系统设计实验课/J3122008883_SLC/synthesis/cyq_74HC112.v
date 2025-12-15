`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


module cyq_74HC112(
       sd,
       rd,
       clk,
       J,
       K,
       Q,
       Q_n
    );
input  sd;
input  rd;
input  clk;
input  J;
input  K;
output Q;
output Q_n;

    wire Q20_net_1, N_21_mux, GND, VCC, sd_c, rd_c, clk_c, J_c, K_c, 
        Q_c, Q_c_i_net_1, sd_c_i;
    
    OUTBUF Q_pad (.D(Q_c), .PAD(Q));
    OUTBUF Q_n_pad (.D(Q_c_i_net_1), .PAD(Q_n));
    DFN0P1C1 Q_inst_1 (.D(N_21_mux), .CLK(clk_c), .PRE(sd_c_i), .CLR(
        Q20_net_1), .Q(Q_c));
    INBUF rd_pad (.PAD(rd), .Y(rd_c));
    MX2B Q_0 (.A(J_c), .B(K_c), .S(Q_c), .Y(N_21_mux));
    NOR2A Q20 (.A(sd_c), .B(rd_c), .Y(Q20_net_1));
    INBUF J_pad (.PAD(J), .Y(J_c));
    INBUF sd_pad (.PAD(sd), .Y(sd_c));
    INV Q_c_i (.A(Q_c), .Y(Q_c_i_net_1));
    VCC VCC_i (.Y(VCC));
    INBUF K_pad (.PAD(K), .Y(K_c));
    INV Q_RNO (.A(sd_c), .Y(sd_c_i));
    GND GND_i (.Y(GND));
    INBUF clk_pad (.PAD(clk), .Y(clk_c));
    
endmodule
