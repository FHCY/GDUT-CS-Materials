//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu Dec 12 13:20:06 2024
// Version: v11.9 11.9.0.4
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// lzy_SD1
module lzy_SD1(
    // Inputs
    A,
    B,
    // Outputs
    QE,
    QG,
    QS
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [3:0] A;
input  [3:0] B;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output       QE;
output       QG;
output       QS;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [3:0] A;
wire   [3:0] B;
wire   [0:0] lzy_ori_c_0_Y0to0;
wire   [1:1] lzy_ori_c_0_Y1to1;
wire   [2:2] lzy_ori_c_0_Y2to2;
wire   [3:3] lzy_ori_c_0_Y3to3;
wire   [0:0] lzy_ori_c_1_Y0to0;
wire   [1:1] lzy_ori_c_1_Y1to1;
wire   [2:2] lzy_ori_c_1_Y2to2;
wire   [3:3] lzy_ori_c_1_Y3to3;
wire         QE_net_0;
wire         QG_net_0;
wire         QS_net_0;
wire         QG_net_1;
wire         QE_net_1;
wire         QS_net_1;
wire   [3:0] A_net_0;
wire   [3:0] B_net_0;
wire   [3:0] Y_net_0;
wire   [3:0] Y_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire         GND_net;
wire         VCC_net;
//--------------------------------------------------------------------
// Inverted Nets
//--------------------------------------------------------------------
wire   [3:3] Y_OUT_PRE_INV0_0;
wire   [3:3] Y_OUT_PRE_INV1_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net = 1'b0;
assign VCC_net = 1'b1;
//--------------------------------------------------------------------
// Inversions
//--------------------------------------------------------------------
assign lzy_ori_c_0_Y3to3[3] = ~ Y_OUT_PRE_INV0_0[3];
assign lzy_ori_c_1_Y3to3[3] = ~ Y_OUT_PRE_INV1_0[3];
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign QG_net_1 = QG_net_0;
assign QG       = QG_net_1;
assign QE_net_1 = QE_net_0;
assign QE       = QE_net_1;
assign QS_net_1 = QS_net_0;
assign QS       = QS_net_1;
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign lzy_ori_c_0_Y0to0[0] = Y_net_0[0:0];
assign lzy_ori_c_0_Y1to1[1] = Y_net_0[1:1];
assign lzy_ori_c_0_Y2to2[2] = Y_net_0[2:2];
assign lzy_ori_c_1_Y0to0[0] = Y_net_1[0:0];
assign lzy_ori_c_1_Y1to1[1] = Y_net_1[1:1];
assign lzy_ori_c_1_Y2to2[2] = Y_net_1[2:2];
assign Y_OUT_PRE_INV0_0[3]  = Y_net_0[3:3];
assign Y_OUT_PRE_INV1_0[3]  = Y_net_1[3:3];
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign A_net_0 = { lzy_ori_c_0_Y3to3[3] , lzy_ori_c_0_Y2to2[2] , lzy_ori_c_0_Y1to1[1] , lzy_ori_c_0_Y0to0[0] };
assign B_net_0 = { lzy_ori_c_1_Y3to3[3] , lzy_ori_c_1_Y2to2[2] , lzy_ori_c_1_Y1to1[1] , lzy_ori_c_1_Y0to0[0] };
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------lzy_74HC85
lzy_74HC85 lzy_74HC85_0(
        // Inputs
        .IG ( GND_net ),
        .IE ( VCC_net ),
        .IS ( GND_net ),
        .A  ( A_net_0 ),
        .B  ( B_net_0 ),
        // Outputs
        .QG ( QG_net_0 ),
        .QE ( QE_net_0 ),
        .QS ( QS_net_0 ) 
        );

//--------lzy_ori_c
lzy_ori_c lzy_ori_c_0(
        // Inputs
        .A ( A ),
        // Outputs
        .Y ( Y_net_0 ) 
        );

//--------lzy_ori_c
lzy_ori_c lzy_ori_c_1(
        // Inputs
        .A ( B ),
        // Outputs
        .Y ( Y_net_1 ) 
        );


endmodule
