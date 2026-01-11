`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4
// File used only for Simulation


module lly_SD1(
       EI,
       I1,
       I2,
       Y
    );
input  EI;
input  [7:0] I1;
input  [7:0] I2;
output [7:0] Y;

    wire AND2_1_Y, AND2_2_Y, AND2_3_Y, \A_i_0[0] , \A_i_0[1] , 
        \A_i_a2_0[2] , \lly_74HC148_0.A62 , \A_i[0] , \A_i[1] , 
        \A_i_a2[2] , EI_c, \I1_c[0] , \I1_c[1] , \I1_c[2] , \I1_c[3] , 
        \I1_c[4] , \I1_c[5] , \I1_c[6] , \I1_c[7] , \I2_c[1] , 
        \I2_c[2] , \I2_c[3] , \I2_c[4] , \I2_c[5] , \I2_c[6] , 
        \I2_c[7] , \Y_c[0] , \Y_c[1] , \Y_c[2] , \Y_c[3] , \Y_c[4] , 
        \Y_c[5] , \Y_c[6] , GND, GS_OUT_PRE_INV0_0, 
        \lly_74HC4511_0/S_0_0[1]_net_1 , 
        \lly_74HC4511_0/S_1_i_a4_0[4]_net_1 , \lly_74HC4511_0/N_36 , 
        \lly_74HC4511_0/N_53 , \lly_74HC4511_0/N_40 , 
        \lly_74HC4511_0/N_39 , \lly_74HC4511_0/N_35 , 
        \lly_74HC4511_0/N_46 , \lly_74HC148_0/A_i_a2_0[1] , 
        \lly_74HC148_0/un1_I_3_net_1 , \lly_74HC148_0/un1_I_2_net_1 , 
        \lly_74HC148_0/un1_I_1_net_1 , \lly_74HC148_0/un1_I_0_net_1 , 
        \lly_74HC148_0/un1_I_4_net_1 , 
        \lly_74HC148_0/A_i_a2_1[0]_net_1 , \lly_74HC148_0/N_51 , 
        \lly_74HC148_0/N_49 , \lly_74HC148_0/N_52 , 
        \lly_74HC148_0/N_53 , \lly_74HC148_1/A_i_a2_1[0] , 
        \lly_74HC148_1/N_57 , \lly_74HC148_1/A_i_a2_0[0] , 
        \lly_74HC148_1/A_i_0[0]_net_1 , 
        \lly_74HC148_1/A_i_a2_1_0[0]_net_1 , 
        \lly_74HC148_1/A_i_a2_0[1] , \lly_74HC148_1/N_48 , 
        \lly_74HC148_1/N_46 , \Y_pad[0]/U0/NET1 , \Y_pad[0]/U0/NET2 , 
        \I2_pad[5]/U0/NET1 , \I1_pad[7]/U0/NET1 , \I1_pad[5]/U0/NET1 , 
        \Y_pad[4]/U0/NET1 , \Y_pad[4]/U0/NET2 , \I2_pad[3]/U0/NET1 , 
        \I2_pad[1]/U0/NET1 , \I2_pad[2]/U0/NET1 , \I2_pad[7]/U0/NET1 , 
        \I1_pad[2]/U0/NET1 , \I1_pad[0]/U0/NET1 , \I1_pad[4]/U0/NET1 , 
        \I1_pad[1]/U0/NET1 , \Y_pad[5]/U0/NET1 , \Y_pad[5]/U0/NET2 , 
        \Y_pad[2]/U0/NET1 , \Y_pad[2]/U0/NET2 , \EI_pad/U0/NET1 , 
        \Y_pad[3]/U0/NET1 , \Y_pad[3]/U0/NET2 , \I2_pad[6]/U0/NET1 , 
        \I1_pad[3]/U0/NET1 , \I1_pad[6]/U0/NET1 , \Y_pad[1]/U0/NET1 , 
        \Y_pad[1]/U0/NET2 , \Y_pad[7]/U0/NET1 , \Y_pad[7]/U0/NET2 , 
        \Y_pad[6]/U0/NET1 , \Y_pad[6]/U0/NET2 , VCC, 
        \I2_pad[4]/U0/NET1 , AFLSDF_VCC, AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    NOR2A \lly_74HC148_1/A_i_a3[0]  (.A(\I2_c[2] ), .B(\I2_c[1] ), .Y(
        \lly_74HC148_1/N_57 ));
    IOTRI_OB_EB \Y_pad[0]/U0/U1  (.D(\Y_c[0] ), .E(VCC), .DOUT(
        \Y_pad[0]/U0/NET1 ), .EOUT(\Y_pad[0]/U0/NET2 ));
    IOPAD_TRI \Y_pad[7]/U0/U0  (.D(\Y_pad[7]/U0/NET1 ), .E(
        \Y_pad[7]/U0/NET2 ), .PAD(Y[7]));
    IOTRI_OB_EB \Y_pad[5]/U0/U1  (.D(\Y_c[5] ), .E(VCC), .DOUT(
        \Y_pad[5]/U0/NET1 ), .EOUT(\Y_pad[5]/U0/NET2 ));
    IOTRI_OB_EB \Y_pad[4]/U0/U1  (.D(\Y_c[4] ), .E(VCC), .DOUT(
        \Y_pad[4]/U0/NET1 ), .EOUT(\Y_pad[4]/U0/NET2 ));
    IOPAD_TRI \Y_pad[2]/U0/U0  (.D(\Y_pad[2]/U0/NET1 ), .E(
        \Y_pad[2]/U0/NET2 ), .PAD(Y[2]));
    IOPAD_IN \EI_pad/U0/U0  (.PAD(EI), .Y(\EI_pad/U0/NET1 ));
    IOTRI_OB_EB \Y_pad[1]/U0/U1  (.D(\Y_c[1] ), .E(VCC), .DOUT(
        \Y_pad[1]/U0/NET1 ), .EOUT(\Y_pad[1]/U0/NET2 ));
    MX2C \lly_74HC4511_0/S_0_0[1]  (.A(AND2_3_Y), .B(AND2_2_Y), .S(
        AND2_1_Y), .Y(\lly_74HC4511_0/S_0_0[1]_net_1 ));
    IOTRI_OB_EB \Y_pad[6]/U0/U1  (.D(\Y_c[6] ), .E(VCC), .DOUT(
        \Y_pad[6]/U0/NET1 ), .EOUT(\Y_pad[6]/U0/NET2 ));
    IOPAD_IN \I2_pad[2]/U0/U0  (.PAD(I2[2]), .Y(\I2_pad[2]/U0/NET1 ));
    NOR3C \lly_74HC4511_0/S_1_i_a2[3]  (.A(AND2_1_Y), .B(AND2_3_Y), .C(
        AND2_2_Y), .Y(\lly_74HC4511_0/N_53 ));
    AOI1 \lly_74HC148_1/A_i_a2_0_0[1]  (.A(\I2_c[2] ), .B(\I2_c[3] ), 
        .C(\lly_74HC148_1/N_48 ), .Y(\lly_74HC148_1/A_i_a2_0[1] ));
    IOPAD_IN \I1_pad[0]/U0/U0  (.PAD(I1[0]), .Y(\I1_pad[0]/U0/NET1 ));
    IOPAD_IN \I2_pad[3]/U0/U0  (.PAD(I2[3]), .Y(\I2_pad[3]/U0/NET1 ));
    OA1A \lly_74HC148_1/A_i_a2_1_1[0]  (.A(\I2_c[3] ), .B(
        \lly_74HC148_1/N_57 ), .C(\I2_c[6] ), .Y(
        \lly_74HC148_1/A_i_a2_1[0] ));
    AO1A \lly_74HC148_0/A_i[1]  (.A(\lly_74HC148_0/A_i_a2_0[1] ), .B(
        \lly_74HC148_0/un1_I_4_net_1 ), .C(EI_c), .Y(\A_i[1] ));
    IOPAD_IN \I1_pad[2]/U0/U0  (.PAD(I1[2]), .Y(\I1_pad[2]/U0/NET1 ));
    OA1C \lly_74HC4511_0/S_1_0_a4_RNI30P74[2]  (.A(AND2_3_Y), .B(
        \lly_74HC4511_0/N_39 ), .C(GS_OUT_PRE_INV0_0), .Y(\Y_c[2] ));
    IOPAD_IN \I2_pad[4]/U0/U0  (.PAD(I2[4]), .Y(\I2_pad[4]/U0/NET1 ));
    IOTRI_OB_EB \Y_pad[3]/U0/U1  (.D(\Y_c[3] ), .E(VCC), .DOUT(
        \Y_pad[3]/U0/NET1 ), .EOUT(\Y_pad[3]/U0/NET2 ));
    IOPAD_IN \I1_pad[4]/U0/U0  (.PAD(I1[4]), .Y(\I1_pad[4]/U0/NET1 ));
    IOPAD_IN \I1_pad[3]/U0/U0  (.PAD(I1[3]), .Y(\I1_pad[3]/U0/NET1 ));
    NOR3C \lly_74HC148_0/un1_I_0  (.A(\lly_74HC148_0/un1_I_4_net_1 ), 
        .B(\lly_74HC148_0/un1_I_3_net_1 ), .C(
        \lly_74HC148_0/un1_I_2_net_1 ), .Y(
        \lly_74HC148_0/un1_I_0_net_1 ));
    NOR2A \lly_74HC148_0/A_i_a2_1_0[0]  (.A(\I1_c[4] ), .B(EI_c), .Y(
        \lly_74HC148_0/A_i_a2_1[0]_net_1 ));
    AO1 \lly_74HC148_0/A_i_a2[2]  (.A(\lly_74HC148_0/un1_I_3_net_1 ), 
        .B(\lly_74HC148_0/un1_I_4_net_1 ), .C(EI_c), .Y(\A_i_a2[2] ));
    NOR3A \lly_74HC4511_0/S_1_i_a4_1[6]  (.A(AND2_3_Y), .B(AND2_2_Y), 
        .C(AND2_1_Y), .Y(\lly_74HC4511_0/N_46 ));
    OR2B \lly_74HC148_1/A_i_o3[1]  (.A(\I2_c[4] ), .B(\I2_c[5] ), .Y(
        \lly_74HC148_1/N_48 ));
    AND2 AND2_2 (.A(\A_i[1] ), .B(\A_i_0[1] ), .Y(AND2_2_Y));
    IOIN_IB \I2_pad[2]/U0/U1  (.YIN(\I2_pad[2]/U0/NET1 ), .Y(\I2_c[2] )
        );
    IOPAD_IN \I2_pad[5]/U0/U0  (.PAD(I2[5]), .Y(\I2_pad[5]/U0/NET1 ));
    IOIN_IB \I1_pad[0]/U0/U1  (.YIN(\I1_pad[0]/U0/NET1 ), .Y(\I1_c[0] )
        );
    NOR2A \lly_74HC4511_0/S_0[1]  (.A(\lly_74HC4511_0/S_0_0[1]_net_1 ), 
        .B(GS_OUT_PRE_INV0_0), .Y(\Y_c[1] ));
    IOIN_IB \I2_pad[3]/U0/U1  (.YIN(\I2_pad[3]/U0/NET1 ), .Y(\I2_c[3] )
        );
    AND2 AND2_1 (.A(\A_i[0] ), .B(\A_i_0[0] ), .Y(AND2_1_Y));
    NOR3B \lly_74HC4511_0/S_1_i_a4_0[0]  (.A(AND2_1_Y), .B(AND2_3_Y), 
        .C(AND2_2_Y), .Y(\lly_74HC4511_0/N_35 ));
    NOR3A \lly_74HC4511_0/S_1_i_a4[3]  (.A(AND2_2_Y), .B(AND2_1_Y), .C(
        AND2_3_Y), .Y(\lly_74HC4511_0/N_40 ));
    AND2 AND2_3 (.A(\A_i_a2[2] ), .B(\A_i_a2_0[2] ), .Y(AND2_3_Y));
    IOIN_IB \I1_pad[2]/U0/U1  (.YIN(\I1_pad[2]/U0/NET1 ), .Y(\I1_c[2] )
        );
    NOR2B \lly_74HC148_0/un1_I_1  (.A(\I1_c[0] ), .B(\I1_c[1] ), .Y(
        \lly_74HC148_0/un1_I_1_net_1 ));
    IOPAD_TRI \Y_pad[0]/U0/U0  (.D(\Y_pad[0]/U0/NET1 ), .E(
        \Y_pad[0]/U0/NET2 ), .PAD(Y[0]));
    IOIN_IB \I2_pad[4]/U0/U1  (.YIN(\I2_pad[4]/U0/NET1 ), .Y(\I2_c[4] )
        );
    IOPAD_TRI \Y_pad[5]/U0/U0  (.D(\Y_pad[5]/U0/NET1 ), .E(
        \Y_pad[5]/U0/NET2 ), .PAD(Y[5]));
    IOPAD_TRI \Y_pad[4]/U0/U0  (.D(\Y_pad[4]/U0/NET1 ), .E(
        \Y_pad[4]/U0/NET2 ), .PAD(Y[4]));
    OR2B \lly_74HC148_1/A_i_o2[1]  (.A(\I2_c[6] ), .B(\I2_c[7] ), .Y(
        \lly_74HC148_1/N_46 ));
    IOIN_IB \I1_pad[4]/U0/U1  (.YIN(\I1_pad[4]/U0/NET1 ), .Y(\I1_c[4] )
        );
    IOIN_IB \I1_pad[3]/U0/U1  (.YIN(\I1_pad[3]/U0/NET1 ), .Y(\I1_c[3] )
        );
    IOPAD_TRI \Y_pad[1]/U0/U0  (.D(\Y_pad[1]/U0/NET1 ), .E(
        \Y_pad[1]/U0/NET2 ), .PAD(Y[1]));
    NOR3 \lly_74HC148_0/A_i[0]  (.A(\lly_74HC148_0/N_52 ), .B(
        \lly_74HC148_0/N_53 ), .C(\lly_74HC148_0/N_51 ), .Y(\A_i[0] ));
    IOPAD_TRI \Y_pad[6]/U0/U0  (.D(\Y_pad[6]/U0/NET1 ), .E(
        \Y_pad[6]/U0/NET2 ), .PAD(Y[6]));
    NOR2A \lly_74HC148_0/A_i_a2_0_0[1]  (.A(
        \lly_74HC148_0/un1_I_3_net_1 ), .B(
        \lly_74HC148_0/un1_I_2_net_1 ), .Y(\lly_74HC148_0/A_i_a2_0[1] )
        );
    NOR3C \lly_74HC148_0/A_i_a2[0]  (.A(\I1_c[6] ), .B(
        \lly_74HC148_0/N_49 ), .C(\lly_74HC148_0/A_i_a2_1[0]_net_1 ), 
        .Y(\lly_74HC148_0/N_51 ));
    IOPAD_IN \I1_pad[1]/U0/U0  (.PAD(I1[1]), .Y(\I1_pad[1]/U0/NET1 ));
    OA1C \lly_74HC4511_0/S_1_i_a4_0_RNIC45C4[4]  (.A(
        \lly_74HC4511_0/S_1_i_a4_0[4]_net_1 ), .B(AND2_2_Y), .C(
        GS_OUT_PRE_INV0_0), .Y(\Y_c[4] ));
    IOIN_IB \I2_pad[5]/U0/U1  (.YIN(\I2_pad[5]/U0/NET1 ), .Y(\I2_c[5] )
        );
    IOPAD_IN \I2_pad[1]/U0/U0  (.PAD(I2[1]), .Y(\I2_pad[1]/U0/NET1 ));
    NOR2B \lly_74HC148_0/un1_I_2  (.A(\I1_c[2] ), .B(\I1_c[3] ), .Y(
        \lly_74HC148_0/un1_I_2_net_1 ));
    IOPAD_IN \I1_pad[5]/U0/U0  (.PAD(I1[5]), .Y(\I1_pad[5]/U0/NET1 ));
    IOPAD_IN \I2_pad[6]/U0/U0  (.PAD(I2[6]), .Y(\I2_pad[6]/U0/NET1 ));
    NOR2 \lly_74HC4511_0/S_1_i_a4_1_RNIPGBB4[6]  (.A(
        \lly_74HC4511_0/N_46 ), .B(GS_OUT_PRE_INV0_0), .Y(\Y_c[6] ));
    NOR2 \lly_74HC4511_0/S_1_i_a4_0_RNII78A4[0]  (.A(
        \lly_74HC4511_0/N_35 ), .B(GS_OUT_PRE_INV0_0), .Y(\Y_c[5] ));
    NOR3B \lly_74HC148_0/A62  (.A(\lly_74HC148_0/un1_I_0_net_1 ), .B(
        \lly_74HC148_0/un1_I_1_net_1 ), .C(EI_c), .Y(
        \lly_74HC148_0.A62 ));
    NOR3 \lly_74HC4511_0/S_1_i_a2_RNISRI25[3]  (.A(
        \lly_74HC4511_0/N_53 ), .B(GS_OUT_PRE_INV0_0), .C(
        \lly_74HC4511_0/N_40 ), .Y(\Y_c[3] ));
    IOPAD_TRI \Y_pad[3]/U0/U0  (.D(\Y_pad[3]/U0/NET1 ), .E(
        \Y_pad[3]/U0/NET2 ), .PAD(Y[3]));
    NOR2A \lly_74HC4511_0/S_1_0_a4[2]  (.A(AND2_1_Y), .B(AND2_2_Y), .Y(
        \lly_74HC4511_0/N_39 ));
    OA1A \lly_74HC148_1/A_i_0[0]  (.A(\I2_c[7] ), .B(
        \lly_74HC148_1/A_i_a2_1_0[0]_net_1 ), .C(\lly_74HC148_0.A62 ), 
        .Y(\lly_74HC148_1/A_i_0[0]_net_1 ));
    NOR2B \lly_74HC148_0/un1_I_3  (.A(\I1_c[5] ), .B(\I1_c[4] ), .Y(
        \lly_74HC148_0/un1_I_3_net_1 ));
    AO1 \lly_74HC148_0/GS  (.A(\lly_74HC148_0/un1_I_1_net_1 ), .B(
        \lly_74HC148_0/un1_I_0_net_1 ), .C(EI_c), .Y(GS_OUT_PRE_INV0_0)
        );
    NOR2A \lly_74HC4511_0/S_1_i_a4_1_RNINJGG4[0]  (.A(\Y_c[5] ), .B(
        \lly_74HC4511_0/N_36 ), .Y(\Y_c[0] ));
    NOR2 \lly_74HC148_0/A_i_a2_0[0]  (.A(\I1_c[7] ), .B(EI_c), .Y(
        \lly_74HC148_0/N_52 ));
    IOTRI_OB_EB \Y_pad[7]/U0/U1  (.D(GND), .E(VCC), .DOUT(
        \Y_pad[7]/U0/NET1 ), .EOUT(\Y_pad[7]/U0/NET2 ));
    IOIN_IB \I1_pad[1]/U0/U1  (.YIN(\I1_pad[1]/U0/NET1 ), .Y(\I1_c[1] )
        );
    IOIN_IB \EI_pad/U0/U1  (.YIN(\EI_pad/U0/NET1 ), .Y(EI_c));
    IOTRI_OB_EB \Y_pad[2]/U0/U1  (.D(\Y_c[2] ), .E(VCC), .DOUT(
        \Y_pad[2]/U0/NET1 ), .EOUT(\Y_pad[2]/U0/NET2 ));
    IOPAD_IN \I1_pad[6]/U0/U0  (.PAD(I1[6]), .Y(\I1_pad[6]/U0/NET1 ));
    IOIN_IB \I2_pad[1]/U0/U1  (.YIN(\I2_pad[1]/U0/NET1 ), .Y(\I2_c[1] )
        );
    IOIN_IB \I1_pad[5]/U0/U1  (.YIN(\I1_pad[5]/U0/NET1 ), .Y(\I1_c[5] )
        );
    IOPAD_IN \I1_pad[7]/U0/U0  (.PAD(I1[7]), .Y(\I1_pad[7]/U0/NET1 ));
    NOR2A \lly_74HC4511_0/S_1_i_a4_0[4]  (.A(AND2_1_Y), .B(AND2_3_Y), 
        .Y(\lly_74HC4511_0/S_1_i_a4_0[4]_net_1 ));
    IOIN_IB \I2_pad[6]/U0/U1  (.YIN(\I2_pad[6]/U0/NET1 ), .Y(\I2_c[6] )
        );
    OAI1 \lly_74HC148_1/A_i_a2[2]  (.A(\lly_74HC148_1/N_46 ), .B(
        \lly_74HC148_1/N_48 ), .C(\lly_74HC148_0.A62 ), .Y(
        \A_i_a2_0[2] ));
    IOPAD_IN \I2_pad[7]/U0/U0  (.PAD(I2[7]), .Y(\I2_pad[7]/U0/NET1 ));
    AO1C \lly_74HC148_0/A_i_o2[0]  (.A(\I1_c[1] ), .B(\I1_c[2] ), .C(
        \I1_c[3] ), .Y(\lly_74HC148_0/N_49 ));
    NOR2B \lly_74HC148_0/un1_I_4  (.A(\I1_c[7] ), .B(\I1_c[6] ), .Y(
        \lly_74HC148_0/un1_I_4_net_1 ));
    IOIN_IB \I1_pad[6]/U0/U1  (.YIN(\I1_pad[6]/U0/NET1 ), .Y(\I1_c[6] )
        );
    NOR3B \lly_74HC4511_0/S_1_i_a4_1[0]  (.A(AND2_2_Y), .B(AND2_1_Y), 
        .C(AND2_3_Y), .Y(\lly_74HC4511_0/N_36 ));
    IOIN_IB \I1_pad[7]/U0/U1  (.YIN(\I1_pad[7]/U0/NET1 ), .Y(\I1_c[7] )
        );
    NOR2A \lly_74HC148_1/A_i_a2_1_0[0]  (.A(\I2_c[6] ), .B(\I2_c[5] ), 
        .Y(\lly_74HC148_1/A_i_a2_1_0[0]_net_1 ));
    OAI1 \lly_74HC148_1/A_i[1]  (.A(\lly_74HC148_1/N_46 ), .B(
        \lly_74HC148_1/A_i_a2_0[1] ), .C(\lly_74HC148_0.A62 ), .Y(
        \A_i_0[1] ));
    NOR3A \lly_74HC148_0/A_i_a2_1[0]  (.A(\I1_c[6] ), .B(EI_c), .C(
        \I1_c[5] ), .Y(\lly_74HC148_0/N_53 ));
    NOR2B \lly_74HC148_1/A_i_a2_0_0[0]  (.A(\I2_c[4] ), .B(
        \lly_74HC148_0.A62 ), .Y(\lly_74HC148_1/A_i_a2_0[0] ));
    AOI1 \lly_74HC148_1/A_i[0]  (.A(\lly_74HC148_1/A_i_a2_1[0] ), .B(
        \lly_74HC148_1/A_i_a2_0[0] ), .C(
        \lly_74HC148_1/A_i_0[0]_net_1 ), .Y(\A_i_0[0] ));
    IOIN_IB \I2_pad[7]/U0/U1  (.YIN(\I2_pad[7]/U0/NET1 ), .Y(\I2_c[7] )
        );
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
