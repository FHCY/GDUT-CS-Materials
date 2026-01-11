// 74HC145.v
module _74HC145(Input, I);
    input [3:0]Input;
    output reg [9:0]I;
    always @* begin
    I = 10'b1111111111;
    if(Input < 10) I[Input] = 0;
    end
endmodule