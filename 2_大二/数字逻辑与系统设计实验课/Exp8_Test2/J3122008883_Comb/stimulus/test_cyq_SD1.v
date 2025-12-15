`timescale 1ns/1ns

module test_cyq_SD1;
    
    reg A,B,C;
    wire Y;
    
    initial
        begin
            {A,B,C}=3'b000;
            #20 {A,B,C}=3'b001;
            #20 {A,B,C}=3'b010;
            #20 {A,B,C}=3'b011;
            #20 {A,B,C}=3'b100;
            #20 {A,B,C}=3'b101;
            #20 {A,B,C}=3'b110;
            #20 {A,B,C}=3'b111;
        end

    cyq_SD1 u0(.A(A),.B(B),.C(C),.Y(Y));

endmodule

