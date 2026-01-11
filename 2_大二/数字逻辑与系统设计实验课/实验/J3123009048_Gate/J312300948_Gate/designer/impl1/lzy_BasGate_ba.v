`timescale 1 ns/100 ps
// Version: v11.9 SP6 11.9.6.7
// File used only for Simulation


module lzy_BasGate(
       A,
       B,
       Y1,
       Y2,
       Y3,
       Y4,
       Y5,
       Y6
    );
input  A;
input  B;
output Y1;
output Y2;
output Y3;
output Y4;
output Y5;
output Y6;

    wire A_c, B_c, Y1_c, Y3_c, Y5_c, Y3_c_i, Y1_c_i, A_c_i, 
        \Y6_pad/U0/NET1 , \Y6_pad/U0/NET2 , \Y5_pad/U0/NET1 , 
        \Y5_pad/U0/NET2 , \Y4_pad/U0/NET1 , \Y4_pad/U0/NET2 , 
        \Y3_pad/U0/NET1 , \Y3_pad/U0/NET2 , \B_pad/U0/NET1 , 
        \Y2_pad/U0/NET1 , \Y2_pad/U0/NET2 , \Y1_pad/U0/NET1 , 
        \Y1_pad/U0/NET2 , VCC, \A_pad/U0/NET1 , GND, AFLSDF_VCC, 
        AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    INV Y6_pad_RNO (.A(A_c), .Y(A_c_i));
    IOTRI_OB_EB \Y1_pad/U0/U1  (.D(Y1_c), .E(VCC), .DOUT(
        \Y1_pad/U0/NET1 ), .EOUT(\Y1_pad/U0/NET2 ));
    IOPAD_TRI \Y1_pad/U0/U0  (.D(\Y1_pad/U0/NET1 ), .E(
        \Y1_pad/U0/NET2 ), .PAD(Y1));
    NOR2B B_pad_RNIB53D_0 (.A(B_c), .B(A_c), .Y(Y1_c));
    IOTRI_OB_EB \Y4_pad/U0/U1  (.D(Y3_c_i), .E(VCC), .DOUT(
        \Y4_pad/U0/NET1 ), .EOUT(\Y4_pad/U0/NET2 ));
    IOIN_IB \A_pad/U0/U1  (.YIN(\A_pad/U0/NET1 ), .Y(A_c));
    IOPAD_TRI \Y3_pad/U0/U0  (.D(\Y3_pad/U0/NET1 ), .E(
        \Y3_pad/U0/NET2 ), .PAD(Y3));
    IOPAD_IN \B_pad/U0/U0  (.PAD(B), .Y(\B_pad/U0/NET1 ));
    XOR2 Y5_inst_1 (.A(A_c), .B(B_c), .Y(Y5_c));
    IOPAD_TRI \Y4_pad/U0/U0  (.D(\Y4_pad/U0/NET1 ), .E(
        \Y4_pad/U0/NET2 ), .PAD(Y4));
    IOTRI_OB_EB \Y3_pad/U0/U1  (.D(Y3_c), .E(VCC), .DOUT(
        \Y3_pad/U0/NET1 ), .EOUT(\Y3_pad/U0/NET2 ));
    IOPAD_TRI \Y6_pad/U0/U0  (.D(\Y6_pad/U0/NET1 ), .E(
        \Y6_pad/U0/NET2 ), .PAD(Y6));
    IOIN_IB \B_pad/U0/U1  (.YIN(\B_pad/U0/NET1 ), .Y(B_c));
    INV Y2_pad_RNO (.A(Y1_c), .Y(Y1_c_i));
    IOPAD_IN \A_pad/U0/U0  (.PAD(A), .Y(\A_pad/U0/NET1 ));
    IOPAD_TRI \Y5_pad/U0/U0  (.D(\Y5_pad/U0/NET1 ), .E(
        \Y5_pad/U0/NET2 ), .PAD(Y5));
    OR2 B_pad_RNIB53D (.A(B_c), .B(A_c), .Y(Y3_c));
    IOTRI_OB_EB \Y6_pad/U0/U1  (.D(A_c_i), .E(VCC), .DOUT(
        \Y6_pad/U0/NET1 ), .EOUT(\Y6_pad/U0/NET2 ));
    IOTRI_OB_EB \Y5_pad/U0/U1  (.D(Y5_c), .E(VCC), .DOUT(
        \Y5_pad/U0/NET1 ), .EOUT(\Y5_pad/U0/NET2 ));
    INV Y4_pad_RNO (.A(Y3_c), .Y(Y3_c_i));
    IOPAD_TRI \Y2_pad/U0/U0  (.D(\Y2_pad/U0/NET1 ), .E(
        \Y2_pad/U0/NET2 ), .PAD(Y2));
    IOTRI_OB_EB \Y2_pad/U0/U1  (.D(Y1_c_i), .E(VCC), .DOUT(
        \Y2_pad/U0/NET1 ), .EOUT(\Y2_pad/U0/NET2 ));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
