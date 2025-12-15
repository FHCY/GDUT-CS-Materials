`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4
// File used only for Simulation


module cyq_fsm_011(
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
        \current_S_ns_i[1]_net_1 , Rst_c, Clk_c, X_c, Y_d_c, 
        \Y_pad/U0/NET1 , \Y_pad/U0/NET2 , VCC, \X_pad/U0/NET1 , 
        \Rst_pad/U0/NET1 , \Clk_pad/U0/NET1 , AFLSDF_VCC, AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    IOPAD_IN \Clk_pad/U0/U0  (.PAD(Clk), .Y(\Clk_pad/U0/NET1 ));
    IOTRI_OB_EB \Y_pad/U0/U1  (.D(Y_d_c), .E(VCC), .DOUT(
        \Y_pad/U0/NET1 ), .EOUT(\Y_pad/U0/NET2 ));
    AO1C \current_S_ns_0[0]  (.A(\current_S[1]_net_1 ), .B(
        \current_S[0]_net_1 ), .C(X_c), .Y(\current_S_ns[0] ));
    DFN1C0 \current_S[1]  (.D(\current_S_ns_i[1]_net_1 ), .CLK(Clk_c), 
        .CLR(Rst_c), .Q(\current_S[1]_net_1 ));
    DFN1C0 \current_S[0]  (.D(\current_S_ns[0] ), .CLK(Clk_c), .CLR(
        Rst_c), .Q(\current_S[0]_net_1 ));
    IOPAD_IN \Rst_pad/U0/U0  (.PAD(Rst), .Y(\Rst_pad/U0/NET1 ));
    NOR2A current_S_s2_0_a2 (.A(\current_S[1]_net_1 ), .B(
        \current_S[0]_net_1 ), .Y(Y_d_c));
    IOPAD_IN \X_pad/U0/U0  (.PAD(X), .Y(\X_pad/U0/NET1 ));
    IOIN_IB \X_pad/U0/U1  (.YIN(\X_pad/U0/NET1 ), .Y(X_c));
    IOIN_IB \Rst_pad/U0/U1  (.YIN(\Rst_pad/U0/NET1 ), .Y(Rst_c));
    NOR2B \current_S_ns_i[1]  (.A(\current_S[0]_net_1 ), .B(X_c), .Y(
        \current_S_ns_i[1]_net_1 ));
    CLKIO \Clk_pad/U0/U1  (.A(\Clk_pad/U0/NET1 ), .Y(Clk_c));
    IOPAD_TRI \Y_pad/U0/U0  (.D(\Y_pad/U0/NET1 ), .E(\Y_pad/U0/NET2 ), 
        .PAD(Y));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
