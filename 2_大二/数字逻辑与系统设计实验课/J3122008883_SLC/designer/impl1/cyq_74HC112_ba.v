`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4
// File used only for Simulation


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

    wire Q20_net_1, N_21_mux, sd_c, rd_c, clk_c, J_c, K_c, Q_c, 
        Q_c_i_net_1, sd_c_i, \Q_pad/U0/NET1 , \Q_pad/U0/NET2 , 
        \Q_n_pad/U0/NET1 , \Q_n_pad/U0/NET2 , VCC, \rd_pad/U0/NET1 , 
        \J_pad/U0/NET1 , \sd_pad/U0/NET1 , \K_pad/U0/NET1 , 
        \clk_pad/U0/NET1 , GND, AFLSDF_VCC, AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    IOIN_IB \J_pad/U0/U1  (.YIN(\J_pad/U0/NET1 ), .Y(J_c));
    INV Q_RNO (.A(sd_c), .Y(sd_c_i));
    IOTRI_OB_EB \Q_n_pad/U0/U1  (.D(Q_c_i_net_1), .E(VCC), .DOUT(
        \Q_n_pad/U0/NET1 ), .EOUT(\Q_n_pad/U0/NET2 ));
    IOPAD_TRI \Q_n_pad/U0/U0  (.D(\Q_n_pad/U0/NET1 ), .E(
        \Q_n_pad/U0/NET2 ), .PAD(Q_n));
    MX2B Q_0 (.A(J_c), .B(K_c), .S(Q_c), .Y(N_21_mux));
    IOPAD_IN \J_pad/U0/U0  (.PAD(J), .Y(\J_pad/U0/NET1 ));
    DFN0P1C1 Q_inst_1 (.D(N_21_mux), .CLK(clk_c), .PRE(sd_c_i), .CLR(
        Q20_net_1), .Q(Q_c));
    IOIN_IB \K_pad/U0/U1  (.YIN(\K_pad/U0/NET1 ), .Y(K_c));
    IOIN_IB \sd_pad/U0/U1  (.YIN(\sd_pad/U0/NET1 ), .Y(sd_c));
    IOPAD_IN \clk_pad/U0/U0  (.PAD(clk), .Y(\clk_pad/U0/NET1 ));
    IOIN_IB \rd_pad/U0/U1  (.YIN(\rd_pad/U0/NET1 ), .Y(rd_c));
    INV Q_c_i (.A(Q_c), .Y(Q_c_i_net_1));
    IOPAD_IN \K_pad/U0/U0  (.PAD(K), .Y(\K_pad/U0/NET1 ));
    NOR2A Q20 (.A(sd_c), .B(rd_c), .Y(Q20_net_1));
    IOPAD_IN \sd_pad/U0/U0  (.PAD(sd), .Y(\sd_pad/U0/NET1 ));
    IOTRI_OB_EB \Q_pad/U0/U1  (.D(Q_c), .E(VCC), .DOUT(\Q_pad/U0/NET1 )
        , .EOUT(\Q_pad/U0/NET2 ));
    IOPAD_IN \rd_pad/U0/U0  (.PAD(rd), .Y(\rd_pad/U0/NET1 ));
    IOPAD_TRI \Q_pad/U0/U0  (.D(\Q_pad/U0/NET1 ), .E(\Q_pad/U0/NET2 ), 
        .PAD(Q));
    IOIN_IB \clk_pad/U0/U1  (.YIN(\clk_pad/U0/NET1 ), .Y(clk_c));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
