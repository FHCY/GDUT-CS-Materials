`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4
// File used only for Simulation


module cyq_74HC74(
       sd,
       rd,
       clk,
       D,
       Q,
       Q_n
    );
input  sd;
input  rd;
input  clk;
input  D;
output Q;
output Q_n;

    wire Q_n_RNO_net_1, Q_RNO_net_1, sd_c, rd_c, clk_c, D_c, Q_c, 
        Q_n_c, D_c_i, rd_c_i, sd_c_i, \Q_pad/U0/NET1 , \Q_pad/U0/NET2 , 
        \Q_n_pad/U0/NET1 , \Q_n_pad/U0/NET2 , VCC, \rd_pad/U0/NET1 , 
        \D_pad/U0/NET1 , \sd_pad/U0/NET1 , \clk_pad/U0/NET1 , 
        AFLSDF_VCC, AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    NOR2A Q_RNO (.A(sd_c), .B(rd_c), .Y(Q_RNO_net_1));
    IOTRI_OB_EB \Q_n_pad/U0/U1  (.D(Q_n_c), .E(VCC), .DOUT(
        \Q_n_pad/U0/NET1 ), .EOUT(\Q_n_pad/U0/NET2 ));
    IOPAD_TRI \Q_n_pad/U0/U0  (.D(\Q_n_pad/U0/NET1 ), .E(
        \Q_n_pad/U0/NET2 ), .PAD(Q_n));
    DFN1P1C1 Q_n_inst_1 (.D(D_c_i), .CLK(clk_c), .PRE(rd_c_i), .CLR(
        Q_n_RNO_net_1), .Q(Q_n_c));
    DFN1P1C1 Q_inst_1 (.D(D_c), .CLK(clk_c), .PRE(sd_c_i), .CLR(
        Q_RNO_net_1), .Q(Q_c));
    IOIN_IB \sd_pad/U0/U1  (.YIN(\sd_pad/U0/NET1 ), .Y(sd_c));
    IOPAD_IN \clk_pad/U0/U0  (.PAD(clk), .Y(\clk_pad/U0/NET1 ));
    IOIN_IB \rd_pad/U0/U1  (.YIN(\rd_pad/U0/NET1 ), .Y(rd_c));
    INV Q_n_RNO_1 (.A(rd_c), .Y(rd_c_i));
    NOR2A Q_n_RNO (.A(rd_c), .B(sd_c), .Y(Q_n_RNO_net_1));
    IOPAD_IN \D_pad/U0/U0  (.PAD(D), .Y(\D_pad/U0/NET1 ));
    INV Q_n_RNO_0 (.A(D_c), .Y(D_c_i));
    IOPAD_IN \sd_pad/U0/U0  (.PAD(sd), .Y(\sd_pad/U0/NET1 ));
    IOTRI_OB_EB \Q_pad/U0/U1  (.D(Q_c), .E(VCC), .DOUT(\Q_pad/U0/NET1 )
        , .EOUT(\Q_pad/U0/NET2 ));
    IOPAD_IN \rd_pad/U0/U0  (.PAD(rd), .Y(\rd_pad/U0/NET1 ));
    IOPAD_TRI \Q_pad/U0/U0  (.D(\Q_pad/U0/NET1 ), .E(\Q_pad/U0/NET2 ), 
        .PAD(Q));
    INV Q_RNO_0 (.A(sd_c), .Y(sd_c_i));
    IOIN_IB \D_pad/U0/U1  (.YIN(\D_pad/U0/NET1 ), .Y(D_c));
    CLKIO \clk_pad/U0/U1  (.A(\clk_pad/U0/NET1 ), .Y(clk_c));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
