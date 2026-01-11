`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


module multiplexor(
       Data0_port,
       Data1_port,
       Data2_port,
       Data3_port,
       Sel0,
       Sel1,
       Result
    );
input  [3:0] Data0_port;
input  [3:0] Data1_port;
input  [3:0] Data2_port;
input  [3:0] Data3_port;
input  Sel0;
input  Sel1;
output [3:0] Result;

    wire \SelAux_0[0] , \SelAux_0[4] , MX2_4_Y, MX2_2_Y, MX2_0_Y, 
        MX2_3_Y, MX2_1_Y, MX2_5_Y, MX2_6_Y, MX2_7_Y;
    
    MX2 \MX2_Result[3]  (.A(MX2_4_Y), .B(MX2_2_Y), .S(Sel1), .Y(
        Result[3]));
    MX2 MX2_0 (.A(Data0_port[2]), .B(Data1_port[2]), .S(\SelAux_0[4] ), 
        .Y(MX2_0_Y));
    MX2 MX2_6 (.A(Data0_port[1]), .B(Data1_port[1]), .S(\SelAux_0[0] ), 
        .Y(MX2_6_Y));
    MX2 MX2_3 (.A(Data2_port[2]), .B(Data3_port[2]), .S(\SelAux_0[4] ), 
        .Y(MX2_3_Y));
    MX2 MX2_4 (.A(Data0_port[3]), .B(Data1_port[3]), .S(\SelAux_0[4] ), 
        .Y(MX2_4_Y));
    BUFF \BUFF_SelAux_0[4]  (.A(Sel0), .Y(\SelAux_0[4] ));
    BUFF \BUFF_SelAux_0[0]  (.A(Sel0), .Y(\SelAux_0[0] ));
    MX2 MX2_5 (.A(Data2_port[0]), .B(Data3_port[0]), .S(\SelAux_0[0] ), 
        .Y(MX2_5_Y));
    MX2 \MX2_Result[0]  (.A(MX2_1_Y), .B(MX2_5_Y), .S(Sel1), .Y(
        Result[0]));
    MX2 \MX2_Result[2]  (.A(MX2_0_Y), .B(MX2_3_Y), .S(Sel1), .Y(
        Result[2]));
    MX2 MX2_2 (.A(Data2_port[3]), .B(Data3_port[3]), .S(\SelAux_0[4] ), 
        .Y(MX2_2_Y));
    MX2 MX2_7 (.A(Data2_port[1]), .B(Data3_port[1]), .S(\SelAux_0[0] ), 
        .Y(MX2_7_Y));
    MX2 \MX2_Result[1]  (.A(MX2_6_Y), .B(MX2_7_Y), .S(Sel1), .Y(
        Result[1]));
    MX2 MX2_1 (.A(Data0_port[0]), .B(Data1_port[0]), .S(\SelAux_0[0] ), 
        .Y(MX2_1_Y));
    
endmodule

// _Disclaimer: Please leave the following comments in the file, they are for internal purposes only._


// _GEN_File_Contents_

// Version:11.9.0.4
// ACTGENU_CALL:1
// BATCH:T
// FAM:PA3LC
// OUTFORMAT:Verilog
// LPMTYPE:LPM_MUX
// LPM_HINT:None
// INSERT_PAD:NO
// INSERT_IOREG:NO
// GEN_BHV_VHDL_VAL:F
// GEN_BHV_VERILOG_VAL:F
// MGNTIMER:F
// MGNCMPL:T
// DESDIR:C:/Users/FHCY/Desktop/study/signal/J3123009048_SLC/smartgen\multiplexor
// GEN_BEHV_MODULE:F
// SMARTGEN_DIE:IS2X2M1
// SMARTGEN_PACKAGE:vq100
// AGENIII_IS_SUBPROJECT_LIBERO:T
// WIDTH:4
// SIZE:4
// SEL0_FANIN:AUTO
// SEL0_VAL:6
// SEL0_POLARITY:1
// SEL1_FANIN:AUTO
// SEL1_VAL:6
// SEL1_POLARITY:2
// SEL2_FANIN:AUTO
// SEL2_VAL:6
// SEL2_POLARITY:2
// SEL3_FANIN:AUTO
// SEL3_VAL:6
// SEL3_POLARITY:2
// SEL4_FANIN:AUTO
// SEL4_VAL:6
// SEL4_POLARITY:2

// _End_Comments_

