`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4
// File used only for Simulation


module cyq_SD1(
       A,
       B,
       Q
    );
input  [3:0] A;
input  [3:0] B;
output [2:0] Q;

    wire \Y_net_0[1] , \Y_net_0[2] , INV_0_Y, \Y_net_1[1] , 
        \Y_net_1[2] , INV_1_Y, \Y_net_0[3] , \Y_net_1[3] , 
        \cyq_74HC85_0.un1_A_NE , \A_c[0] , \A_c[1] , \A_c[2] , 
        \A_c[3] , \B_c[0] , \B_c[1] , \B_c[2] , \B_c[3] , \Q_c[0] , 
        \Q_c[2] , \cyq_74HC85_0/un1_A_NE_0_net_1 , 
        \cyq_74HC85_0/un1_A_3_net_1 , \cyq_74HC85_0/un1_A_1_net_1 , 
        \cyq_74HC85_0/un1_A_0_net_1 , \cyq_74HC85_0/ACT_LT4_E[3] , 
        \cyq_74HC85_0/ACT_LT4_E[6] , \cyq_74HC85_0/ACT_LT4_E[10] , 
        \cyq_74HC85_0/ACT_LT4_E[7] , \cyq_74HC85_0/ACT_LT4_E[8] , 
        \cyq_74HC85_0/ACT_LT4_E[5] , \cyq_74HC85_0/ACT_LT4_E[0] , 
        \cyq_74HC85_0/ACT_LT4_E[1] , \cyq_74HC85_0/ACT_LT4_E[2] , 
        \cyq_74HC85_0/ACT_LT4_E_0[3] , \cyq_74HC85_0/ACT_LT4_E_0[6] , 
        \cyq_74HC85_0/ACT_LT4_E_0[10] , \cyq_74HC85_0/ACT_LT4_E_0[7] , 
        \cyq_74HC85_0/ACT_LT4_E_0[8] , \cyq_74HC85_0/ACT_LT4_E_0[5] , 
        \cyq_74HC85_0/ACT_LT4_E_0[0] , \cyq_74HC85_0/ACT_LT4_E_0[1] , 
        \cyq_74HC85_0/ACT_LT4_E_0[2] , \cyq_ori_c_0/CO1 , 
        \cyq_ori_c_0/N_10 , \cyq_ori_c_0/A_m[1]_net_1 , 
        \cyq_ori_c_1/CO1 , \cyq_ori_c_1/N_10 , 
        \cyq_ori_c_1/A_m[1]_net_1 , \B_pad[3]/U0/NET1 , 
        \B_pad[2]/U0/NET1 , \Q_pad[2]/U0/NET1 , \Q_pad[2]/U0/NET2 , 
        \A_pad[3]/U0/NET1 , \B_pad[1]/U0/NET1 , \A_pad[0]/U0/NET1 , 
        \B_pad[0]/U0/NET1 , \Q_pad[1]/U0/NET1 , \Q_pad[1]/U0/NET2 , 
        \A_pad[2]/U0/NET1 , \Q_pad[0]/U0/NET1 , \Q_pad[0]/U0/NET2 , 
        VCC, \A_pad[1]/U0/NET1 , GND, AFLSDF_VCC, AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    NOR2A \cyq_74HC85_0/Q20_0_I_1  (.A(\A_c[0] ), .B(\B_c[0] ), .Y(
        \cyq_74HC85_0/ACT_LT4_E_0[0] ));
    IOPAD_IN \A_pad[2]/U0/U0  (.PAD(A[2]), .Y(\A_pad[2]/U0/NET1 ));
    IOPAD_IN \A_pad[1]/U0/U0  (.PAD(A[1]), .Y(\A_pad[1]/U0/NET1 ));
    NOR3 \cyq_74HC85_0/un1_A_NE  (.A(\cyq_74HC85_0/un1_A_1_net_1 ), .B(
        \cyq_74HC85_0/un1_A_0_net_1 ), .C(
        \cyq_74HC85_0/un1_A_NE_0_net_1 ), .Y(\cyq_74HC85_0.un1_A_NE ));
    NOR2A \cyq_74HC85_0/Q20_0_I_6  (.A(INV_0_Y), .B(INV_1_Y), .Y(
        \cyq_74HC85_0/ACT_LT4_E_0[5] ));
    IOIN_IB \A_pad[3]/U0/U1  (.YIN(\A_pad[3]/U0/NET1 ), .Y(\A_c[3] ));
    IOIN_IB \B_pad[1]/U0/U1  (.YIN(\B_pad[1]/U0/NET1 ), .Y(\B_c[1] ));
    IOTRI_OB_EB \Q_pad[0]/U0/U1  (.D(\Q_c[0] ), .E(VCC), .DOUT(
        \Q_pad[0]/U0/NET1 ), .EOUT(\Q_pad[0]/U0/NET2 ));
    OR2A \cyq_74HC85_0/Q20_0_I_9  (.A(INV_1_Y), .B(INV_0_Y), .Y(
        \cyq_74HC85_0/ACT_LT4_E_0[8] ));
    XOR2 \cyq_ori_c_1/un4_Y_1_SUM1  (.A(\B_c[0] ), .B(\B_c[1] ), .Y(
        \cyq_ori_c_1/N_10 ));
    IOIN_IB \B_pad[3]/U0/U1  (.YIN(\B_pad[3]/U0/NET1 ), .Y(\B_c[3] ));
    NOR2A \cyq_74HC85_0/Q21_0_I_6  (.A(INV_1_Y), .B(INV_0_Y), .Y(
        \cyq_74HC85_0/ACT_LT4_E[5] ));
    AX1 \cyq_ori_c_1/Y_1_iv[2]  (.A(\cyq_ori_c_1/CO1 ), .B(\B_c[3] ), 
        .C(\B_c[2] ), .Y(\Y_net_1[2] ));
    IOTRI_OB_EB \Q_pad[1]/U0/U1  (.D(\cyq_74HC85_0.un1_A_NE ), .E(VCC), 
        .DOUT(\Q_pad[1]/U0/NET1 ), .EOUT(\Q_pad[1]/U0/NET2 ));
    IOIN_IB \A_pad[0]/U0/U1  (.YIN(\A_pad[0]/U0/NET1 ), .Y(\A_c[0] ));
    OR2A \cyq_74HC85_0/Q21_0_I_9  (.A(INV_0_Y), .B(INV_1_Y), .Y(
        \cyq_74HC85_0/ACT_LT4_E[8] ));
    OR2A \cyq_74HC85_0/Q20_0_I_2  (.A(\Y_net_0[1] ), .B(\Y_net_1[1] ), 
        .Y(\cyq_74HC85_0/ACT_LT4_E_0[1] ));
    OA1A \cyq_ori_c_1/Y_1_sqmuxa  (.A(\cyq_ori_c_1/CO1 ), .B(\B_c[2] ), 
        .C(\B_c[3] ), .Y(\Y_net_1[3] ));
    IOTRI_OB_EB \Q_pad[2]/U0/U1  (.D(\Q_c[2] ), .E(VCC), .DOUT(
        \Q_pad[2]/U0/NET1 ), .EOUT(\Q_pad[2]/U0/NET2 ));
    AO1 \cyq_ori_c_1/Y_1_iv[1]  (.A(\cyq_ori_c_1/N_10 ), .B(
        \Y_net_1[3] ), .C(\cyq_ori_c_1/A_m[1]_net_1 ), .Y(\Y_net_1[1] )
        );
    INV INV_1 (.A(\Y_net_1[3] ), .Y(INV_1_Y));
    XOR2 \cyq_ori_c_0/un4_Y_1_SUM1  (.A(\A_c[0] ), .B(\A_c[1] ), .Y(
        \cyq_ori_c_0/N_10 ));
    AND2A \cyq_74HC85_0/Q20_0_I_3  (.A(\Y_net_0[1] ), .B(\Y_net_1[1] ), 
        .Y(\cyq_74HC85_0/ACT_LT4_E_0[2] ));
    IOPAD_IN \B_pad[0]/U0/U0  (.PAD(B[0]), .Y(\B_pad[0]/U0/NET1 ));
    NOR2A \cyq_ori_c_0/A_m[1]  (.A(\A_c[1] ), .B(\A_c[3] ), .Y(
        \cyq_ori_c_0/A_m[1]_net_1 ));
    NOR2A \cyq_74HC85_0/Q20_0_I_8  (.A(\Y_net_1[2] ), .B(\Y_net_0[2] ), 
        .Y(\cyq_74HC85_0/ACT_LT4_E_0[7] ));
    XOR2 \cyq_74HC85_0/un1_A_3  (.A(\Y_net_1[3] ), .B(\Y_net_0[3] ), 
        .Y(\cyq_74HC85_0/un1_A_3_net_1 ));
    AOI1A \cyq_74HC85_0/Q21_0_I_11  (.A(\cyq_74HC85_0/ACT_LT4_E[3] ), 
        .B(\cyq_74HC85_0/ACT_LT4_E[6] ), .C(
        \cyq_74HC85_0/ACT_LT4_E[10] ), .Y(\Q_c[0] ));
    IOPAD_IN \A_pad[3]/U0/U0  (.PAD(A[3]), .Y(\A_pad[3]/U0/NET1 ));
    IOIN_IB \B_pad[2]/U0/U1  (.YIN(\B_pad[2]/U0/NET1 ), .Y(\B_c[2] ));
    IOPAD_IN \B_pad[1]/U0/U0  (.PAD(B[1]), .Y(\B_pad[1]/U0/NET1 ));
    IOPAD_TRI \Q_pad[0]/U0/U0  (.D(\Q_pad[0]/U0/NET1 ), .E(
        \Q_pad[0]/U0/NET2 ), .PAD(Q[0]));
    AND2A \cyq_74HC85_0/Q21_0_I_3  (.A(\Y_net_1[1] ), .B(\Y_net_0[1] ), 
        .Y(\cyq_74HC85_0/ACT_LT4_E[2] ));
    IOPAD_IN \B_pad[3]/U0/U0  (.PAD(B[3]), .Y(\B_pad[3]/U0/NET1 ));
    NOR2 \cyq_ori_c_0/un4_Y_1_CO1  (.A(\A_c[0] ), .B(\A_c[1] ), .Y(
        \cyq_ori_c_0/CO1 ));
    AOI1A \cyq_74HC85_0/Q20_0_I_11  (.A(\cyq_74HC85_0/ACT_LT4_E_0[3] ), 
        .B(\cyq_74HC85_0/ACT_LT4_E_0[6] ), .C(
        \cyq_74HC85_0/ACT_LT4_E_0[10] ), .Y(\Q_c[2] ));
    IOPAD_TRI \Q_pad[1]/U0/U0  (.D(\Q_pad[1]/U0/NET1 ), .E(
        \Q_pad[1]/U0/NET2 ), .PAD(Q[1]));
    XOR2 \cyq_74HC85_0/un1_A_0  (.A(\A_c[0] ), .B(\B_c[0] ), .Y(
        \cyq_74HC85_0/un1_A_0_net_1 ));
    NOR2A \cyq_74HC85_0/Q21_0_I_8  (.A(\Y_net_0[2] ), .B(\Y_net_1[2] ), 
        .Y(\cyq_74HC85_0/ACT_LT4_E[7] ));
    IOPAD_IN \A_pad[0]/U0/U0  (.PAD(A[0]), .Y(\A_pad[0]/U0/NET1 ));
    IOPAD_TRI \Q_pad[2]/U0/U0  (.D(\Q_pad[2]/U0/NET1 ), .E(
        \Q_pad[2]/U0/NET2 ), .PAD(Q[2]));
    NOR2 \cyq_ori_c_1/un4_Y_1_CO1  (.A(\B_c[0] ), .B(\B_c[1] ), .Y(
        \cyq_ori_c_1/CO1 ));
    AX1 \cyq_ori_c_0/Y_1_iv[2]  (.A(\cyq_ori_c_0/CO1 ), .B(\A_c[3] ), 
        .C(\A_c[2] ), .Y(\Y_net_0[2] ));
    AOI1A \cyq_74HC85_0/Q20_0_I_7  (.A(\Y_net_1[2] ), .B(\Y_net_0[2] ), 
        .C(\cyq_74HC85_0/ACT_LT4_E_0[5] ), .Y(
        \cyq_74HC85_0/ACT_LT4_E_0[6] ));
    AOI1A \cyq_74HC85_0/Q21_0_I_10  (.A(\cyq_74HC85_0/ACT_LT4_E[7] ), 
        .B(\cyq_74HC85_0/ACT_LT4_E[8] ), .C(
        \cyq_74HC85_0/ACT_LT4_E[5] ), .Y(\cyq_74HC85_0/ACT_LT4_E[10] ));
    NOR2A \cyq_ori_c_1/A_m[1]  (.A(\B_c[1] ), .B(\B_c[3] ), .Y(
        \cyq_ori_c_1/A_m[1]_net_1 ));
    IOIN_IB \A_pad[2]/U0/U1  (.YIN(\A_pad[2]/U0/NET1 ), .Y(\A_c[2] ));
    IOIN_IB \A_pad[1]/U0/U1  (.YIN(\A_pad[1]/U0/NET1 ), .Y(\A_c[1] ));
    AO1 \cyq_ori_c_0/Y_1_iv[1]  (.A(\cyq_ori_c_0/N_10 ), .B(
        \Y_net_0[3] ), .C(\cyq_ori_c_0/A_m[1]_net_1 ), .Y(\Y_net_0[1] )
        );
    AOI1A \cyq_74HC85_0/Q21_0_I_4  (.A(\cyq_74HC85_0/ACT_LT4_E[0] ), 
        .B(\cyq_74HC85_0/ACT_LT4_E[1] ), .C(
        \cyq_74HC85_0/ACT_LT4_E[2] ), .Y(\cyq_74HC85_0/ACT_LT4_E[3] ));
    AOI1A \cyq_74HC85_0/Q20_0_I_10  (.A(\cyq_74HC85_0/ACT_LT4_E_0[7] ), 
        .B(\cyq_74HC85_0/ACT_LT4_E_0[8] ), .C(
        \cyq_74HC85_0/ACT_LT4_E_0[5] ), .Y(
        \cyq_74HC85_0/ACT_LT4_E_0[10] ));
    AOI1A \cyq_74HC85_0/Q20_0_I_4  (.A(\cyq_74HC85_0/ACT_LT4_E_0[0] ), 
        .B(\cyq_74HC85_0/ACT_LT4_E_0[1] ), .C(
        \cyq_74HC85_0/ACT_LT4_E_0[2] ), .Y(
        \cyq_74HC85_0/ACT_LT4_E_0[3] ));
    OR2A \cyq_74HC85_0/Q21_0_I_2  (.A(\Y_net_1[1] ), .B(\Y_net_0[1] ), 
        .Y(\cyq_74HC85_0/ACT_LT4_E[1] ));
    IOPAD_IN \B_pad[2]/U0/U0  (.PAD(B[2]), .Y(\B_pad[2]/U0/NET1 ));
    OA1A \cyq_ori_c_0/Y_1_sqmuxa  (.A(\cyq_ori_c_0/CO1 ), .B(\A_c[2] ), 
        .C(\A_c[3] ), .Y(\Y_net_0[3] ));
    XOR2 \cyq_74HC85_0/un1_A_1  (.A(\Y_net_1[1] ), .B(\Y_net_0[1] ), 
        .Y(\cyq_74HC85_0/un1_A_1_net_1 ));
    INV INV_0 (.A(\Y_net_0[3] ), .Y(INV_0_Y));
    NOR2A \cyq_74HC85_0/Q21_0_I_1  (.A(\B_c[0] ), .B(\A_c[0] ), .Y(
        \cyq_74HC85_0/ACT_LT4_E[0] ));
    AOI1A \cyq_74HC85_0/Q21_0_I_7  (.A(\Y_net_0[2] ), .B(\Y_net_1[2] ), 
        .C(\cyq_74HC85_0/ACT_LT4_E[5] ), .Y(
        \cyq_74HC85_0/ACT_LT4_E[6] ));
    IOIN_IB \B_pad[0]/U0/U1  (.YIN(\B_pad[0]/U0/NET1 ), .Y(\B_c[0] ));
    XO1 \cyq_74HC85_0/un1_A_NE_0  (.A(\Y_net_0[2] ), .B(\Y_net_1[2] ), 
        .C(\cyq_74HC85_0/un1_A_3_net_1 ), .Y(
        \cyq_74HC85_0/un1_A_NE_0_net_1 ));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
