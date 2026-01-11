`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4
// File used only for Simulation


module lzy_SD1(
       A,
       B,
       QE,
       QG,
       QS
    );
input  [3:0] A;
input  [3:0] B;
output QE;
output QG;
output QS;

    wire \Y_net_0[1] , \Y_net_0[2] , \Y_net_1[1] , \Y_net_1[2] , 
        \Y_net_0[3] , \Y_net_1[3] , \lzy_74HC85_0.un1_A_NE , \A_c[0] , 
        \A_c[1] , \A_c[2] , \A_c[3] , \B_c[0] , \B_c[1] , \B_c[2] , 
        \B_c[3] , QG_c, QS_c, \lzy_ori_c_0/Y_1[3] , 
        \lzy_ori_c_0/Y_1[2] , \lzy_ori_c_0/Y_1[1] , 
        \lzy_ori_c_1/Y_1[3] , \lzy_ori_c_1/Y_1[2] , 
        \lzy_ori_c_1/Y_1[1] , \lzy_74HC85_0/un1_A_NE_0_net_1 , 
        \lzy_74HC85_0/un1_A_0_net_1 , \lzy_74HC85_0/un1_A_2_net_1 , 
        \lzy_74HC85_0/un1_A_3_net_1 , \lzy_74HC85_0/ACT_LT4_E[3] , 
        \lzy_74HC85_0/ACT_LT4_E[6] , \lzy_74HC85_0/ACT_LT4_E[10] , 
        \lzy_74HC85_0/ACT_LT4_E[7] , \lzy_74HC85_0/ACT_LT4_E[8] , 
        \lzy_74HC85_0/ACT_LT4_E[5] , \lzy_74HC85_0/ACT_LT4_E[0] , 
        \lzy_74HC85_0/ACT_LT4_E[1] , \lzy_74HC85_0/ACT_LT4_E[2] , 
        \lzy_74HC85_0/ACT_LT4_E_0[3] , \lzy_74HC85_0/ACT_LT4_E_0[6] , 
        \lzy_74HC85_0/ACT_LT4_E_0[10] , \lzy_74HC85_0/ACT_LT4_E_0[7] , 
        \lzy_74HC85_0/ACT_LT4_E_0[8] , \lzy_74HC85_0/ACT_LT4_E_0[5] , 
        \lzy_74HC85_0/ACT_LT4_E_0[0] , \lzy_74HC85_0/ACT_LT4_E_0[1] , 
        \lzy_74HC85_0/ACT_LT4_E_0[2] , \B_pad[3]/U0/NET1 , 
        \QS_pad/U0/NET1 , \QS_pad/U0/NET2 , \B_pad[2]/U0/NET1 , 
        \A_pad[3]/U0/NET1 , \QG_pad/U0/NET1 , \QG_pad/U0/NET2 , 
        \B_pad[1]/U0/NET1 , \A_pad[0]/U0/NET1 , \B_pad[0]/U0/NET1 , 
        \A_pad[2]/U0/NET1 , \QE_pad/U0/NET1 , \QE_pad/U0/NET2 , VCC, 
        \A_pad[1]/U0/NET1 , GND, AFLSDF_VCC, AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    AOI1A \lzy_74HC85_0/QS55_0_I_4  (.A(\lzy_74HC85_0/ACT_LT4_E_0[0] ), 
        .B(\lzy_74HC85_0/ACT_LT4_E_0[1] ), .C(
        \lzy_74HC85_0/ACT_LT4_E_0[2] ), .Y(
        \lzy_74HC85_0/ACT_LT4_E_0[3] ));
    IOTRI_OB_EB \QE_pad/U0/U1  (.D(\lzy_74HC85_0.un1_A_NE ), .E(VCC), 
        .DOUT(\QE_pad/U0/NET1 ), .EOUT(\QE_pad/U0/NET2 ));
    IOPAD_IN \A_pad[2]/U0/U0  (.PAD(A[2]), .Y(\A_pad[2]/U0/NET1 ));
    IOPAD_IN \A_pad[1]/U0/U0  (.PAD(A[1]), .Y(\A_pad[1]/U0/NET1 ));
    IOIN_IB \A_pad[3]/U0/U1  (.YIN(\A_pad[3]/U0/NET1 ), .Y(\A_c[3] ));
    AOI1A \lzy_74HC85_0/QS55_0_I_7  (.A(\Y_net_1[2] ), .B(\Y_net_0[2] )
        , .C(\lzy_74HC85_0/ACT_LT4_E_0[5] ), .Y(
        \lzy_74HC85_0/ACT_LT4_E_0[6] ));
    IOIN_IB \B_pad[1]/U0/U1  (.YIN(\B_pad[1]/U0/NET1 ), .Y(\B_c[1] ));
    AX1D \lzy_ori_c_1/Y_1_I_7  (.A(\B_c[1] ), .B(\B_c[0] ), .C(
        \B_c[2] ), .Y(\lzy_ori_c_1/Y_1[2] ));
    OR2B \lzy_ori_c_0/Y_2[3]  (.A(\A_c[3] ), .B(\lzy_ori_c_0/Y_1[3] ), 
        .Y(\Y_net_0[3] ));
    IOIN_IB \B_pad[3]/U0/U1  (.YIN(\B_pad[3]/U0/NET1 ), .Y(\B_c[3] ));
    AOI1A \lzy_74HC85_0/QS56_0_I_7  (.A(\Y_net_0[2] ), .B(\Y_net_1[2] )
        , .C(\lzy_74HC85_0/ACT_LT4_E[5] ), .Y(
        \lzy_74HC85_0/ACT_LT4_E[6] ));
    AND2A \lzy_74HC85_0/QS55_0_I_3  (.A(\Y_net_0[1] ), .B(\Y_net_1[1] )
        , .Y(\lzy_74HC85_0/ACT_LT4_E_0[2] ));
    NOR2A \lzy_74HC85_0/QS56_0_I_1  (.A(\B_c[0] ), .B(\A_c[0] ), .Y(
        \lzy_74HC85_0/ACT_LT4_E[0] ));
    IOIN_IB \A_pad[0]/U0/U1  (.YIN(\A_pad[0]/U0/NET1 ), .Y(\A_c[0] ));
    IOPAD_TRI \QE_pad/U0/U0  (.D(\QE_pad/U0/NET1 ), .E(
        \QE_pad/U0/NET2 ), .PAD(QE));
    MX2 \lzy_ori_c_0/Y_2[2]  (.A(\A_c[2] ), .B(\lzy_ori_c_0/Y_1[2] ), 
        .S(\A_c[3] ), .Y(\Y_net_0[2] ));
    XO1 \lzy_74HC85_0/un1_A_NE_0  (.A(\Y_net_1[1] ), .B(\Y_net_0[1] ), 
        .C(\lzy_74HC85_0/un1_A_0_net_1 ), .Y(
        \lzy_74HC85_0/un1_A_NE_0_net_1 ));
    OR2A \lzy_74HC85_0/QS56_0_I_9  (.A(\Y_net_0[3] ), .B(\Y_net_1[3] ), 
        .Y(\lzy_74HC85_0/ACT_LT4_E[8] ));
    IOTRI_OB_EB \QS_pad/U0/U1  (.D(QS_c), .E(VCC), .DOUT(
        \QS_pad/U0/NET1 ), .EOUT(\QS_pad/U0/NET2 ));
    IOPAD_TRI \QS_pad/U0/U0  (.D(\QS_pad/U0/NET1 ), .E(
        \QS_pad/U0/NET2 ), .PAD(QS));
    IOPAD_IN \B_pad[0]/U0/U0  (.PAD(B[0]), .Y(\B_pad[0]/U0/NET1 ));
    AOI1A \lzy_74HC85_0/QS56_0_I_10  (.A(\lzy_74HC85_0/ACT_LT4_E[7] ), 
        .B(\lzy_74HC85_0/ACT_LT4_E[8] ), .C(
        \lzy_74HC85_0/ACT_LT4_E[5] ), .Y(\lzy_74HC85_0/ACT_LT4_E[10] ));
    XOR2 \lzy_74HC85_0/un1_A_0  (.A(\A_c[0] ), .B(\B_c[0] ), .Y(
        \lzy_74HC85_0/un1_A_0_net_1 ));
    MX2 \lzy_ori_c_1/Y_2[2]  (.A(\B_c[2] ), .B(\lzy_ori_c_1/Y_1[2] ), 
        .S(\B_c[3] ), .Y(\Y_net_1[2] ));
    AOI1A \lzy_74HC85_0/QS56_0_I_4  (.A(\lzy_74HC85_0/ACT_LT4_E[0] ), 
        .B(\lzy_74HC85_0/ACT_LT4_E[1] ), .C(
        \lzy_74HC85_0/ACT_LT4_E[2] ), .Y(\lzy_74HC85_0/ACT_LT4_E[3] ));
    NOR3 \lzy_74HC85_0/un1_A_NE  (.A(\lzy_74HC85_0/un1_A_2_net_1 ), .B(
        \lzy_74HC85_0/un1_A_3_net_1 ), .C(
        \lzy_74HC85_0/un1_A_NE_0_net_1 ), .Y(\lzy_74HC85_0.un1_A_NE ));
    IOTRI_OB_EB \QG_pad/U0/U1  (.D(QG_c), .E(VCC), .DOUT(
        \QG_pad/U0/NET1 ), .EOUT(\QG_pad/U0/NET2 ));
    IOPAD_IN \A_pad[3]/U0/U0  (.PAD(A[3]), .Y(\A_pad[3]/U0/NET1 ));
    NOR2A \lzy_74HC85_0/QS55_0_I_6  (.A(\Y_net_0[3] ), .B(\Y_net_1[3] )
        , .Y(\lzy_74HC85_0/ACT_LT4_E_0[5] ));
    IOIN_IB \B_pad[2]/U0/U1  (.YIN(\B_pad[2]/U0/NET1 ), .Y(\B_c[2] ));
    IOPAD_IN \B_pad[1]/U0/U0  (.PAD(B[1]), .Y(\B_pad[1]/U0/NET1 ));
    AX1D \lzy_ori_c_0/Y_1_I_7  (.A(\A_c[0] ), .B(\A_c[1] ), .C(
        \A_c[2] ), .Y(\lzy_ori_c_0/Y_1[2] ));
    IOPAD_IN \B_pad[3]/U0/U0  (.PAD(B[3]), .Y(\B_pad[3]/U0/NET1 ));
    IOPAD_TRI \QG_pad/U0/U0  (.D(\QG_pad/U0/NET1 ), .E(
        \QG_pad/U0/NET2 ), .PAD(QG));
    XOR2 \lzy_ori_c_0/Y_1_I_5  (.A(\A_c[0] ), .B(\A_c[1] ), .Y(
        \lzy_ori_c_0/Y_1[1] ));
    AOI1A \lzy_74HC85_0/QS56_0_I_11  (.A(\lzy_74HC85_0/ACT_LT4_E[3] ), 
        .B(\lzy_74HC85_0/ACT_LT4_E[6] ), .C(
        \lzy_74HC85_0/ACT_LT4_E[10] ), .Y(QS_c));
    AND2A \lzy_74HC85_0/QS56_0_I_3  (.A(\Y_net_1[1] ), .B(\Y_net_0[1] )
        , .Y(\lzy_74HC85_0/ACT_LT4_E[2] ));
    OR2A \lzy_74HC85_0/QS55_0_I_9  (.A(\Y_net_1[3] ), .B(\Y_net_0[3] ), 
        .Y(\lzy_74HC85_0/ACT_LT4_E_0[8] ));
    NOR2A \lzy_74HC85_0/QS55_0_I_1  (.A(\A_c[0] ), .B(\B_c[0] ), .Y(
        \lzy_74HC85_0/ACT_LT4_E_0[0] ));
    IOPAD_IN \A_pad[0]/U0/U0  (.PAD(A[0]), .Y(\A_pad[0]/U0/NET1 ));
    XOR2 \lzy_ori_c_1/Y_1_I_5  (.A(\B_c[0] ), .B(\B_c[1] ), .Y(
        \lzy_ori_c_1/Y_1[1] ));
    NOR2A \lzy_74HC85_0/QS55_0_I_8  (.A(\Y_net_1[2] ), .B(\Y_net_0[2] )
        , .Y(\lzy_74HC85_0/ACT_LT4_E_0[7] ));
    IOIN_IB \A_pad[2]/U0/U1  (.YIN(\A_pad[2]/U0/NET1 ), .Y(\A_c[2] ));
    IOIN_IB \A_pad[1]/U0/U1  (.YIN(\A_pad[1]/U0/NET1 ), .Y(\A_c[1] ));
    OR2A \lzy_74HC85_0/QS56_0_I_2  (.A(\Y_net_1[1] ), .B(\Y_net_0[1] ), 
        .Y(\lzy_74HC85_0/ACT_LT4_E[1] ));
    AOI1A \lzy_74HC85_0/QS55_0_I_10  (.A(\lzy_74HC85_0/ACT_LT4_E_0[7] )
        , .B(\lzy_74HC85_0/ACT_LT4_E_0[8] ), .C(
        \lzy_74HC85_0/ACT_LT4_E_0[5] ), .Y(
        \lzy_74HC85_0/ACT_LT4_E_0[10] ));
    NOR2A \lzy_74HC85_0/QS56_0_I_6  (.A(\Y_net_1[3] ), .B(\Y_net_0[3] )
        , .Y(\lzy_74HC85_0/ACT_LT4_E[5] ));
    OR3 \lzy_ori_c_0/Y_1_I_8  (.A(\A_c[1] ), .B(\A_c[0] ), .C(\A_c[2] )
        , .Y(\lzy_ori_c_0/Y_1[3] ));
    MX2 \lzy_ori_c_1/Y_2[1]  (.A(\B_c[1] ), .B(\lzy_ori_c_1/Y_1[1] ), 
        .S(\B_c[3] ), .Y(\Y_net_1[1] ));
    IOPAD_IN \B_pad[2]/U0/U0  (.PAD(B[2]), .Y(\B_pad[2]/U0/NET1 ));
    OR3 \lzy_ori_c_1/Y_1_I_8  (.A(\B_c[2] ), .B(\B_c[1] ), .C(\B_c[0] )
        , .Y(\lzy_ori_c_1/Y_1[3] ));
    MX2 \lzy_ori_c_0/Y_2[1]  (.A(\A_c[1] ), .B(\lzy_ori_c_0/Y_1[1] ), 
        .S(\A_c[3] ), .Y(\Y_net_0[1] ));
    XOR2 \lzy_74HC85_0/un1_A_3  (.A(\Y_net_0[3] ), .B(\Y_net_1[3] ), 
        .Y(\lzy_74HC85_0/un1_A_3_net_1 ));
    XOR2 \lzy_74HC85_0/un1_A_2  (.A(\Y_net_0[2] ), .B(\Y_net_1[2] ), 
        .Y(\lzy_74HC85_0/un1_A_2_net_1 ));
    NOR2A \lzy_74HC85_0/QS56_0_I_8  (.A(\Y_net_0[2] ), .B(\Y_net_1[2] )
        , .Y(\lzy_74HC85_0/ACT_LT4_E[7] ));
    IOIN_IB \B_pad[0]/U0/U1  (.YIN(\B_pad[0]/U0/NET1 ), .Y(\B_c[0] ));
    AOI1A \lzy_74HC85_0/QS55_0_I_11  (.A(\lzy_74HC85_0/ACT_LT4_E_0[3] )
        , .B(\lzy_74HC85_0/ACT_LT4_E_0[6] ), .C(
        \lzy_74HC85_0/ACT_LT4_E_0[10] ), .Y(QG_c));
    OR2B \lzy_ori_c_1/Y_2[3]  (.A(\B_c[3] ), .B(\lzy_ori_c_1/Y_1[3] ), 
        .Y(\Y_net_1[3] ));
    OR2A \lzy_74HC85_0/QS55_0_I_2  (.A(\Y_net_0[1] ), .B(\Y_net_1[1] ), 
        .Y(\lzy_74HC85_0/ACT_LT4_E_0[1] ));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
