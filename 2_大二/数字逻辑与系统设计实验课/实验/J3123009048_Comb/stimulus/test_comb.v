// test_comb.v
`timescale 10ns/1ns
module test_lzy_cp;
    reg A, B, C;
    wire Y;
    lzy_cp u0(A, B, C, Y);

     initial
         begin
         A = 0;B = 0;C = 0;
         #10 C = 1;
         #10 B = 1;
         #10 C = 0;
         #10 A = 1;
         #10 C = 1;
         #10 B = 0;
         #10 C = 0;
         end
endmodule

module test_lzy_jtd;
    reg A, B, C;
    wire Y;
    lzy_jtd u1(A, B, C, Y);

     initial
         begin
         A = 0;B = 0;C = 0;
         #10 C = 1;
         #10 B = 1;
         #10 C = 0;
         #10 A = 1;
         #10 C = 1;
         #10 B = 0;
         #10 C = 0;
         end
endmodule

module test_lzy_74HC148;
    reg EI;
    reg [7:0]I;
    wire [2:0]A;
    wire GS, EO;
    lzy_74HC148 u2(EI, I, A, GS, EO);
    
    initial
        begin
        EI = 1;
        #10 EI = 0;
        repeat(40)
        #10 I = $random % 256;
    end
endmodule

module test_lzy_74HC138;
    reg E1, E2, E3;
    reg [2:0]A;
    wire [7:0]Y;
    lzy_74HC138  u3(E1, E2, E3, A, Y);
    
    initial
        begin
        E1 = 1;
        #10 E2 = 1;
        #10 E3 = 0;
        #10 {E1, E2, E3} = 3'b001;
        repeat(40)
        #10 A = $random % 8;
    end
endmodule

module test_lzy_74HC153;
    reg E;
    reg [1:0]S;
    reg [3:0]I;
    wire Y;
    lzy_74HC153 u4(E, S, I, Y);

    initial
        begin
        E = 1;
        #10 E = 0;
        repeat(40) begin
        #10 S = $random % 4;
        #10 I = $random % 16;
        end
    end
endmodule

module test_lzy_74HC4511;
    reg LE,BI,LT;
    reg [3:0]A;
    wire [7:0]Y;
    reg [7:0]S;
    lzy_74HC4511 u5(LE,BI,LT,A,Y);
    initial
        begin
            {LE,BI,LT}=3'b011;
            repeat(20)
            begin #10 A=$random;end
        end
        initial
        $monitor("time=%t,LE=%b,BI=%b,LT=%b,A=%b,Y=%b",$time,LE,BI,LT,A,Y);    
endmodule

module test_lzy_74HC85;
    reg [3:0]A,B;
    reg IG,IE,IS;
    wire QG,QE,QS;
    lzy_74HC85 u6(A,B,IG,IE,IS,QG,QE,QS);
    initial
        begin
            repeat(20)
            begin #10 A=$random;B=$random;IG=$random;IE=$random;IS=$random;end
        end
endmodule 
 

module test_lzy_74HC283;
    reg [3:0]A,B;
    reg Cin;
    wire [3:0]S;
    wire Cout;
    lzy_74HC283 u7(A,B,Cin,Cout,S);
    initial
        begin
            repeat(20)
            begin #10 A=$random;B=$random;Cin=$random;end
        end
endmodule 

module test_lzy_SD1;
    reg [3:0]A, B;
    wire QG, QE, QS;
    lzy_SD1 u8(.A(A), .B(B), .QG(QG), .QE(QE), . QS(QS));
    initial
        begin
        A = 4'b0000;  B = 4'b0000;
        repeat(40) begin
        #10 A = $random % 16;
        #10 B = $random % 16;
        end
        end
endmodule

module test_lzy_ori_c;
    reg [3:0]A;
    wire [3:0]B;
    lzy_ori_c u9(A, B);
    
    initial
        begin
        A = 4'b0000;
        repeat(40) begin
        #10 A = $random % 16;
        end
        end
endmodule

module test_lzy_SD2;
    reg EI;
    reg [7:0]I;
    wire [7:0]Y;
    lzy_SD2 u10(.EI(EI), .I(I), .Y(Y));
    initial
        begin
        EI = 1;
        #10 EI = 0;
        end
    initial
        repeat(40) begin
        #10 I = $random % 256;
        end
endmodule