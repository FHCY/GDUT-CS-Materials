`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


module counter(
       Aclr,
       Clock,
       Q
    );
input  Aclr;
input  Clock;
output [1:0] Q;

    wire NU_0_1, INV_1_Y, INV_0_Y;
    
    DFN1E1C1 DFN1E1C1_NU_1 (.D(INV_0_Y), .CLK(Clock), .CLR(Aclr), .E(
        Q[0]), .Q(Q[1]));
    INV INV_0 (.A(Q[1]), .Y(INV_0_Y));
    AND2 U_AND2_0_1 (.A(Q[0]), .B(Q[1]), .Y(NU_0_1));
    DFN1C1 DFN1C1_NU_0 (.D(INV_1_Y), .CLK(Clock), .CLR(Aclr), .Q(Q[0]));
    INV INV_1 (.A(Q[0]), .Y(INV_1_Y));
    
endmodule

// _Disclaimer: Please leave the following comments in the file, they are for internal purposes only._


// _GEN_File_Contents_

// Version:11.9.0.4
// ACTGENU_CALL:1
// BATCH:T
// FAM:PA3LC
// OUTFORMAT:Verilog
// LPMTYPE:LPM_COUNTER
// LPM_HINT:COMPCNT
// INSERT_PAD:NO
// INSERT_IOREG:NO
// GEN_BHV_VHDL_VAL:F
// GEN_BHV_VERILOG_VAL:F
// MGNTIMER:F
// MGNCMPL:T
// DESDIR:D:/Study/LiberoProjects/J3122008883_SLC/smartgen\counter
// GEN_BEHV_MODULE:F
// SMARTGEN_DIE:IS2X2M1
// SMARTGEN_PACKAGE:vq100
// AGENIII_IS_SUBPROJECT_LIBERO:T
// WIDTH:2
// DIRECTION:UP
// CLR_POLARITY:1
// LD_POLARITY:2
// EN_POLARITY:2
// UPDOWN_POLARITY:2
// CLK_EDGE:RISE
// CLR_FANIN:MANUAL
// CLR_VAL:1
// CLK_FANIN:MANUAL
// CLK_VAL:1
// LD_FANIN:AUTO
// LD_VAL:12
// UPDOWN_FANIN:AUTO
// UPDOWN_VAL:12
// TCNT_POLARITY:2
// SET_POLARITY:2
// SET_FANIN:MANUAL
// SET_VAL:1

// _End_Comments_

