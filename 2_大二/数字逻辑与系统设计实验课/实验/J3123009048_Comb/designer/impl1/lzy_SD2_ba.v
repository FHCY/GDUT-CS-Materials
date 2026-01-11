`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4
// File used only for Simulation


module lzy_SD2(
       EI,
       I,
       Y
    );
input  EI;
input  [7:0] I;
output [7:0] Y;

    wire EI_c, \I_c[0] , \I_c[1] , \I_c[2] , \I_c[3] , \I_c[4] , 
        \I_c[5] , \I_c[6] , \I_c[7] , \Y_c[0] , \Y_c[1] , \Y_c[2] , 
        \Y_c[3] , \Y_c[4] , \Y_c[5] , \Y_c[6] , GND, 
        \lzy_74HC148_0.N_20 , \A_net_0[2] , \lzy_74HC148_0.N_9 , 
        \lzy_74HC4511_0.A_i_1[1] , \lzy_74HC148_0.N_14 , 
        GS_OUT_PRE_INV0_0, \lzy_74HC4511_0.A_i_1[0] , 
        \lzy_74HC148_0.N_17 , \lzy_74HC4511_0/S_1_0_0[1]_net_1 , 
        \lzy_74HC4511_0/N_33 , \lzy_74HC4511_0/N_29 , 
        \lzy_74HC4511_0/N_32 , \lzy_74HC4511_0/N_34 , 
        \lzy_74HC4511_0/N_35 , \lzy_74HC148_0/GS_0_a3_1_net_1 , 
        \lzy_74HC148_0/GS_0_a3_0_net_1 , \lzy_74HC148_0/N_8 , 
        \lzy_74HC148_0/N_15 , \lzy_74HC148_0/N_10 , \Y_pad[0]/U0/NET1 , 
        \Y_pad[0]/U0/NET2 , \Y_pad[4]/U0/NET1 , \Y_pad[4]/U0/NET2 , 
        \I_pad[5]/U0/NET1 , \I_pad[4]/U0/NET1 , \I_pad[6]/U0/NET1 , 
        \I_pad[7]/U0/NET1 , \I_pad[2]/U0/NET1 , \I_pad[0]/U0/NET1 , 
        \Y_pad[5]/U0/NET1 , \Y_pad[5]/U0/NET2 , \Y_pad[2]/U0/NET1 , 
        \Y_pad[2]/U0/NET2 , \I_pad[1]/U0/NET1 , \EI_pad/U0/NET1 , 
        \Y_pad[3]/U0/NET1 , \Y_pad[3]/U0/NET2 , \Y_pad[1]/U0/NET1 , 
        \Y_pad[1]/U0/NET2 , \I_pad[3]/U0/NET1 , \Y_pad[7]/U0/NET1 , 
        \Y_pad[7]/U0/NET2 , \Y_pad[6]/U0/NET1 , \Y_pad[6]/U0/NET2 , 
        VCC, AFLSDF_VCC, AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    IOPAD_IN \I_pad[0]/U0/U0  (.PAD(I[0]), .Y(\I_pad[0]/U0/NET1 ));
    NOR3C \lzy_74HC148_0/A_i_0_a3[0]  (.A(\I_c[6] ), .B(
        \lzy_74HC148_0/N_10 ), .C(\I_c[4] ), .Y(\lzy_74HC148_0/N_15 ));
    IOIN_IB \I_pad[3]/U0/U1  (.YIN(\I_pad[3]/U0/NET1 ), .Y(\I_c[3] ));
    IOTRI_OB_EB \Y_pad[0]/U0/U1  (.D(\Y_c[0] ), .E(VCC), .DOUT(
        \Y_pad[0]/U0/NET1 ), .EOUT(\Y_pad[0]/U0/NET2 ));
    IOPAD_TRI \Y_pad[7]/U0/U0  (.D(\Y_pad[7]/U0/NET1 ), .E(
        \Y_pad[7]/U0/NET2 ), .PAD(Y[7]));
    IOTRI_OB_EB \Y_pad[5]/U0/U1  (.D(\Y_c[5] ), .E(VCC), .DOUT(
        \Y_pad[5]/U0/NET1 ), .EOUT(\Y_pad[5]/U0/NET2 ));
    IOIN_IB \I_pad[1]/U0/U1  (.YIN(\I_pad[1]/U0/NET1 ), .Y(\I_c[1] ));
    IOTRI_OB_EB \Y_pad[4]/U0/U1  (.D(\Y_c[4] ), .E(VCC), .DOUT(
        \Y_pad[4]/U0/NET1 ), .EOUT(\Y_pad[4]/U0/NET2 ));
    IOPAD_TRI \Y_pad[2]/U0/U0  (.D(\Y_pad[2]/U0/NET1 ), .E(
        \Y_pad[2]/U0/NET2 ), .PAD(Y[2]));
    IOPAD_IN \I_pad[7]/U0/U0  (.PAD(I[7]), .Y(\I_pad[7]/U0/NET1 ));
    IOPAD_IN \EI_pad/U0/U0  (.PAD(EI), .Y(\EI_pad/U0/NET1 ));
    IOTRI_OB_EB \Y_pad[1]/U0/U1  (.D(\Y_c[1] ), .E(VCC), .DOUT(
        \Y_pad[1]/U0/NET1 ), .EOUT(\Y_pad[1]/U0/NET2 ));
    IOPAD_IN \I_pad[6]/U0/U0  (.PAD(I[6]), .Y(\I_pad[6]/U0/NET1 ));
    IOTRI_OB_EB \Y_pad[6]/U0/U1  (.D(\Y_c[6] ), .E(VCC), .DOUT(
        \Y_pad[6]/U0/NET1 ), .EOUT(\Y_pad[6]/U0/NET2 ));
    OR2B \lzy_74HC148_0/A_i_0_o2[1]  (.A(\I_c[2] ), .B(\I_c[3] ), .Y(
        \lzy_74HC148_0/N_8 ));
    NOR2A \lzy_74HC148_0/GS_0_a3_0  (.A(\A_net_0[2] ), .B(
        \lzy_74HC148_0/N_8 ), .Y(\lzy_74HC148_0/GS_0_a3_0_net_1 ));
    OA1C \lzy_74HC4511_0/S_0[2]  (.A(\lzy_74HC148_0.N_17 ), .B(
        \lzy_74HC4511_0.A_i_1[1] ), .C(GS_OUT_PRE_INV0_0), .Y(\Y_c[2] )
        );
    IOIN_IB \I_pad[5]/U0/U1  (.YIN(\I_pad[5]/U0/NET1 ), .Y(\I_c[5] ));
    IOTRI_OB_EB \Y_pad[3]/U0/U1  (.D(\Y_c[3] ), .E(VCC), .DOUT(
        \Y_pad[3]/U0/NET1 ), .EOUT(\Y_pad[3]/U0/NET2 ));
    OA1C \lzy_74HC4511_0/S_1_0_a3_RNI08VO4[5]  (.A(\I_c[7] ), .B(
        \lzy_74HC4511_0/N_34 ), .C(GS_OUT_PRE_INV0_0), .Y(\Y_c[5] ));
    NOR2 \lzy_74HC4511_0/S_1_0_a3[6]  (.A(\lzy_74HC148_0.N_20 ), .B(
        \lzy_74HC148_0.N_9 ), .Y(\lzy_74HC4511_0/N_35 ));
    OA1C \lzy_74HC4511_0/S_1_0_0_RNIMLEV5[1]  (.A(\A_net_0[2] ), .B(
        \lzy_74HC4511_0/S_1_0_0[1]_net_1 ), .C(GS_OUT_PRE_INV0_0), .Y(
        \Y_c[1] ));
    IOPAD_IN \I_pad[3]/U0/U0  (.PAD(I[3]), .Y(\I_pad[3]/U0/NET1 ));
    IOPAD_TRI \Y_pad[0]/U0/U0  (.D(\Y_pad[0]/U0/NET1 ), .E(
        \Y_pad[0]/U0/NET2 ), .PAD(Y[0]));
    OR3A \lzy_74HC148_0/A_i_0[0]  (.A(\I_c[7] ), .B(
        \lzy_74HC148_0/N_15 ), .C(\lzy_74HC148_0.N_17 ), .Y(
        \lzy_74HC4511_0.A_i_1[0] ));
    IOPAD_TRI \Y_pad[5]/U0/U0  (.D(\Y_pad[5]/U0/NET1 ), .E(
        \Y_pad[5]/U0/NET2 ), .PAD(Y[5]));
    NOR2B \lzy_74HC148_0/A_i_0_a2[1]  (.A(\I_c[5] ), .B(\I_c[4] ), .Y(
        \lzy_74HC148_0.N_20 ));
    IOPAD_IN \I_pad[1]/U0/U0  (.PAD(I[1]), .Y(\I_pad[1]/U0/NET1 ));
    IOPAD_TRI \Y_pad[4]/U0/U0  (.D(\Y_pad[4]/U0/NET1 ), .E(
        \Y_pad[4]/U0/NET2 ), .PAD(Y[4]));
    NOR3A \lzy_74HC4511_0/S_1_i_a3_RNIMEJ38[4]  (.A(
        \lzy_74HC4511_0.A_i_1[0] ), .B(\lzy_74HC4511_0/N_33 ), .C(
        GS_OUT_PRE_INV0_0), .Y(\Y_c[4] ));
    IOIN_IB \I_pad[2]/U0/U1  (.YIN(\I_pad[2]/U0/NET1 ), .Y(\I_c[2] ));
    IOPAD_TRI \Y_pad[1]/U0/U0  (.D(\Y_pad[1]/U0/NET1 ), .E(
        \Y_pad[1]/U0/NET2 ), .PAD(Y[1]));
    IOIN_IB \I_pad[4]/U0/U1  (.YIN(\I_pad[4]/U0/NET1 ), .Y(\I_c[4] ));
    IOPAD_TRI \Y_pad[6]/U0/U0  (.D(\Y_pad[6]/U0/NET1 ), .E(
        \Y_pad[6]/U0/NET2 ), .PAD(Y[6]));
    NOR2B \lzy_74HC148_0/GS_0_a3_1  (.A(\I_c[0] ), .B(\I_c[1] ), .Y(
        \lzy_74HC148_0/GS_0_a3_1_net_1 ));
    AO1 \lzy_74HC148_0/GS_0  (.A(\lzy_74HC148_0/GS_0_a3_1_net_1 ), .B(
        \lzy_74HC148_0/GS_0_a3_0_net_1 ), .C(EI_c), .Y(
        GS_OUT_PRE_INV0_0));
    OA1 \lzy_74HC4511_0/S_1_0_a3[5]  (.A(\lzy_74HC148_0.N_14 ), .B(
        \lzy_74HC4511_0.A_i_1[0] ), .C(\A_net_0[2] ), .Y(
        \lzy_74HC4511_0/N_34 ));
    NOR2A \lzy_74HC148_0/A_i_a2_i_a2[2]  (.A(\lzy_74HC148_0.N_20 ), .B(
        \lzy_74HC148_0.N_9 ), .Y(\A_net_0[2] ));
    IOPAD_IN \I_pad[5]/U0/U0  (.PAD(I[5]), .Y(\I_pad[5]/U0/NET1 ));
    IOPAD_TRI \Y_pad[3]/U0/U0  (.D(\Y_pad[3]/U0/NET1 ), .E(
        \Y_pad[3]/U0/NET2 ), .PAD(Y[3]));
    OR2 \lzy_74HC148_0/A_i_0[1]  (.A(\lzy_74HC148_0.N_14 ), .B(
        \lzy_74HC148_0.N_9 ), .Y(\lzy_74HC4511_0.A_i_1[1] ));
    IOIN_IB \I_pad[0]/U0/U1  (.YIN(\I_pad[0]/U0/NET1 ), .Y(\I_c[0] ));
    IOTRI_OB_EB \Y_pad[7]/U0/U1  (.D(GND), .E(VCC), .DOUT(
        \Y_pad[7]/U0/NET1 ), .EOUT(\Y_pad[7]/U0/NET2 ));
    NOR3 \lzy_74HC4511_0/S_1_i_a3_RNIDDFG4[3]  (.A(
        \lzy_74HC4511_0/N_29 ), .B(\lzy_74HC4511_0/N_32 ), .C(
        GS_OUT_PRE_INV0_0), .Y(\Y_c[3] ));
    IOIN_IB \EI_pad/U0/U1  (.YIN(\EI_pad/U0/NET1 ), .Y(EI_c));
    IOTRI_OB_EB \Y_pad[2]/U0/U1  (.D(\Y_c[2] ), .E(VCC), .DOUT(
        \Y_pad[2]/U0/NET1 ), .EOUT(\Y_pad[2]/U0/NET2 ));
    IOIN_IB \I_pad[7]/U0/U1  (.YIN(\I_pad[7]/U0/NET1 ), .Y(\I_c[7] ));
    IOIN_IB \I_pad[6]/U0/U1  (.YIN(\I_pad[6]/U0/NET1 ), .Y(\I_c[6] ));
    OA1B \lzy_74HC4511_0/S_1_0_a3_RNI36CI4[6]  (.A(
        \lzy_74HC4511_0/N_34 ), .B(\lzy_74HC4511_0/N_35 ), .C(
        GS_OUT_PRE_INV0_0), .Y(\Y_c[6] ));
    OAI1 \lzy_74HC4511_0/S_1_0_0[1]  (.A(\lzy_74HC148_0.N_14 ), .B(
        \lzy_74HC4511_0.A_i_1[0] ), .C(\I_c[3] ), .Y(
        \lzy_74HC4511_0/S_1_0_0[1]_net_1 ));
    NOR2 \lzy_74HC4511_0/S_1_i_a3_RNI8UK84[0]  (.A(
        \lzy_74HC4511_0/N_29 ), .B(GS_OUT_PRE_INV0_0), .Y(\Y_c[0] ));
    XA1 \lzy_74HC4511_0/S_1_i_a3[0]  (.A(\lzy_74HC148_0.N_9 ), .B(
        \lzy_74HC4511_0.A_i_1[0] ), .C(\lzy_74HC4511_0.A_i_1[1] ), .Y(
        \lzy_74HC4511_0/N_29 ));
    NOR2B \lzy_74HC4511_0/S_1_i_a3[4]  (.A(\lzy_74HC148_0.N_14 ), .B(
        \A_net_0[2] ), .Y(\lzy_74HC4511_0/N_33 ));
    AO1C \lzy_74HC148_0/A_i_0_o2[0]  (.A(\I_c[1] ), .B(\I_c[2] ), .C(
        \I_c[3] ), .Y(\lzy_74HC148_0/N_10 ));
    NOR2B \lzy_74HC148_0/A_i_0_a3_0[1]  (.A(\lzy_74HC148_0.N_20 ), .B(
        \lzy_74HC148_0/N_8 ), .Y(\lzy_74HC148_0.N_14 ));
    IOPAD_IN \I_pad[2]/U0/U0  (.PAD(I[2]), .Y(\I_pad[2]/U0/NET1 ));
    IOPAD_IN \I_pad[4]/U0/U0  (.PAD(I[4]), .Y(\I_pad[4]/U0/NET1 ));
    NOR2A \lzy_74HC148_0/A_i_0_a3_1[0]  (.A(\I_c[6] ), .B(\I_c[5] ), 
        .Y(\lzy_74HC148_0.N_17 ));
    NOR3A \lzy_74HC4511_0/S_1_i_a3[3]  (.A(\A_net_0[2] ), .B(
        \lzy_74HC148_0.N_14 ), .C(\lzy_74HC4511_0.A_i_1[0] ), .Y(
        \lzy_74HC4511_0/N_32 ));
    OR2B \lzy_74HC148_0/A_i_0_o2_0[1]  (.A(\I_c[7] ), .B(\I_c[6] ), .Y(
        \lzy_74HC148_0.N_9 ));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
