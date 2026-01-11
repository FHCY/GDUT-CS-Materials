//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue Dec 17 17:36:41 2024
// Version: v11.9 11.9.0.4
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// lzy_SSD2
module lzy_SSD2(
    // Inputs
    A,
    Aclr,
    B,
    C,
    Clk,
    D,
    // Outputs
    DG,
    seg
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [3:0] A;
input        Aclr;
input  [3:0] B;
input  [3:0] C;
input        Clk;
input  [3:0] D;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [1:4] DG;
output [7:0] seg;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [0:0] _counter_0_Q0to0;
wire   [1:1] _counter_0_Q1to1;
wire   [3:0] A;
wire         Aclr;
wire   [3:0] B;
wire   [3:0] C;
wire         Clk;
wire   [3:0] D;
wire   [0:0] DG_net_0;
wire   [1:1] DG_0;
wire   [2:2] DG_1;
wire   [3:3] DG_2;
wire   [3:0] multiplexor_0_Result;
wire   [7:0] seg_net_0;
wire   [7:0] seg_net_1;
wire   [1:1] DG_net_1;
wire   [2:2] DG_0_net_0;
wire   [3:3] DG_1_net_0;
wire   [4:4] DG_2_net_0;
wire   [4:4] Y_slice_0;
wire   [5:5] Y_slice_1;
wire   [6:6] Y_slice_2;
wire   [7:7] Y_slice_3;
wire   [1:0] Q_net_0;
wire   [2:0] A_net_0;
wire   [7:0] Y_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire         GND_net;
wire         VCC_net;
//--------------------------------------------------------------------
// Inverted Nets
//--------------------------------------------------------------------
wire   [0:0] Y_OUT_PRE_INV0_0;
wire   [1:1] Y_OUT_PRE_INV1_0;
wire   [2:2] Y_OUT_PRE_INV2_0;
wire   [3:3] Y_OUT_PRE_INV3_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net    = 1'b0;
assign VCC_net    = 1'b1;
//--------------------------------------------------------------------
// Inversions
//--------------------------------------------------------------------
assign DG_net_0[0] = ~ Y_OUT_PRE_INV0_0[0];
assign DG_0[1]     = ~ Y_OUT_PRE_INV1_0[1];
assign DG_1[2]     = ~ Y_OUT_PRE_INV2_0[2];
assign DG_2[3]     = ~ Y_OUT_PRE_INV3_0[3];
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign seg_net_1     = seg_net_0;
assign seg[7:0]      = seg_net_1;
assign DG_net_1[1]   = DG_net_0[0];
assign DG[1:1]       = DG_net_1[1];
assign DG_0_net_0[2] = DG_0[1];
assign DG[2:2]       = DG_0_net_0[2];
assign DG_1_net_0[3] = DG_1[2];
assign DG[3:3]       = DG_1_net_0[3];
assign DG_2_net_0[4] = DG_2[3];
assign DG[4:4]       = DG_2_net_0[4];
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign _counter_0_Q0to0[0] = Q_net_0[0:0];
assign _counter_0_Q1to1[1] = Q_net_0[1:1];
assign Y_slice_0[4]        = Y_net_0[4:4];
assign Y_slice_1[5]        = Y_net_0[5:5];
assign Y_slice_2[6]        = Y_net_0[6:6];
assign Y_slice_3[7]        = Y_net_0[7:7];
assign Y_OUT_PRE_INV0_0[0] = Y_net_0[0:0];
assign Y_OUT_PRE_INV1_0[1] = Y_net_0[1:1];
assign Y_OUT_PRE_INV2_0[2] = Y_net_0[2:2];
assign Y_OUT_PRE_INV3_0[3] = Y_net_0[3:3];
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign A_net_0 = { 1'b0 , _counter_0_Q1to1[1] , _counter_0_Q0to0[0] };
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------_counter
_counter _counter_0(
        // Inputs
        .Aclr ( Aclr ),
        .Clk  ( Clk ),
        // Outputs
        .Q    ( Q_net_0 ) 
        );

//--------lzy_74HC138
lzy_74HC138 lzy_74HC138_0(
        // Inputs
        .E1 ( GND_net ),
        .E2 ( GND_net ),
        .E3 ( VCC_net ),
        .A  ( A_net_0 ),
        // Outputs
        .Y  ( Y_net_0 ) 
        );

//--------lzy_74HC4511
lzy_74HC4511 lzy_74HC4511_0(
        // Inputs
        .LE ( GND_net ),
        .BI ( VCC_net ),
        .LT ( VCC_net ),
        .A  ( multiplexor_0_Result ),
        // Outputs
        .Y  ( seg_net_0 ) 
        );

//--------multiplexor
multiplexor multiplexor_0(
        // Inputs
        .Data0_port ( A ),
        .Data1_port ( B ),
        .Data2_port ( C ),
        .Data3_port ( D ),
        .Sel0       ( _counter_0_Q0to0 ),
        .Sel1       ( _counter_0_Q1to1 ),
        // Outputs
        .Result     ( multiplexor_0_Result ) 
        );


endmodule
