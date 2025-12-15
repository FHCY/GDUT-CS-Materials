`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


module cyq_FSM_011_Moore(
       Rst,
       Clk,
       X,
       Y
    );
input  Rst;
input  Clk;
input  X;
output Y;

    wire \current_S[0]_net_1 , \current_S[1]_net_1 , \current_S_ns[0] , 
        \current_S_ns_i[1]_net_1 , GND, VCC, Rst_c, Clk_c, X_c, Y_d_c;
    
    OUTBUF Y_pad (.D(Y_d_c), .PAD(Y));
    INBUF X_pad (.PAD(X), .Y(X_c));
    INBUF Rst_pad (.PAD(Rst), .Y(Rst_c));
    DFN1C0 \current_S[1]  (.D(\current_S_ns_i[1]_net_1 ), .CLK(Clk_c), 
        .CLR(Rst_c), .Q(\current_S[1]_net_1 ));
    VCC VCC_i (.Y(VCC));
    NOR2A current_S_s2_0_a2 (.A(\current_S[1]_net_1 ), .B(
        \current_S[0]_net_1 ), .Y(Y_d_c));
    DFN1C0 \current_S[0]  (.D(\current_S_ns[0] ), .CLK(Clk_c), .CLR(
        Rst_c), .Q(\current_S[0]_net_1 ));
    GND GND_i (.Y(GND));
    NOR2B \current_S_ns_i[1]  (.A(\current_S[0]_net_1 ), .B(X_c), .Y(
        \current_S_ns_i[1]_net_1 ));
    AO1C \current_S_ns_0[0]  (.A(\current_S[1]_net_1 ), .B(
        \current_S[0]_net_1 ), .C(X_c), .Y(\current_S_ns[0] ));
    CLKBUF Clk_pad (.PAD(Clk), .Y(Clk_c));
    
endmodule
