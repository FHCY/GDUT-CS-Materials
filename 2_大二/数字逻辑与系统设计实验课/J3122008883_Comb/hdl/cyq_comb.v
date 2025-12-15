//cyq_comb.v

//cyq_cp(a,b,c,y)
module cyq_cp(a,b,c,y);
    input a,b,c;
    output y;
    assign y=a&b|b&c|a&c;
endmodule

//cyq_jtd(z,r,y,g)
module cyq_jtd(z,r,y,g);
    input r,y,g;
    output z;
    assign z=(~(r|y|g)|r&y|r&g|y&g);
endmodule

//cyq_74HC148: 8-3 Priority Encoder
module cyq_74HC148(EI,I,A,GS,EO);
    input EI;
    input [0:7]I;
    output reg [2:0]A;
    output reg GS,EO;
    integer k;

    always @*
        if(EI) {A,GS,EO}=5'b11111;
        else if(I==8'b1111_1111) {A,GS,EO}=5'b11110;
        else
             for(k=0;k<8;k=k+1)
                if(!I[k])
                    begin
                        A=~k; GS=0; EO=1;
                    end
endmodule

//cyq_74HC138: 3-8 Decoder
module cyq_74HC138(E,A,Y);
    input [1:3]E;
    input [2:0]A;
    output reg [7:0]Y;
    
    always @*
        if(E[1]) Y=8'b1111_1111;
        else if(E[2]) Y=8'b1111_1111;
        else if(E[3]==0) Y=8'b1111_1111;
        else if(E[1]==0 & E[2]==0 & E[3]==1)
            begin
                Y=8'b1111_1111;
                Y[A]=0;
            end
endmodule

//cyq_74HC153: Multiplexer
module cyq_74HC153(S,I,E,Y);
    input [1:0]S;
    input [0:3]I;
    input  E;
    output reg Y;

    always @*
        if(E) Y=0;
        else if(!E) Y=I[S];
endmodule

//cyq_74HC85: Comparator
module cyq_74HC85(A,B,I,Q);
    input [3:0]A, B;
    input [2:0]I;
    output reg [2:0]Q;

    always @*
        if(A>B)         Q=3'b100;
        else if(A<B)    Q=3'b001;
        else if(I[1])   Q=3'b010;
        else 
            case({I[2],I[0]})
                2'b00:  Q=3'b101;
                2'b01:  Q=3'b001;
                2'b10:  Q=3'b100;
                2'b11:  Q=3'b000;
                default:Q=3'bxxx;
            endcase
endmodule

//cyq_74HC283: 4-bit Carry Look-ahead Adder
module cyq_74HC283(Cin,A,B,Cout,S);
        input Cin;
        input [3:0]A,B;
        output Cout;
        output [3:0]S;
        assign {Cout,S}=A+B+Cin;
endmodule

//cyq_74HC4511 LED Decoder
module cyq_74HC4511(LE,BI,LT,D,Y);
    input LE,BI,LT;
    input [3:0]D;
    output reg [6:0]Y;

    always @*
        if(!LT) Y=7'b111_1111;
        else if (!BI) Y=0;
        else if (!LE) 
            case (D)
                0:      Y=7'b111_1110;
                1:      Y=7'b011_0000;
                2:      Y=7'b110_1101;
                3:      Y=7'b111_1001;
                4:      Y=7'b011_0011;
                5:      Y=7'b101_1011;
                6:      Y=7'b101_1111;
                7:      Y=7'b111_0000;
                8:      Y=7'b111_1111;
                9:      Y=7'b111_1011;
                default:Y=7'b000_0000;
            endcase
endmodule

//cyq_ori_c
module cyq_ori_c(A,Y);
    input [3:0]A;
    output reg [3:0]Y;

    always @*
        begin
            if(A[3])
                begin
                    if(A[2:0]==3'b000) Y=0;
                        else Y={1'b1, ~A[2:0]+1'b1};
                end
            else Y=A;
        end
endmodule