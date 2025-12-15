`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4
// File used only for Simulation


module cyq_SSD1(
       Aclr,
       Clk,
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
input  Aclr;
input  Clk;
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

    wire \Q_net_0[0] , un8_Y_1_0, un8_Y_2_0, un8_Y_3_0, Aclr_c, Clk_c, 
        f_c, g_c, f_c_i, Aclr_c_i, \Q_net_0_i[0] , \counter_0/INV_1_Y , 
        \counter_0/INV_0_Y , \f_pad/U0/NET1 , \f_pad/U0/NET2 , 
        \COM_2_pad/U0/NET1 , \COM_2_pad/U0/NET2 , \COM_4_pad/U0/NET1 , 
        \COM_4_pad/U0/NET2 , \Aclr_pad/U0/NET1 , \Clk_pad/U0/NET1 , 
        \a_pad/U0/NET1 , \a_pad/U0/NET2 , \c_pad/U0/NET1 , 
        \c_pad/U0/NET2 , \b_pad/U0/NET1 , \b_pad/U0/NET2 , 
        \COM_3_pad/U0/NET1 , \COM_3_pad/U0/NET2 , \d_pad/U0/NET1 , 
        \d_pad/U0/NET2 , \COM_1_pad/U0/NET1 , \COM_1_pad/U0/NET2 , 
        \g_pad/U0/NET1 , \g_pad/U0/NET2 , \e_pad/U0/NET1 , 
        \e_pad/U0/NET2 , VCC, \counter_0/DFN1E1C1_NU_1/Y , AFLSDF_VCC, 
        AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    OR2A \cyq_74HC138_0/un8_Y_2_0  (.A(g_c), .B(\Q_net_0[0] ), .Y(
        un8_Y_2_0));
    IOPAD_TRI \COM_4_pad/U0/U0  (.D(\COM_4_pad/U0/NET1 ), .E(
        \COM_4_pad/U0/NET2 ), .PAD(COM_4));
    IOPAD_TRI \COM_2_pad/U0/U0  (.D(\COM_2_pad/U0/NET1 ), .E(
        \COM_2_pad/U0/NET2 ), .PAD(COM_2));
    IOTRI_OB_EB \a_pad/U0/U1  (.D(un8_Y_1_0), .E(VCC), .DOUT(
        \a_pad/U0/NET1 ), .EOUT(\a_pad/U0/NET2 ));
    IOPAD_TRI \COM_3_pad/U0/U0  (.D(\COM_3_pad/U0/NET1 ), .E(
        \COM_3_pad/U0/NET2 ), .PAD(COM_3));
    INV \counter_0/INV_0  (.A(g_c), .Y(\counter_0/INV_0_Y ));
    IOPAD_TRI \f_pad/U0/U0  (.D(\f_pad/U0/NET1 ), .E(\f_pad/U0/NET2 ), 
        .PAD(f));
    MX2 \counter_0/DFN1E1C1_NU_1/U0  (.A(g_c), .B(\counter_0/INV_0_Y ), 
        .S(\Q_net_0[0] ), .Y(\counter_0/DFN1E1C1_NU_1/Y ));
    IOTRI_OB_EB \COM_2_pad/U0/U1  (.D(un8_Y_1_0), .E(VCC), .DOUT(
        \COM_2_pad/U0/NET1 ), .EOUT(\COM_2_pad/U0/NET2 ));
    IOPAD_TRI \COM_1_pad/U0/U0  (.D(\COM_1_pad/U0/NET1 ), .E(
        \COM_1_pad/U0/NET2 ), .PAD(COM_1));
    IOPAD_TRI \a_pad/U0/U0  (.D(\a_pad/U0/NET1 ), .E(\a_pad/U0/NET2 ), 
        .PAD(a));
    IOTRI_OB_EB \g_pad/U0/U1  (.D(g_c), .E(VCC), .DOUT(\g_pad/U0/NET1 )
        , .EOUT(\g_pad/U0/NET2 ));
    IOTRI_OB_EB \f_pad/U0/U1  (.D(f_c), .E(VCC), .DOUT(\f_pad/U0/NET1 )
        , .EOUT(\f_pad/U0/NET2 ));
    IOPAD_TRI \g_pad/U0/U0  (.D(\g_pad/U0/NET1 ), .E(\g_pad/U0/NET2 ), 
        .PAD(g));
    IOTRI_OB_EB \COM_4_pad/U0/U1  (.D(un8_Y_3_0), .E(VCC), .DOUT(
        \COM_4_pad/U0/NET1 ), .EOUT(\COM_4_pad/U0/NET2 ));
    INV \counter_0/DFN1C1_NU_0_RNIB64D  (.A(\Q_net_0[0] ), .Y(
        \Q_net_0_i[0] ));
    IOIN_IB \Aclr_pad/U0/U1  (.YIN(\Aclr_pad/U0/NET1 ), .Y(Aclr_c));
    CLKIO \Clk_pad/U0/U1  (.A(\Clk_pad/U0/NET1 ), .Y(Clk_c));
    IOTRI_OB_EB \c_pad/U0/U1  (.D(un8_Y_2_0), .E(VCC), .DOUT(
        \c_pad/U0/NET1 ), .EOUT(\c_pad/U0/NET2 ));
    IOPAD_TRI \c_pad/U0/U0  (.D(\c_pad/U0/NET1 ), .E(\c_pad/U0/NET2 ), 
        .PAD(c));
    IOTRI_OB_EB \COM_3_pad/U0/U1  (.D(un8_Y_2_0), .E(VCC), .DOUT(
        \COM_3_pad/U0/NET1 ), .EOUT(\COM_3_pad/U0/NET2 ));
    IOPAD_TRI \e_pad/U0/U0  (.D(\e_pad/U0/NET1 ), .E(\e_pad/U0/NET2 ), 
        .PAD(e));
    IOPAD_IN \Clk_pad/U0/U0  (.PAD(Clk), .Y(\Clk_pad/U0/NET1 ));
    INV \cyq_74HC138_0/f_c_i  (.A(f_c), .Y(f_c_i));
    IOTRI_OB_EB \e_pad/U0/U1  (.D(\Q_net_0_i[0] ), .E(VCC), .DOUT(
        \e_pad/U0/NET1 ), .EOUT(\e_pad/U0/NET2 ));
    OR2B \cyq_74HC138_0/un8_Y_3_0  (.A(g_c), .B(\Q_net_0[0] ), .Y(
        un8_Y_3_0));
    IOPAD_TRI \b_pad/U0/U0  (.D(\b_pad/U0/NET1 ), .E(\b_pad/U0/NET2 ), 
        .PAD(b));
    INV Aclr_pad_RNIMJ6D (.A(Aclr_c), .Y(Aclr_c_i));
    INV \counter_0/INV_1  (.A(\Q_net_0[0] ), .Y(\counter_0/INV_1_Y ));
    DFN1C1 \counter_0/DFN1C1_NU_0  (.D(\counter_0/INV_1_Y ), .CLK(
        Clk_c), .CLR(Aclr_c_i), .Q(\Q_net_0[0] ));
    IOTRI_OB_EB \COM_1_pad/U0/U1  (.D(f_c_i), .E(VCC), .DOUT(
        \COM_1_pad/U0/NET1 ), .EOUT(\COM_1_pad/U0/NET2 ));
    IOTRI_OB_EB \b_pad/U0/U1  (.D(VCC), .E(VCC), .DOUT(\b_pad/U0/NET1 )
        , .EOUT(\b_pad/U0/NET2 ));
    NOR2 \cyq_74HC138_0/un8_Y_0  (.A(g_c), .B(\Q_net_0[0] ), .Y(f_c));
    IOPAD_IN \Aclr_pad/U0/U0  (.PAD(Aclr), .Y(\Aclr_pad/U0/NET1 ));
    DFN1C1 \counter_0/DFN1E1C1_NU_1/U1  (.D(
        \counter_0/DFN1E1C1_NU_1/Y ), .CLK(Clk_c), .CLR(Aclr_c_i), .Q(
        g_c));
    IOPAD_TRI \d_pad/U0/U0  (.D(\d_pad/U0/NET1 ), .E(\d_pad/U0/NET2 ), 
        .PAD(d));
    IOTRI_OB_EB \d_pad/U0/U1  (.D(un8_Y_1_0), .E(VCC), .DOUT(
        \d_pad/U0/NET1 ), .EOUT(\d_pad/U0/NET2 ));
    OR2A \cyq_74HC138_0/un8_Y_1_0  (.A(\Q_net_0[0] ), .B(g_c), .Y(
        un8_Y_1_0));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
