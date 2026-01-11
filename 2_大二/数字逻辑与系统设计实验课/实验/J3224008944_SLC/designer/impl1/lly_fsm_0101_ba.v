`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4
// File used only for Simulation


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
        \state_ns_0_a4_1[1]_net_1 , \state_ns[0] , \state_ns[1] , 
        clk_c, rst_c, ina_c, dataout_c, N_35, N_37, N_36, 
        \state_ns_0_a4_1_0[1]_net_1 , \dataout_pad/U0/NET1 , 
        \dataout_pad/U0/NET2 , VCC, \clk_pad/U0/NET1 , 
        \rst_pad/U0/NET1 , \ina_pad/U0/NET1 , AFLSDF_VCC, AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    NOR3A \state_ns_0_a4_0[1]  (.A(\state[2]_net_1 ), .B(
        \state[0]_net_1 ), .C(ina_c), .Y(N_37));
    IOPAD_IN \ina_pad/U0/U0  (.PAD(ina), .Y(\ina_pad/U0/NET1 ));
    NOR3 \state_ns_0_a4_0[0]  (.A(\state[0]_net_1 ), .B(ina_c), .C(
        \state[2]_net_1 ), .Y(N_35));
    DFN1C0 \state[1]  (.D(\state_ns[1] ), .CLK(clk_c), .CLR(rst_c), .Q(
        \state[1]_net_1 ));
    XA1 \state_ns_0_a4[1]  (.A(ina_c), .B(\state[1]_net_1 ), .C(
        \state[0]_net_1 ), .Y(N_36));
    AO1A \state_ns_0[0]  (.A(\state[1]_net_1 ), .B(\state[0]_net_1 ), 
        .C(N_35), .Y(\state_ns[0] ));
    IOPAD_IN \clk_pad/U0/U0  (.PAD(clk), .Y(\clk_pad/U0/NET1 ));
    IOTRI_OB_EB \dataout_pad/U0/U1  (.D(dataout_c), .E(VCC), .DOUT(
        \dataout_pad/U0/NET1 ), .EOUT(\dataout_pad/U0/NET2 ));
    DFN1C0 \state[2]  (.D(\state_ns_0_a4_1[1]_net_1 ), .CLK(clk_c), 
        .CLR(rst_c), .Q(\state[2]_net_1 ));
    IOIN_IB \ina_pad/U0/U1  (.YIN(\ina_pad/U0/NET1 ), .Y(ina_c));
    NOR3A \state_ns_0_a4_1[1]  (.A(\state_ns_0_a4_1_0[1]_net_1 ), .B(
        \state[0]_net_1 ), .C(\state[2]_net_1 ), .Y(
        \state_ns_0_a4_1[1]_net_1 ));
    IOPAD_IN \rst_pad/U0/U0  (.PAD(rst), .Y(\rst_pad/U0/NET1 ));
    IOPAD_TRI \dataout_pad/U0/U0  (.D(\dataout_pad/U0/NET1 ), .E(
        \dataout_pad/U0/NET2 ), .PAD(dataout));
    DFN1C0 dataout_inst_1 (.D(\state[2]_net_1 ), .CLK(clk_c), .CLR(
        rst_c), .Q(dataout_c));
    NOR2B \state_ns_0_a4_1_0[1]  (.A(ina_c), .B(\state[1]_net_1 ), .Y(
        \state_ns_0_a4_1_0[1]_net_1 ));
    DFN1C0 \state[0]  (.D(\state_ns[0] ), .CLK(clk_c), .CLR(rst_c), .Q(
        \state[0]_net_1 ));
    IOIN_IB \rst_pad/U0/U1  (.YIN(\rst_pad/U0/NET1 ), .Y(rst_c));
    CLKIO \clk_pad/U0/U1  (.A(\clk_pad/U0/NET1 ), .Y(clk_c));
    OR3 \state_ns_0[1]  (.A(N_37), .B(N_36), .C(
        \state_ns_0_a4_1[1]_net_1 ), .Y(\state_ns[1] ));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
