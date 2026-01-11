`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4
// File used only for Simulation


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

    wire Q18_net_1, N_21_mux, Rd_c, Sd_c, Clk_c, J_c, K_c, Q_c, 
        Q_c_i_net_1, Sd_c_i, \Q_pad/U0/NET1 , \Q_pad/U0/NET2 , 
        \Rd_pad/U0/NET1 , \Qn_pad/U0/NET1 , \Qn_pad/U0/NET2 , VCC, 
        \J_pad/U0/NET1 , \Sd_pad/U0/NET1 , \K_pad/U0/NET1 , 
        \Clk_pad/U0/NET1 , GND, AFLSDF_VCC, AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    IOIN_IB \J_pad/U0/U1  (.YIN(\J_pad/U0/NET1 ), .Y(J_c));
    INV Q_RNO (.A(Sd_c), .Y(Sd_c_i));
    MX2B Q_0 (.A(J_c), .B(K_c), .S(Q_c), .Y(N_21_mux));
    IOPAD_TRI \Qn_pad/U0/U0  (.D(\Qn_pad/U0/NET1 ), .E(
        \Qn_pad/U0/NET2 ), .PAD(Qn));
    IOPAD_IN \J_pad/U0/U0  (.PAD(J), .Y(\J_pad/U0/NET1 ));
    DFN0P1C1 Q_inst_1 (.D(N_21_mux), .CLK(Clk_c), .PRE(Sd_c_i), .CLR(
        Q18_net_1), .Q(Q_c));
    IOIN_IB \K_pad/U0/U1  (.YIN(\K_pad/U0/NET1 ), .Y(K_c));
    IOIN_IB \Sd_pad/U0/U1  (.YIN(\Sd_pad/U0/NET1 ), .Y(Sd_c));
    IOPAD_IN \Clk_pad/U0/U0  (.PAD(Clk), .Y(\Clk_pad/U0/NET1 ));
    IOIN_IB \Rd_pad/U0/U1  (.YIN(\Rd_pad/U0/NET1 ), .Y(Rd_c));
    INV Q_c_i (.A(Q_c), .Y(Q_c_i_net_1));
    IOPAD_IN \K_pad/U0/U0  (.PAD(K), .Y(\K_pad/U0/NET1 ));
    IOTRI_OB_EB \Qn_pad/U0/U1  (.D(Q_c_i_net_1), .E(VCC), .DOUT(
        \Qn_pad/U0/NET1 ), .EOUT(\Qn_pad/U0/NET2 ));
    IOPAD_IN \Sd_pad/U0/U0  (.PAD(Sd), .Y(\Sd_pad/U0/NET1 ));
    IOTRI_OB_EB \Q_pad/U0/U1  (.D(Q_c), .E(VCC), .DOUT(\Q_pad/U0/NET1 )
        , .EOUT(\Q_pad/U0/NET2 ));
    IOPAD_IN \Rd_pad/U0/U0  (.PAD(Rd), .Y(\Rd_pad/U0/NET1 ));
    IOPAD_TRI \Q_pad/U0/U0  (.D(\Q_pad/U0/NET1 ), .E(\Q_pad/U0/NET2 ), 
        .PAD(Q));
    IOIN_IB \Clk_pad/U0/U1  (.YIN(\Clk_pad/U0/NET1 ), .Y(Clk_c));
    NOR2A Q18 (.A(Sd_c), .B(Rd_c), .Y(Q18_net_1));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
