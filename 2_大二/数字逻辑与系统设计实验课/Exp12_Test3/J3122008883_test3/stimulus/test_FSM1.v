`timescale 10ns/1ns

module test_cyq_74HC165();
    reg PL, CE, CP, Ds;
    reg [0:7]D;
    wire Y, Yn;

    cyq_74HC165 u0(PL, CE, CP, Ds, D, Y, Yn);
    
    initial
        begin
            CP=0;
            forever
                #10 CP=~CP;
        end
    
    initial
        begin
            PL=0;
            repeat(5)
                #15 D=$random;
            #80 PL=1; CE=0; Ds=0;
            #80 Ds=1;
            #80 CE=1;
        end
endmodule


module test_cyq_VM1();
    reg Reset, Clk;
    reg [1:0]D_in;
    wire D_out, D_C;

    cyq_VM1 u0(Reset, Clk, D_in, D_out, D_C);

    always
        #16 Clk=~Clk;

    initial
        begin
            Clk=0; Reset=0;
            #5  Reset=1;
            #25 Reset=0;
        end

    initial
        begin
                    D_in=0;
            #25     D_in=2'b01;
            #25     D_in=2'b00;

            #25     D_in=2'b11;
            #25     D_in=2'b00;      

            #75     D_in=2'b10;
            #25     D_in=2'b00;

            #125    D_in=2'b10;
            #25     D_in=2'b00;

            #100    D_in=2'b01;       
            #25     D_in=2'b00;

            #50     D_in=2'b01;
            #25     D_in=2'b00;

            #25     D_in=2'b01;
        end
endmodule