// lzy_74HC153.v
module lzy_74HC153(E, S, I, Y);
    input E;
    input [1:0]S;
    input [3:0]I;
    output reg Y;
    always @*
        if(E) Y = 0;
        else Y = I[S];
endmodule