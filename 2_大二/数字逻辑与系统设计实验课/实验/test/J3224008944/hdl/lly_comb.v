// lly_comb.v
module lly_74HC148(EI, I, A, GS, EO);
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

module lly_74HC4511(LE,BI,LT,A,Y);
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