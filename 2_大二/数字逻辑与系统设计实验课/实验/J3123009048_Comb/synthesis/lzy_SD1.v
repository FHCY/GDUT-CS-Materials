`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


module lzy_ori_c_1(
       Y_net_0,
       A_c
    );
output [3:1] Y_net_0;
input  [3:0] A_c;

    wire N_3, \Y_1[3] , \Y_1[2] , \Y_1[1] , GND, VCC;
    
    OR2B \Y_2[3]  (.A(A_c[3]), .B(\Y_1[3] ), .Y(Y_net_0[3]));
    MX2 \Y_2[2]  (.A(A_c[2]), .B(\Y_1[2] ), .S(A_c[3]), .Y(Y_net_0[2]));
    XOR2 Y_1_I_5 (.A(A_c[0]), .B(A_c[1]), .Y(\Y_1[1] ));
    OR3 Y_1_I_8 (.A(A_c[1]), .B(A_c[0]), .C(A_c[2]), .Y(\Y_1[3] ));
    MX2 \Y_2[1]  (.A(A_c[1]), .B(\Y_1[1] ), .S(A_c[3]), .Y(Y_net_0[1]));
    XNOR2 Y_1_I_7 (.A(A_c[2]), .B(N_3), .Y(\Y_1[2] ));
    VCC VCC_i (.Y(VCC));
    NOR2 Y_1_I_6 (.A(A_c[0]), .B(A_c[1]), .Y(N_3));
    GND GND_i (.Y(GND));
    
endmodule


module lzy_ori_c_1_0(
       Y_net_1,
       B_c
    );
output [3:1] Y_net_1;
input  [3:0] B_c;

    wire N_3, \Y_1[3] , \Y_1[2] , \Y_1[1] , GND, VCC;
    
    OR2B \Y_2[3]  (.A(B_c[3]), .B(\Y_1[3] ), .Y(Y_net_1[3]));
    MX2 \Y_2[2]  (.A(B_c[2]), .B(\Y_1[2] ), .S(B_c[3]), .Y(Y_net_1[2]));
    XOR2 Y_1_I_5 (.A(B_c[0]), .B(B_c[1]), .Y(\Y_1[1] ));
    OR3 Y_1_I_8 (.A(B_c[2]), .B(B_c[1]), .C(B_c[0]), .Y(\Y_1[3] ));
    MX2 \Y_2[1]  (.A(B_c[1]), .B(\Y_1[1] ), .S(B_c[3]), .Y(Y_net_1[1]));
    XNOR2 Y_1_I_7 (.A(B_c[2]), .B(N_3), .Y(\Y_1[2] ));
    VCC VCC_i (.Y(VCC));
    NOR2 Y_1_I_6 (.A(B_c[1]), .B(B_c[0]), .Y(N_3));
    GND GND_i (.Y(GND));
    
endmodule


module lzy_74HC85(
       B_c_0,
       A_c_0,
       Y_net_1,
       Y_net_0,
       QG_c,
       QS_c,
       un1_A_NE
    );
input  B_c_0;
input  A_c_0;
input  [3:1] Y_net_1;
input  [3:1] Y_net_0;
output QG_c;
output QS_c;
output un1_A_NE;

    wire un1_A_NE_0_net_1, un1_A_0_net_1, un1_A_2_net_1, un1_A_3_net_1, 
        \ACT_LT4_E[3] , \ACT_LT4_E[6] , \ACT_LT4_E[10] , 
        \ACT_LT4_E[7] , \ACT_LT4_E[8] , \ACT_LT4_E[5] , \ACT_LT4_E[4] , 
        \ACT_LT4_E[0] , \ACT_LT4_E[1] , \ACT_LT4_E[2] , 
        \ACT_LT4_E_0[3] , \ACT_LT4_E_0[6] , \ACT_LT4_E_0[10] , 
        \ACT_LT4_E_0[7] , \ACT_LT4_E_0[8] , \ACT_LT4_E_0[5] , 
        \ACT_LT4_E_0[4] , \ACT_LT4_E_0[0] , \ACT_LT4_E_0[1] , 
        \ACT_LT4_E_0[2] , GND, VCC;
    
    NOR2A QS56_0_I_7 (.A(\ACT_LT4_E[4] ), .B(\ACT_LT4_E[5] ), .Y(
        \ACT_LT4_E[6] ));
    AOI1A QS56_0_I_10 (.A(\ACT_LT4_E[7] ), .B(\ACT_LT4_E[8] ), .C(
        \ACT_LT4_E[5] ), .Y(\ACT_LT4_E[10] ));
    AOI1A QS55_0_I_10 (.A(\ACT_LT4_E_0[7] ), .B(\ACT_LT4_E_0[8] ), .C(
        \ACT_LT4_E_0[5] ), .Y(\ACT_LT4_E_0[10] ));
    AOI1A QS55_0_I_4 (.A(\ACT_LT4_E_0[0] ), .B(\ACT_LT4_E_0[1] ), .C(
        \ACT_LT4_E_0[2] ), .Y(\ACT_LT4_E_0[3] ));
    AOI1A QS56_0_I_11 (.A(\ACT_LT4_E[3] ), .B(\ACT_LT4_E[6] ), .C(
        \ACT_LT4_E[10] ), .Y(QS_c));
    AOI1A QS55_0_I_11 (.A(\ACT_LT4_E_0[3] ), .B(\ACT_LT4_E_0[6] ), .C(
        \ACT_LT4_E_0[10] ), .Y(QG_c));
    VCC VCC_i (.Y(VCC));
    NOR3 un1_A_NE_inst_1 (.A(un1_A_2_net_1), .B(un1_A_3_net_1), .C(
        un1_A_NE_0_net_1), .Y(un1_A_NE));
    NOR2A QS55_0_I_6 (.A(Y_net_0[3]), .B(Y_net_1[3]), .Y(
        \ACT_LT4_E_0[5] ));
    AND2A QS55_0_I_3 (.A(Y_net_0[1]), .B(Y_net_1[1]), .Y(
        \ACT_LT4_E_0[2] ));
    OR2A QS55_0_I_2 (.A(Y_net_0[1]), .B(Y_net_1[1]), .Y(
        \ACT_LT4_E_0[1] ));
    NOR2A QS56_0_I_1 (.A(B_c_0), .B(A_c_0), .Y(\ACT_LT4_E[0] ));
    OR2A QS55_0_I_9 (.A(Y_net_1[3]), .B(Y_net_0[3]), .Y(
        \ACT_LT4_E_0[8] ));
    NOR2A QS55_0_I_1 (.A(A_c_0), .B(B_c_0), .Y(\ACT_LT4_E_0[0] ));
    OR2A QS56_0_I_9 (.A(Y_net_0[3]), .B(Y_net_1[3]), .Y(\ACT_LT4_E[8] )
        );
    AOI1A QS56_0_I_4 (.A(\ACT_LT4_E[0] ), .B(\ACT_LT4_E[1] ), .C(
        \ACT_LT4_E[2] ), .Y(\ACT_LT4_E[3] ));
    NOR2A QS55_0_I_8 (.A(Y_net_1[2]), .B(Y_net_0[2]), .Y(
        \ACT_LT4_E_0[7] ));
    XO1 un1_A_NE_0 (.A(Y_net_1[1]), .B(Y_net_0[1]), .C(un1_A_0_net_1), 
        .Y(un1_A_NE_0_net_1));
    XOR2 un1_A_0 (.A(A_c_0), .B(B_c_0), .Y(un1_A_0_net_1));
    GND GND_i (.Y(GND));
    OR2A QS56_0_I_5 (.A(Y_net_1[2]), .B(Y_net_0[2]), .Y(\ACT_LT4_E[4] )
        );
    NOR2A QS55_0_I_7 (.A(\ACT_LT4_E_0[4] ), .B(\ACT_LT4_E_0[5] ), .Y(
        \ACT_LT4_E_0[6] ));
    AND2A QS56_0_I_3 (.A(Y_net_1[1]), .B(Y_net_0[1]), .Y(
        \ACT_LT4_E[2] ));
    OR2A QS55_0_I_5 (.A(Y_net_0[2]), .B(Y_net_1[2]), .Y(
        \ACT_LT4_E_0[4] ));
    OR2A QS56_0_I_2 (.A(Y_net_1[1]), .B(Y_net_0[1]), .Y(\ACT_LT4_E[1] )
        );
    XOR2 un1_A_2 (.A(Y_net_0[2]), .B(Y_net_1[2]), .Y(un1_A_2_net_1));
    NOR2A QS56_0_I_6 (.A(Y_net_1[3]), .B(Y_net_0[3]), .Y(
        \ACT_LT4_E[5] ));
    NOR2A QS56_0_I_8 (.A(Y_net_0[2]), .B(Y_net_1[2]), .Y(
        \ACT_LT4_E[7] ));
    XOR2 un1_A_3 (.A(Y_net_0[3]), .B(Y_net_1[3]), .Y(un1_A_3_net_1));
    
endmodule


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

    wire \Y_net_0[1] , \Y_net_0[2] , \Y_net_1[1] , \Y_net_1[2] , GND, 
        VCC, \Y_net_0[3] , \Y_net_1[3] , \lzy_74HC85_0.un1_A_NE , 
        \A_c[0] , \A_c[1] , \A_c[2] , \A_c[3] , \B_c[0] , \B_c[1] , 
        \B_c[2] , \B_c[3] , QG_c, QS_c;
    
    OUTBUF QS_pad (.D(QS_c), .PAD(QS));
    INBUF \B_pad[1]  (.PAD(B[1]), .Y(\B_c[1] ));
    INBUF \B_pad[2]  (.PAD(B[2]), .Y(\B_c[2] ));
    lzy_ori_c_1 lzy_ori_c_0 (.Y_net_0({\Y_net_0[3] , \Y_net_0[2] , 
        \Y_net_0[1] }), .A_c({\A_c[3] , \A_c[2] , \A_c[1] , \A_c[0] }));
    INBUF \A_pad[2]  (.PAD(A[2]), .Y(\A_c[2] ));
    lzy_ori_c_1_0 lzy_ori_c_1 (.Y_net_1({\Y_net_1[3] , \Y_net_1[2] , 
        \Y_net_1[1] }), .B_c({\B_c[3] , \B_c[2] , \B_c[1] , \B_c[0] }));
    INBUF \A_pad[3]  (.PAD(A[3]), .Y(\A_c[3] ));
    INBUF \A_pad[1]  (.PAD(A[1]), .Y(\A_c[1] ));
    VCC VCC_i (.Y(VCC));
    INBUF \A_pad[0]  (.PAD(A[0]), .Y(\A_c[0] ));
    INBUF \B_pad[3]  (.PAD(B[3]), .Y(\B_c[3] ));
    INBUF \B_pad[0]  (.PAD(B[0]), .Y(\B_c[0] ));
    lzy_74HC85 lzy_74HC85_0 (.B_c_0(\B_c[0] ), .A_c_0(\A_c[0] ), 
        .Y_net_1({\Y_net_1[3] , \Y_net_1[2] , \Y_net_1[1] }), .Y_net_0({
        \Y_net_0[3] , \Y_net_0[2] , \Y_net_0[1] }), .QG_c(QG_c), .QS_c(
        QS_c), .un1_A_NE(\lzy_74HC85_0.un1_A_NE ));
    GND GND_i (.Y(GND));
    OUTBUF QE_pad (.D(\lzy_74HC85_0.un1_A_NE ), .PAD(QE));
    OUTBUF QG_pad (.D(QG_c), .PAD(QG));
    
endmodule
