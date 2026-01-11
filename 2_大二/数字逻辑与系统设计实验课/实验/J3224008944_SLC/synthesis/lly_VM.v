`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


module lly_VM(
       Reset,
       Clk,
       D_in,
       D_out,
       D_C
    );
input  Reset;
input  Clk;
input  [1:0] D_in;
output D_out;
output D_C;

    wire i3_i, i1_i, \current_s[2]_net_1 , \current_s[3]_net_1 , GND, 
        VCC, N_22_mux, N_4_0, N_7_0, N_10_0, N_13, N_15, N_21, Reset_c, 
        Clk_c, \D_in_c[0] , \D_in_c[1] , D_C_c, N_26_mux, N_26, N_14, 
        N_60, N_8_0, N_5_0, m19_e_1, \current_s_i_0[4] ;
    
    OR2A D_out_pad_RNO (.A(\current_s_i_0[4] ), .B(D_C_c), .Y(N_22_mux)
        );
    DFN1C1 \current_s[2]  (.D(N_13), .CLK(Clk_c), .CLR(Reset_c), .Q(
        \current_s[2]_net_1 ));
    OUTBUF D_out_pad (.D(N_22_mux), .PAD(D_out));
    OUTBUF D_C_pad (.D(D_C_c), .PAD(D_C));
    CLKBUF Clk_pad (.PAD(Clk), .Y(Clk_c));
    NOR2B \current_s_RNO[5]  (.A(\current_s[3]_net_1 ), .B(\D_in_c[1] )
        , .Y(N_4_0));
    NOR3A \current_s_RNO_2[0]  (.A(\current_s_i_0[4] ), .B(\D_in_c[1] )
        , .C(\D_in_c[0] ), .Y(m19_e_1));
    NOR3A \current_s_RNO_1[0]  (.A(m19_e_1), .B(i1_i), .C(
        \current_s[3]_net_1 ), .Y(N_26));
    MX2C \current_s_RNO[4]  (.A(N_5_0), .B(\current_s[2]_net_1 ), .S(
        \D_in_c[1] ), .Y(N_7_0));
    DFN1C1 \current_s[5]  (.D(N_4_0), .CLK(Clk_c), .CLR(Reset_c), .Q(
        D_C_c));
    INBUF \D_in_pad[0]  (.PAD(D_in[0]), .Y(\D_in_c[0] ));
    NOR2B \current_s_RNO_0[4]  (.A(\current_s[3]_net_1 ), .B(
        \D_in_c[0] ), .Y(N_5_0));
    MX2A \current_s_RNO[3]  (.A(N_8_0), .B(i1_i), .S(\D_in_c[1] ), .Y(
        N_10_0));
    VCC VCC_i (.Y(VCC));
    MX2 \current_s_RNO_0[1]  (.A(i1_i), .B(i3_i), .S(\D_in_c[0] ), .Y(
        N_14));
    MX2 \current_s_RNO[2]  (.A(N_60), .B(i3_i), .S(\D_in_c[1] ), .Y(
        N_13));
    GND GND_i (.Y(GND));
    DFN1P1 \current_s[4]  (.D(N_7_0), .CLK(Clk_c), .PRE(Reset_c), .Q(
        \current_s_i_0[4] ));
    DFN1C1 \current_s[3]  (.D(N_10_0), .CLK(Clk_c), .CLR(Reset_c), .Q(
        \current_s[3]_net_1 ));
    INBUF Reset_pad (.PAD(Reset), .Y(Reset_c));
    MX2 \current_s_RNO_0[0]  (.A(\current_s_i_0[4] ), .B(
        \current_s[2]_net_1 ), .S(N_26), .Y(N_26_mux));
    DFN1C1 \current_s[1]  (.D(N_15), .CLK(Clk_c), .CLR(Reset_c), .Q(
        i1_i));
    DFN1P1 \current_s[0]  (.D(N_21), .CLK(Clk_c), .PRE(Reset_c), .Q(
        i3_i));
    MX2 \current_s_RNO_0[2]  (.A(\current_s[2]_net_1 ), .B(i1_i), .S(
        \D_in_c[0] ), .Y(N_60));
    OR2A \current_s_RNO[0]  (.A(N_26_mux), .B(D_C_c), .Y(N_21));
    MX2C \current_s_RNO_0[3]  (.A(\current_s[3]_net_1 ), .B(
        \current_s[2]_net_1 ), .S(\D_in_c[0] ), .Y(N_8_0));
    INBUF \D_in_pad[1]  (.PAD(D_in[1]), .Y(\D_in_c[1] ));
    NOR2A \current_s_RNO[1]  (.A(N_14), .B(\D_in_c[1] ), .Y(N_15));
    
endmodule
