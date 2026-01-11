// lzy_comb.v
module lzy_cp(A, B, C, Y);
    input A, B, C;
    output Y;
    
    assign Y = (A && B) || (B && C) || (A && C);
endmodule


module lzy_jtd(R, Y, G, Z);
    input R, Y, G;
    output Z;

    assign Z = (~(R || Y || G)) || (R && Y) || (R && G) || (Y && G);
endmodule

module lzy_74HC148(EI, I, A, GS, EO);
    input EI;
    input [7:0]I;
    output reg [2:0]A;
    output reg GS, EO;
    integer j;
    always @ (I or EI) begin
            if (EI) begin 
                A = 7; EO = 1; GS = 1;
            end
            else if (I == 8'b11111111) begin
                A = 7; EO = 0; GS = 1;
            end
            else
                for (j = 0; j < 8; j = j + 1) begin 
                    if(~I[j]) begin
                        A = ~j; EO = 1; GS = 0;
                    end
                end
         end
endmodule 

module lzy_74HC138(E1, E2, E3, A, Y);
    input E1, E2, E3;
    input [2:0]A;
    output reg [7:0]Y;
    always @* 
        begin
        Y = 8'b1111_1111;
        if ({E1, E2, E3} == 3'b001)
           Y[A] = 0;
        end
endmodule

module lzy_74HC153(E, S, I, Y);
    input E;
    input [1:0]S;
    input [3:0]I;
    output reg Y;
    always @*
        if(E) Y = 0;
        else Y = I[S];
endmodule

module lzy_74HC85(A, B, IG, IE, IS, QG, QE ,QS);
    input [3:0]A, B;
    input IG, IE, IS;
    output reg QG, QE, QS;
    always @*
        if(A > B) {QG, QE, QS} = 3'b100;
        else if(A < B) {QG, QE, QS} = 3'b001;
        else if(IE) {QG, QE, QS} = 3'b010;
        else
            case({IG, IS})
            2'b00: {QG, QE, QS} = 3'b101;
            2'b01: {QG, QE, QS} = 3'b001;
            2'b10: {QG, QE, QS} = 3'b100;
            2'b11: {QG, QE, QS} = 3'b000;
            default: {QG, QE, QS} = 3'bxxx;
            endcase
endmodule

module lzy_74HC283(A, B, Cin, Cout, S);
    input [3:0]A, B;
    input Cin;
    output [3:0]S;
    output Cout;
    assign {Cout,S} = A + B + Cin;
endmodule

module lzy_74HC4511(LE,BI,LT,A,Y);
    input LE,BI,LT;
    input [3:0]A;
    output [7:0]Y;
    reg [7:0]S;
    assign Y=S;
    always @(LE or BI or LT or A)
        begin
        if(!LT) S=8'b1111_1111;
        else if(!BI) S=8'b0000_0000;
        else if(LE) S=S;
        else
            case(A)
                4'd0:S=8'b0011_1111;
                4'd1:S=8'b0000_0110;
                4'd2:S=8'b0101_1011;
                4'd3:S=8'b0100_1111;
                4'd4:S=8'b0110_0110;
                4'd5:S=8'b0110_1101;
                4'd6:S=8'b0111_1101;
                4'd7:S=8'b0000_0111;
                4'd8:S=8'b0111_1111;
                4'd9:S=8'b0110_1111;
                4'd10:S=8'b0111_0111;
                4'd11:S=8'b0111_1100;
                4'd12:S=8'b0011_1001;
                4'd13:S=8'b0101_1110;
                4'd14:S=8'b0111_1001;
                4'd15:S=8'b0111_0001;
                default:;
            endcase
        end
endmodule

module lzy_ori_c(A, Y);
    input [3:0]A;
    output reg [3:0]Y;
    always @(A)
        if(A[3])
            Y = 4'b1111 - A[2:0] + 1;
        else
            Y = A;
endmodule