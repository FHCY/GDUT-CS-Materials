`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


module cyq_74HC85(
       Q_c_0,
       Q_c_2,
       Y_net_0,
       Y_net_1,
       B_c_0,
       A_c_0,
       INV_1_Y,
       INV_0_Y,
       un1_A_NE
    );
output Q_c_0;
output Q_c_2;
input  [3:1] Y_net_0;
input  [3:1] Y_net_1;
input  B_c_0;
input  A_c_0;
input  INV_1_Y;
input  INV_0_Y;
output un1_A_NE;

    wire un1_A_NE_0_net_1, un1_A_3_net_1, un1_A_1_net_1, un1_A_0_net_1, 
        \ACT_LT4_E[3] , \ACT_LT4_E[6] , \ACT_LT4_E[10] , 
        \ACT_LT4_E[7] , \ACT_LT4_E[8] , \ACT_LT4_E[5] , \ACT_LT4_E[4] , 
        \ACT_LT4_E[0] , \ACT_LT4_E[1] , \ACT_LT4_E[2] , 
        \ACT_LT4_E_0[3] , \ACT_LT4_E_0[6] , \ACT_LT4_E_0[10] , 
        \ACT_LT4_E_0[7] , \ACT_LT4_E_0[8] , \ACT_LT4_E_0[5] , 
        \ACT_LT4_E_0[4] , \ACT_LT4_E_0[0] , \ACT_LT4_E_0[1] , 
        \ACT_LT4_E_0[2] , GND, VCC;
    
    AOI1A Q21_0_I_4 (.A(\ACT_LT4_E[0] ), .B(\ACT_LT4_E[1] ), .C(
        \ACT_LT4_E[2] ), .Y(\ACT_LT4_E[3] ));
    NOR2A Q21_0_I_7 (.A(\ACT_LT4_E[4] ), .B(\ACT_LT4_E[5] ), .Y(
        \ACT_LT4_E[6] ));
    AOI1A Q20_0_I_4 (.A(\ACT_LT4_E_0[0] ), .B(\ACT_LT4_E_0[1] ), .C(
        \ACT_LT4_E_0[2] ), .Y(\ACT_LT4_E_0[3] ));
    NOR2A Q21_0_I_8 (.A(Y_net_0[2]), .B(Y_net_1[2]), .Y(\ACT_LT4_E[7] )
        );
    AOI1A Q20_0_I_11 (.A(\ACT_LT4_E_0[3] ), .B(\ACT_LT4_E_0[6] ), .C(
        \ACT_LT4_E_0[10] ), .Y(Q_c_2));
    VCC VCC_i (.Y(VCC));
    NOR3 un1_A_NE_inst_1 (.A(un1_A_1_net_1), .B(un1_A_0_net_1), .C(
        un1_A_NE_0_net_1), .Y(un1_A_NE));
    XOR2 un1_A_1 (.A(Y_net_1[1]), .B(Y_net_0[1]), .Y(un1_A_1_net_1));
    AOI1A Q21_0_I_11 (.A(\ACT_LT4_E[3] ), .B(\ACT_LT4_E[6] ), .C(
        \ACT_LT4_E[10] ), .Y(Q_c_0));
    NOR2A Q20_0_I_7 (.A(\ACT_LT4_E_0[4] ), .B(\ACT_LT4_E_0[5] ), .Y(
        \ACT_LT4_E_0[6] ));
    XO1 un1_A_NE_0 (.A(Y_net_0[2]), .B(Y_net_1[2]), .C(un1_A_3_net_1), 
        .Y(un1_A_NE_0_net_1));
    OR2A Q20_0_I_2 (.A(Y_net_0[1]), .B(Y_net_1[1]), .Y(
        \ACT_LT4_E_0[1] ));
    XOR2 un1_A_0 (.A(A_c_0), .B(B_c_0), .Y(un1_A_0_net_1));
    GND GND_i (.Y(GND));
    NOR2A Q20_0_I_1 (.A(A_c_0), .B(B_c_0), .Y(\ACT_LT4_E_0[0] ));
    OR2A Q20_0_I_5 (.A(Y_net_0[2]), .B(Y_net_1[2]), .Y(
        \ACT_LT4_E_0[4] ));
    OR2A Q21_0_I_5 (.A(Y_net_1[2]), .B(Y_net_0[2]), .Y(\ACT_LT4_E[4] ));
    NOR2A Q21_0_I_1 (.A(B_c_0), .B(A_c_0), .Y(\ACT_LT4_E[0] ));
    AND2A Q21_0_I_3 (.A(Y_net_1[1]), .B(Y_net_0[1]), .Y(\ACT_LT4_E[2] )
        );
    NOR2A Q20_0_I_6 (.A(INV_0_Y), .B(INV_1_Y), .Y(\ACT_LT4_E_0[5] ));
    OR2A Q21_0_I_9 (.A(INV_0_Y), .B(INV_1_Y), .Y(\ACT_LT4_E[8] ));
    NOR2A Q20_0_I_8 (.A(Y_net_1[2]), .B(Y_net_0[2]), .Y(
        \ACT_LT4_E_0[7] ));
    AND2A Q20_0_I_3 (.A(Y_net_0[1]), .B(Y_net_1[1]), .Y(
        \ACT_LT4_E_0[2] ));
    AOI1A Q20_0_I_10 (.A(\ACT_LT4_E_0[7] ), .B(\ACT_LT4_E_0[8] ), .C(
        \ACT_LT4_E_0[5] ), .Y(\ACT_LT4_E_0[10] ));
    OR2A Q20_0_I_9 (.A(INV_1_Y), .B(INV_0_Y), .Y(\ACT_LT4_E_0[8] ));
    NOR2A Q21_0_I_6 (.A(INV_1_Y), .B(INV_0_Y), .Y(\ACT_LT4_E[5] ));
    AOI1A Q21_0_I_10 (.A(\ACT_LT4_E[7] ), .B(\ACT_LT4_E[8] ), .C(
        \ACT_LT4_E[5] ), .Y(\ACT_LT4_E[10] ));
    XOR2 un1_A_3 (.A(Y_net_1[3]), .B(Y_net_0[3]), .Y(un1_A_3_net_1));
    OR2A Q21_0_I_2 (.A(Y_net_1[1]), .B(Y_net_0[1]), .Y(\ACT_LT4_E[1] ));
    
endmodule


module cyq_ori_c_1(
       Y_net_0,
       A_c
    );
output [3:1] Y_net_0;
input  [3:0] A_c;

    wire CO1, N_10, \A_m[1]_net_1 , GND, VCC;
    
    AX1 \Y_1_iv[2]  (.A(CO1), .B(A_c[3]), .C(A_c[2]), .Y(Y_net_0[2]));
    NOR2A \A_m[1]  (.A(A_c[1]), .B(A_c[3]), .Y(\A_m[1]_net_1 ));
    OA1A Y_1_sqmuxa (.A(CO1), .B(A_c[2]), .C(A_c[3]), .Y(Y_net_0[3]));
    VCC VCC_i (.Y(VCC));
    XOR2 un4_Y_1_SUM1 (.A(A_c[0]), .B(A_c[1]), .Y(N_10));
    AO1 \Y_1_iv[1]  (.A(N_10), .B(Y_net_0[3]), .C(\A_m[1]_net_1 ), .Y(
        Y_net_0[1]));
    NOR2 un4_Y_1_CO1 (.A(A_c[0]), .B(A_c[1]), .Y(CO1));
    GND GND_i (.Y(GND));
    
endmodule


module cyq_ori_c_1_0(
       Y_net_1,
       B_c
    );
output [3:1] Y_net_1;
input  [3:0] B_c;

    wire CO1, N_10, \A_m[1]_net_1 , GND, VCC;
    
    AX1 \Y_1_iv[2]  (.A(CO1), .B(B_c[3]), .C(B_c[2]), .Y(Y_net_1[2]));
    NOR2A \A_m[1]  (.A(B_c[1]), .B(B_c[3]), .Y(\A_m[1]_net_1 ));
    OA1A Y_1_sqmuxa (.A(CO1), .B(B_c[2]), .C(B_c[3]), .Y(Y_net_1[3]));
    VCC VCC_i (.Y(VCC));
    XOR2 un4_Y_1_SUM1 (.A(B_c[0]), .B(B_c[1]), .Y(N_10));
    AO1 \Y_1_iv[1]  (.A(N_10), .B(Y_net_1[3]), .C(\A_m[1]_net_1 ), .Y(
        Y_net_1[1]));
    NOR2 un4_Y_1_CO1 (.A(B_c[0]), .B(B_c[1]), .Y(CO1));
    GND GND_i (.Y(GND));
    
endmodule


module cyq_SD1(
       A,
       B,
       Q
    );
input  [3:0] A;
input  [3:0] B;
output [2:0] Q;

    wire \Y_net_0[1] , \Y_net_0[2] , INV_0_Y, \Y_net_1[1] , 
        \Y_net_1[2] , INV_1_Y, GND, VCC, \Y_net_0[3] , \Y_net_1[3] , 
        \cyq_74HC85_0.un1_A_NE , \A_c[0] , \A_c[1] , \A_c[2] , 
        \A_c[3] , \B_c[0] , \B_c[1] , \B_c[2] , \B_c[3] , \Q_c[0] , 
        \Q_c[2] ;
    
    OUTBUF \Q_pad[1]  (.D(\cyq_74HC85_0.un1_A_NE ), .PAD(Q[1]));
    INBUF \B_pad[3]  (.PAD(B[3]), .Y(\B_c[3] ));
    INBUF \B_pad[2]  (.PAD(B[2]), .Y(\B_c[2] ));
    OUTBUF \Q_pad[2]  (.D(\Q_c[2] ), .PAD(Q[2]));
    INV INV_0 (.A(\Y_net_0[3] ), .Y(INV_0_Y));
    cyq_74HC85 cyq_74HC85_0 (.Q_c_0(\Q_c[0] ), .Q_c_2(\Q_c[2] ), 
        .Y_net_0({\Y_net_0[3] , \Y_net_0[2] , \Y_net_0[1] }), .Y_net_1({
        \Y_net_1[3] , \Y_net_1[2] , \Y_net_1[1] }), .B_c_0(\B_c[0] ), 
        .A_c_0(\A_c[0] ), .INV_1_Y(INV_1_Y), .INV_0_Y(INV_0_Y), 
        .un1_A_NE(\cyq_74HC85_0.un1_A_NE ));
    INBUF \A_pad[0]  (.PAD(A[0]), .Y(\A_c[0] ));
    VCC VCC_i (.Y(VCC));
    INBUF \B_pad[1]  (.PAD(B[1]), .Y(\B_c[1] ));
    INBUF \A_pad[2]  (.PAD(A[2]), .Y(\A_c[2] ));
    GND GND_i (.Y(GND));
    INBUF \A_pad[3]  (.PAD(A[3]), .Y(\A_c[3] ));
    INV INV_1 (.A(\Y_net_1[3] ), .Y(INV_1_Y));
    cyq_ori_c_1 cyq_ori_c_0 (.Y_net_0({\Y_net_0[3] , \Y_net_0[2] , 
        \Y_net_0[1] }), .A_c({\A_c[3] , \A_c[2] , \A_c[1] , \A_c[0] }));
    cyq_ori_c_1_0 cyq_ori_c_1 (.Y_net_1({\Y_net_1[3] , \Y_net_1[2] , 
        \Y_net_1[1] }), .B_c({\B_c[3] , \B_c[2] , \B_c[1] , \B_c[0] }));
    OUTBUF \Q_pad[0]  (.D(\Q_c[0] ), .PAD(Q[0]));
    INBUF \A_pad[1]  (.PAD(A[1]), .Y(\A_c[1] ));
    INBUF \B_pad[0]  (.PAD(B[0]), .Y(\B_c[0] ));
    
endmodule
