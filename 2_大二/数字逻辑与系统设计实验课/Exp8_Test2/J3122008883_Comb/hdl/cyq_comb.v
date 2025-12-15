module cyq_74HC145(Input,Output);

    input [3:0]Input;
    output [0:11]Output;
    reg [0:11]Output;

    always @*
        begin
            case(Input)
                0:      Output=12'b0111_1111_1111;
                1:      Output=12'b1011_1111_1111;
                2:      Output=12'b1101_1111_1111;
                3:      Output=12'b1110_1111_1111;
                4:      Output=12'b1111_0111_1111;
                5:      Output=12'b1111_1011_1111;
                6:      Output=12'b1111_1101_1111;
                7:      Output=12'b1111_1110_1111;
                8:      Output=12'b1111_1111_0111;
                9:      Output=12'b1111_1111_1011;
                10:     Output=12'b1111_1111_1101;
                11:     Output=12'b1111_1111_1110;
                default:Output=12'b1111_1111_1111;
            endcase
        end

endmodule


module cyq_74HC153(S,I,E,Y);

    input [1:0]S;
    input [0:3]I;
    input  E;
    output reg Y;

    always @*
        if(E) Y=0;
        else if(!E) Y=I[S];

endmodule

