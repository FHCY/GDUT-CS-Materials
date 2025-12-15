// test_comb.v
`timescale 10ns/1ns

//test_cyq_cp
module test_cyq_cp;
    reg a,b,c;
    wire y;

    cyq_cp u0(a,b,c,y);
        
    initial
        begin
            a=0;b=0;c=0;
            #10 c=1;
            #10 b=1;
            #10 c=0;
            #10 a=1;
            #10 c=1;
            #10 b=0;
            #10 c=0; 
        end
    initial
        $monitor("time=%t,y=%b,a=%b,b=%b,c=%b",$time,y,a,b,c);
endmodule

//test_cyq_jtd
module test_cyq_jtd;
    reg r,g,y;
    wire z;

    cyq_jtd u1(z,r,y,g);

    initial
        begin
            {r,g,y}=3'b000;
            repeat(7)
                #10 {r,g,y}={r,g,y}+1;
        end
    initial
        $monitor("time=%t,z=%b,r=%b,y=%b,g=%b",$time,z,r,y,g); 
endmodule

//test_cyq_74HC148
module test_cyq_74HC148;
     reg EI;
     reg [0:7]I;
     wire [2:0]A;
     wire GS,EO;
     integer k=7;

     cyq_74HC148 u2(EI,I,A,GS,EO);
     initial
        begin
            EI=1;
            #10 I=8'b1111_1111; EI=0;
            #10 I=8'bx; I[7]=0;
            for(k=6;k>=0;k=k-1)
                begin
                    #10 I[k]=0;I[k+1]=1;
                end
        end
     initial
        $monitor("time=%t,EI=%b,I[0]=%b,I[1]=%b,I[2]=%b,I[3]=%b,I[4]=%b,I[5]=%b,I[6]=%b,I[7]=%b,A[2]=%b,A[1]=%b,A[0]=%b,GS=%b,EO=%b",$time,EI,I[0],I[1],I[2],I[3],I[4],I[5],I[6],I[7],A[2],A[1],A[0],GS,EO); 
endmodule

//test_cyq_74HC138
module test_cyq_74HC138;
    reg [1:3]E;
    reg [2:0]A;
    wire [7:0]Y;
    
    cyq_74HC138 u3(E,A,Y);

    initial
        begin
            E[1]=1;
            #10 E[1]=1'bx; E[2]=1;    E[3]=1'bx;
            #10 E[1]=1'bx; E[2]=1'bx; E[3]=0;
            #10 E[1]=0;    E[2]=0;    E[3]=1;    A=3'b000;
            repeat(8)
                #10 A=A+1;
        end
    initial
        $monitor("time=%t,E[1]=%b,E[2]=%b,E[3]=%b,A[2]=%b,A[1]=%b,A[0]=%b,Y[7]=%b,Y[6]=%b,Y[5]=%b,Y[4]=%b,Y[3]=%b,Y[2]=%b,Y[1]=%b,Y[0]=%b",$time,E[1],E[2],E[3],A[2],A[1],A[0],Y[7],Y[6],Y[5],Y[4],Y[3],Y[2],Y[1],Y[0]);
endmodule

//test_cyq_74HC153
module test_cyq_74HC153;
    reg E;
    reg [1:0]S;
    reg [0:3]I;
    wire Y;
    integer k;
    
    cyq_74HC153 u4(S,I,E,Y);

    initial
        begin
            E=1;
            for(k=0; k<4; k=k+1)
                begin
                    #10 E=0; S=k; I[S]=0; I=4'bx; I[S]=0;
                    #10 I[S]=1;
                end
        end
    initial
        $monitor("time=%t,E=%b,S[1]=%b,S[0]=%b,I[0]=%b,I[1]=%b,I[2]=%b,I[3]=%b,Y=%b",$time,E,S[1],S[0],I[0],I[1],I[2],I[3],Y);
endmodule

//test_cyq_74HC85
module test_cyq_74HC85;
    reg [3:0]A,B;
    reg [2:0]I;
    wire [2:0]Q;

    cyq_74HC85 u5(A,B,I,Q);

    initial
        begin
            {I,A,B}=0;
            repeat(5)
                #10 {I,A,B}=$random;
            #10 A=B;
            repeat(5)
                #10 I=$random;
        end
endmodule

//test_cyq_74HC283
module test_cyq_74HC283;
    reg  Cin;
    reg  [3:0]A,B;
    wire Cout;
    wire [3:0]S;

    cyq_74HC283 u6(Cin,A,B,Cout,S);

    initial
        begin
            {Cin,A,B}=0;
            repeat (10)
                #10 {Cin,A,B}=$random;
        end
endmodule

//test_cyq_74HC4511
module test_cyq_74HC4511;
    reg LE,BI,LT;
    reg [3:0]D;
    wire[6:0]Y;

    cyq_74HC4511 u7(LE,BI,LT,D,Y);

    initial
        begin
            LT=0;
            #10 {LT,BI}=2'b10;
            #10 {LT,BI,LE}=3'b110;
        end

    initial
        begin
            D=$random;
            #10 D=$random;
            #10 D=4'b0000;
            repeat(15)
                #10 D=D+1;
            #10 {LT,BI,LE}=3'b111;
        end
endmodule

//test_cyq_ori_c
module test_cyq_ori_c;
    reg [3:0]A;
    wire [3:0]Y;
    
    cyq_ori_c u0(A,Y);
    initial
        begin
            A=0;
            repeat(15)
                #10 A=A+1;
        end
endmodule

//test_cyq_SD1
module test_cyq_SD1;
    reg [3:0]A,B;
    wire [2:0]Y;

    cyq_SD1 u0(.A(A),.B(B),.Q(Q));
    initial
        begin
            {A,B}=0;
            repeat(20)
                #10 {A,B}=$random;
        end
endmodule

//test_cyq_sd2
module test_cyq_SD2;
    reg EI;
    reg [0:7]I;
    wire [6:0]Y;
    
    cyq_SD2 u0(.EI(EI),.I(I),.Y(Y));
    initial
        begin
            EI=1;
            #20 EI=0;
        end
    initial
        begin
            I=$random;
            #10 I=$random;
            #10 I=8'b1111_1111;
            repeat(8)
                #10 I=I>>1;
            repeat(8)
                #10 I=$random;
        end
endmodule