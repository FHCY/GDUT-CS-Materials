//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Mon Nov 13 17:34:35 2023
// Version: v11.9 11.9.0.4
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// cyq_SD1
module cyq_SD1(
    // Inputs
    A,
    B,
    // Outputs
    Q
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [3:0] A;
input  [3:0] B;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [2:0] Q;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [3:0] A;
wire   [3:0] B;
wire   [0:0] cyq_ori_c_0_Y0to0;
wire   [1:1] cyq_ori_c_0_Y1to1;
wire   [2:2] cyq_ori_c_0_Y2to2;
wire   [3:3] cyq_ori_c_0_Y3to3;
wire   [0:0] cyq_ori_c_1_Y0to0;
wire   [1:1] cyq_ori_c_1_Y1to1;
wire   [2:2] cyq_ori_c_1_Y2to2;
wire   [3:3] cyq_ori_c_1_Y3to3;
wire         INV_0_Y;
wire         INV_1_Y;
wire   [2:0] Q_net_0;
wire   [2:0] Q_net_1;
wire   [0:0] Q_slice_0;
wire   [1:1] Q_slice_1;
wire   [2:2] Q_slice_2;
wire   [3:0] A_net_0;
wire   [3:0] B_net_0;
wire   [2:0] I_net_0;
wire   [3:0] Y_net_0;
wire   [3:0] Y_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire         GND_net;
wire         VCC_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net    = 1'b0;
assign VCC_net    = 1'b1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign Q_net_1 = Q_net_0;
assign Q[2:0]  = Q_net_1;
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign cyq_ori_c_0_Y0to0[0] = Y_net_0[0:0];
assign cyq_ori_c_0_Y1to1[1] = Y_net_0[1:1];
assign cyq_ori_c_0_Y2to2[2] = Y_net_0[2:2];
assign cyq_ori_c_0_Y3to3[3] = Y_net_0[3:3];
assign cyq_ori_c_1_Y0to0[0] = Y_net_1[0:0];
assign cyq_ori_c_1_Y1to1[1] = Y_net_1[1:1];
assign cyq_ori_c_1_Y2to2[2] = Y_net_1[2:2];
assign cyq_ori_c_1_Y3to3[3] = Y_net_1[3:3];
assign Q_slice_0[0]         = Q_net_0[0:0];
assign Q_slice_1[1]         = Q_net_0[1:1];
assign Q_slice_2[2]         = Q_net_0[2:2];
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign A_net_0 = { INV_0_Y , cyq_ori_c_0_Y2to2[2] , cyq_ori_c_0_Y1to1[1] , cyq_ori_c_0_Y0to0[0] };
assign B_net_0 = { INV_1_Y , cyq_ori_c_1_Y2to2[2] , cyq_ori_c_1_Y1to1[1] , cyq_ori_c_1_Y0to0[0] };
assign I_net_0 = { 1'b0 , 1'b1 , 1'b0 };
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------cyq_74HC85
cyq_74HC85 cyq_74HC85_0(
        // Inputs
        .A ( A_net_0 ),
        .B ( B_net_0 ),
        .I ( I_net_0 ),
        // Outputs
        .Q ( Q_net_0 ) 
        );

//--------cyq_ori_c
cyq_ori_c cyq_ori_c_0(
        // Inputs
        .A ( A ),
        // Outputs
        .Y ( Y_net_0 ) 
        );

//--------cyq_ori_c
cyq_ori_c cyq_ori_c_1(
        // Inputs
        .A ( B ),
        // Outputs
        .Y ( Y_net_1 ) 
        );

//--------INV
INV INV_0(
        // Inputs
        .A ( cyq_ori_c_0_Y3to3 ),
        // Outputs
        .Y ( INV_0_Y ) 
        );

//--------INV
INV INV_1(
        // Inputs
        .A ( cyq_ori_c_1_Y3to3 ),
        // Outputs
        .Y ( INV_1_Y ) 
        );


endmodule
