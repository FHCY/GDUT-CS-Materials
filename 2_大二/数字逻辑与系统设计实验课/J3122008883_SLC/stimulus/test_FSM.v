`timescale 10ns/1ns
module test_cyq_fsm_011;
    reg Rst,Clk,X;
    wire Y;

    cyq_fsm_011 u0(Rst,Clk,X,Y);

    always 
        #10 Clk=~Clk;

    initial
        begin
            Clk=0;Rst=0;
        #300 Rst=1;
        end

    initial
        begin
            X=0;
            #5 ;
            repeat(50)
            #30 X=$random;
        end
endmodule


module test_cyq_VM;
    reg Reset, Clk;
    reg [1:0]D_in;
    wire D_out, D_C;
    
    cyq_VM u0(Reset, Clk, D_in, D_out, D_C);
    
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

            #25     D_in=2'b10;
        end
endmodule