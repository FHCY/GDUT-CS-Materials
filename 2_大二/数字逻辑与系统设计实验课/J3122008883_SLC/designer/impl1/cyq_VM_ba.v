`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4
// File used only for Simulation


module cyq_VM(
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

    wire i3_i, i1_i, \current_s[2]_net_1 , \current_s[3]_net_1 , 
        N_22_mux, N_4_0, N_7_0, N_10_0, N_13, N_15, N_21, Reset_c, 
        Clk_c, \D_in_c[0] , \D_in_c[1] , D_C_c, N_26_mux, N_26, N_14, 
        N_60, N_8_0, N_5_0, m19_e_1, \current_s_i_0[4] , 
        \D_out_pad/U0/NET1 , \D_out_pad/U0/NET2 , \D_C_pad/U0/NET1 , 
        \D_C_pad/U0/NET2 , VCC, \Clk_pad/U0/NET1 , 
        \D_in_pad[0]/U0/NET1 , \Reset_pad/U0/NET1 , 
        \D_in_pad[1]/U0/NET1 , AFLSDF_VCC, AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    DFN1P1 \current_s[0]  (.D(N_21), .CLK(Clk_c), .PRE(Reset_c), .Q(
        i3_i));
    IOPAD_IN \D_in_pad[0]/U0/U0  (.PAD(D_in[0]), .Y(
        \D_in_pad[0]/U0/NET1 ));
    MX2 \current_s_RNO_0[2]  (.A(\current_s[2]_net_1 ), .B(i1_i), .S(
        \D_in_c[0] ), .Y(N_60));
    IOTRI_OB_EB \D_out_pad/U0/U1  (.D(N_22_mux), .E(VCC), .DOUT(
        \D_out_pad/U0/NET1 ), .EOUT(\D_out_pad/U0/NET2 ));
    IOPAD_TRI \D_out_pad/U0/U0  (.D(\D_out_pad/U0/NET1 ), .E(
        \D_out_pad/U0/NET2 ), .PAD(D_out));
    NOR3A \current_s_RNO_1[0]  (.A(m19_e_1), .B(i1_i), .C(
        \current_s[3]_net_1 ), .Y(N_26));
    MX2 \current_s_RNO_0[0]  (.A(\current_s_i_0[4] ), .B(
        \current_s[2]_net_1 ), .S(N_26), .Y(N_26_mux));
    IOIN_IB \D_in_pad[1]/U0/U1  (.YIN(\D_in_pad[1]/U0/NET1 ), .Y(
        \D_in_c[1] ));
    MX2C \current_s_RNO_0[3]  (.A(\current_s[3]_net_1 ), .B(
        \current_s[2]_net_1 ), .S(\D_in_c[0] ), .Y(N_8_0));
    DFN1C1 \current_s[5]  (.D(N_4_0), .CLK(Clk_c), .CLR(Reset_c), .Q(
        D_C_c));
    CLKIO \Clk_pad/U0/U1  (.A(\Clk_pad/U0/NET1 ), .Y(Clk_c));
    IOIN_IB \Reset_pad/U0/U1  (.YIN(\Reset_pad/U0/NET1 ), .Y(Reset_c));
    MX2C \current_s_RNO[4]  (.A(N_5_0), .B(\current_s[2]_net_1 ), .S(
        \D_in_c[1] ), .Y(N_7_0));
    IOPAD_IN \Reset_pad/U0/U0  (.PAD(Reset), .Y(\Reset_pad/U0/NET1 ));
    DFN1P1 \current_s[4]  (.D(N_7_0), .CLK(Clk_c), .PRE(Reset_c), .Q(
        \current_s_i_0[4] ));
    MX2 \current_s_RNO[2]  (.A(N_60), .B(i3_i), .S(\D_in_c[1] ), .Y(
        N_13));
    IOTRI_OB_EB \D_C_pad/U0/U1  (.D(D_C_c), .E(VCC), .DOUT(
        \D_C_pad/U0/NET1 ), .EOUT(\D_C_pad/U0/NET2 ));
    IOPAD_IN \Clk_pad/U0/U0  (.PAD(Clk), .Y(\Clk_pad/U0/NET1 ));
    DFN1C1 \current_s[1]  (.D(N_15), .CLK(Clk_c), .CLR(Reset_c), .Q(
        i1_i));
    NOR2A \current_s_RNO[1]  (.A(N_14), .B(\D_in_c[1] ), .Y(N_15));
    IOPAD_IN \D_in_pad[1]/U0/U0  (.PAD(D_in[1]), .Y(
        \D_in_pad[1]/U0/NET1 ));
    NOR3A \current_s_RNO_2[0]  (.A(\current_s_i_0[4] ), .B(\D_in_c[1] )
        , .C(\D_in_c[0] ), .Y(m19_e_1));
    OR2A \current_s_RNO[0]  (.A(N_26_mux), .B(D_C_c), .Y(N_21));
    IOIN_IB \D_in_pad[0]/U0/U1  (.YIN(\D_in_pad[0]/U0/NET1 ), .Y(
        \D_in_c[0] ));
    NOR2B \current_s_RNO[5]  (.A(\current_s[3]_net_1 ), .B(\D_in_c[1] )
        , .Y(N_4_0));
    OR2A D_out_pad_RNO (.A(\current_s_i_0[4] ), .B(D_C_c), .Y(N_22_mux)
        );
    DFN1C1 \current_s[2]  (.D(N_13), .CLK(Clk_c), .CLR(Reset_c), .Q(
        \current_s[2]_net_1 ));
    DFN1C1 \current_s[3]  (.D(N_10_0), .CLK(Clk_c), .CLR(Reset_c), .Q(
        \current_s[3]_net_1 ));
    NOR2B \current_s_RNO_0[4]  (.A(\current_s[3]_net_1 ), .B(
        \D_in_c[0] ), .Y(N_5_0));
    MX2A \current_s_RNO[3]  (.A(N_8_0), .B(i1_i), .S(\D_in_c[1] ), .Y(
        N_10_0));
    MX2 \current_s_RNO_0[1]  (.A(i1_i), .B(i3_i), .S(\D_in_c[0] ), .Y(
        N_14));
    IOPAD_TRI \D_C_pad/U0/U0  (.D(\D_C_pad/U0/NET1 ), .E(
        \D_C_pad/U0/NET2 ), .PAD(D_C));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
