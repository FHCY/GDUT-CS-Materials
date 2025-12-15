`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4
// File used only for Simulation


module cyq_SD1(
       A,
       B,
       C,
       Y
    );
input  A;
input  B;
input  C;
output Y;

    wire A_c, B_c, C_c, Y_c, \C_pad/U0/NET1 , \B_pad/U0/NET1 , 
        \Y_pad/U0/NET1 , \Y_pad/U0/NET2 , VCC, \A_pad/U0/NET1 , GND, 
        AFLSDF_VCC, AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    IOPAD_IN \C_pad/U0/U0  (.PAD(C), .Y(\C_pad/U0/NET1 ));
    IOIN_IB \B_pad/U0/U1  (.YIN(\B_pad/U0/NET1 ), .Y(B_c));
    IOPAD_IN \A_pad/U0/U0  (.PAD(A), .Y(\A_pad/U0/NET1 ));
    IOTRI_OB_EB \Y_pad/U0/U1  (.D(Y_c), .E(VCC), .DOUT(\Y_pad/U0/NET1 )
        , .EOUT(\Y_pad/U0/NET2 ));
    AO16 \cyq_74HC153_0/Y_2s_iv  (.A(A_c), .B(B_c), .C(C_c), .Y(Y_c));
    IOIN_IB \A_pad/U0/U1  (.YIN(\A_pad/U0/NET1 ), .Y(A_c));
    IOPAD_TRI \Y_pad/U0/U0  (.D(\Y_pad/U0/NET1 ), .E(\Y_pad/U0/NET2 ), 
        .PAD(Y));
    IOPAD_IN \B_pad/U0/U0  (.PAD(B), .Y(\B_pad/U0/NET1 ));
    IOIN_IB \C_pad/U0/U1  (.YIN(\C_pad/U0/NET1 ), .Y(C_c));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
