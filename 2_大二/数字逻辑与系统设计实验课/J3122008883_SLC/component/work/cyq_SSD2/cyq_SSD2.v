//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Mon Dec 11 22:59:24 2023
// Version: v11.9 11.9.0.4
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// cyq_SSD2
module cyq_SSD2(
    // Inputs
    Aclr,
    Clk,
    // Outputs
    COM_1,
    COM_2,
    COM_3,
    COM_4,
    a,
    b,
    c,
    d,
    e,
    f,
    g
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  Aclr;
input  Clk;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output COM_1;
output COM_2;
output COM_3;
output COM_4;
output a;
output b;
output c;
output d;
output e;
output f;
output g;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [6:6] a_net_0;
wire         Aclr;
wire   [5:5] b_net_0;
wire   [4:4] c_net_0;
wire         Clk;
wire   [0:0] COM_1_net_0;
wire   [1:1] COM_2_net_0;
wire   [2:2] COM_3_net_0;
wire   [3:3] COM_4_net_0;
wire   [0:0] counter_0_Q0to0;
wire   [1:1] counter_0_Q1to1;
wire   [3:3] d_net_0;
wire   [2:2] e_net_0;
wire   [1:1] f_net_0;
wire   [0:0] g_net_0;
wire   [0:0] register_width4_0_Y0to0;
wire   [1:1] register_width4_0_Y1to1;
wire   [2:2] register_width4_0_Y2to2;
wire   [3:3] register_width4_0_Y3to3;
wire         COM_1_net_1;
wire         COM_2_net_1;
wire         COM_3_net_1;
wire         COM_4_net_1;
wire         a_net_1;
wire         b_net_1;
wire         c_net_1;
wire         d_net_1;
wire         e_net_1;
wire         f_net_1;
wire         g_net_1;
wire   [4:4] Y_slice_0;
wire   [5:5] Y_slice_1;
wire   [6:6] Y_slice_2;
wire   [7:7] Y_slice_3;
wire   [1:0] Q_net_0;
wire   [1:3] E_net_0;
wire   [2:0] A_net_0;
wire   [7:0] Y_net_0;
wire   [3:0] D_net_0;
wire   [6:0] Y_net_1;
wire   [1:0] I_net_0;
wire   [3:0] Y_net_2;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire         GND_net;
wire         VCC_net;
//--------------------------------------------------------------------
// Inverted Nets
//--------------------------------------------------------------------
wire         Aclr_IN_POST_INV0_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net    = 1'b0;
assign VCC_net    = 1'b1;
//--------------------------------------------------------------------
// Inversions
//--------------------------------------------------------------------
assign Aclr_IN_POST_INV0_0 = ~ Aclr;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign COM_1_net_1 = COM_1_net_0[0];
assign COM_1       = COM_1_net_1;
assign COM_2_net_1 = COM_2_net_0[1];
assign COM_2       = COM_2_net_1;
assign COM_3_net_1 = COM_3_net_0[2];
assign COM_3       = COM_3_net_1;
assign COM_4_net_1 = COM_4_net_0[3];
assign COM_4       = COM_4_net_1;
assign a_net_1     = a_net_0[6];
assign a           = a_net_1;
assign b_net_1     = b_net_0[5];
assign b           = b_net_1;
assign c_net_1     = c_net_0[4];
assign c           = c_net_1;
assign d_net_1     = d_net_0[3];
assign d           = d_net_1;
assign e_net_1     = e_net_0[2];
assign e           = e_net_1;
assign f_net_1     = f_net_0[1];
assign f           = f_net_1;
assign g_net_1     = g_net_0[0];
assign g           = g_net_1;
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign a_net_0[6]                 = Y_net_1[6:6];
assign b_net_0[5]                 = Y_net_1[5:5];
assign c_net_0[4]                 = Y_net_1[4:4];
assign COM_1_net_0[0]             = Y_net_0[0:0];
assign COM_2_net_0[1]             = Y_net_0[1:1];
assign COM_3_net_0[2]             = Y_net_0[2:2];
assign COM_4_net_0[3]             = Y_net_0[3:3];
assign counter_0_Q0to0[0]         = Q_net_0[0:0];
assign counter_0_Q1to1[1]         = Q_net_0[1:1];
assign d_net_0[3]                 = Y_net_1[3:3];
assign e_net_0[2]                 = Y_net_1[2:2];
assign f_net_0[1]                 = Y_net_1[1:1];
assign g_net_0[0]                 = Y_net_1[0:0];
assign register_width4_0_Y0to0[0] = Y_net_2[0:0];
assign register_width4_0_Y1to1[1] = Y_net_2[1:1];
assign register_width4_0_Y2to2[2] = Y_net_2[2:2];
assign register_width4_0_Y3to3[3] = Y_net_2[3:3];
assign Y_slice_0[4]               = Y_net_0[4:4];
assign Y_slice_1[5]               = Y_net_0[5:5];
assign Y_slice_2[6]               = Y_net_0[6:6];
assign Y_slice_3[7]               = Y_net_0[7:7];
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign E_net_0 = { 1'b0 , 1'b0 , 1'b1 };
assign A_net_0 = { 1'b0 , counter_0_Q1to1[1] , counter_0_Q0to0[0] };
assign D_net_0 = { register_width4_0_Y3to3[3] , register_width4_0_Y2to2[2] , register_width4_0_Y1to1[1] , register_width4_0_Y0to0[0] };
assign I_net_0 = { counter_0_Q1to1[1] , counter_0_Q0to0[0] };
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------counter
counter counter_0(
        // Inputs
        .Aclr  ( Aclr_IN_POST_INV0_0 ),
        .Clock ( Clk ),
        // Outputs
        .Q     ( Q_net_0 ) 
        );

//--------cyq_74HC138
cyq_74HC138 cyq_74HC138_0(
        // Inputs
        .E ( E_net_0 ),
        .A ( A_net_0 ),
        // Outputs
        .Y ( Y_net_0 ) 
        );

//--------cyq_74HC4511
cyq_74HC4511 cyq_74HC4511_0(
        // Inputs
        .LE ( GND_net ),
        .BI ( VCC_net ),
        .LT ( VCC_net ),
        .D  ( D_net_0 ),
        // Outputs
        .Y  ( Y_net_1 ) 
        );

//--------register_width4
register_width4 register_width4_0(
        // Inputs
        .I ( I_net_0 ),
        // Outputs
        .Y ( Y_net_2 ) 
        );


endmodule
