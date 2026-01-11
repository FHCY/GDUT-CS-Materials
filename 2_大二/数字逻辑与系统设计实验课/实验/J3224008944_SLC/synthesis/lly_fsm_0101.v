`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


module lly_fsm_0101(
       clk,
       rst,
       ina,
       dataout
    );
input  clk;
input  rst;
input  ina;
output dataout;

    wire \state[0]_net_1 , \state[1]_net_1 , \state[2]_net_1 , 
        \state_ns_0_a4_1[1]_net_1 , \state_ns[0] , \state_ns[1] , GND, 
        VCC, clk_c, rst_c, ina_c, dataout_c, N_35, N_37, N_36, 
        \state_ns_0_a4_1_0[1]_net_1 ;
    
    OUTBUF dataout_pad (.D(dataout_c), .PAD(dataout));
    CLKBUF clk_pad (.PAD(clk), .Y(clk_c));
    NOR3A \state_ns_0_a4_0[1]  (.A(\state[2]_net_1 ), .B(
        \state[0]_net_1 ), .C(ina_c), .Y(N_37));
    NOR3 \state_ns_0_a4_0[0]  (.A(\state[0]_net_1 ), .B(ina_c), .C(
        \state[2]_net_1 ), .Y(N_35));
    DFN1C0 \state[1]  (.D(\state_ns[1] ), .CLK(clk_c), .CLR(rst_c), .Q(
        \state[1]_net_1 ));
    XA1 \state_ns_0_a4[1]  (.A(ina_c), .B(\state[1]_net_1 ), .C(
        \state[0]_net_1 ), .Y(N_36));
    AO1A \state_ns_0[0]  (.A(\state[1]_net_1 ), .B(\state[0]_net_1 ), 
        .C(N_35), .Y(\state_ns[0] ));
    INBUF rst_pad (.PAD(rst), .Y(rst_c));
    VCC VCC_i (.Y(VCC));
    INBUF ina_pad (.PAD(ina), .Y(ina_c));
    DFN1C0 \state[2]  (.D(\state_ns_0_a4_1[1]_net_1 ), .CLK(clk_c), 
        .CLR(rst_c), .Q(\state[2]_net_1 ));
    GND GND_i (.Y(GND));
    NOR3A \state_ns_0_a4_1[1]  (.A(\state_ns_0_a4_1_0[1]_net_1 ), .B(
        \state[0]_net_1 ), .C(\state[2]_net_1 ), .Y(
        \state_ns_0_a4_1[1]_net_1 ));
    DFN1C0 dataout_inst_1 (.D(\state[2]_net_1 ), .CLK(clk_c), .CLR(
        rst_c), .Q(dataout_c));
    NOR2B \state_ns_0_a4_1_0[1]  (.A(ina_c), .B(\state[1]_net_1 ), .Y(
        \state_ns_0_a4_1_0[1]_net_1 ));
    DFN1C0 \state[0]  (.D(\state_ns[0] ), .CLK(clk_c), .CLR(rst_c), .Q(
        \state[0]_net_1 ));
    OR3 \state_ns_0[1]  (.A(N_37), .B(N_36), .C(
        \state_ns_0_a4_1[1]_net_1 ), .Y(\state_ns[1] ));
    
endmodule
