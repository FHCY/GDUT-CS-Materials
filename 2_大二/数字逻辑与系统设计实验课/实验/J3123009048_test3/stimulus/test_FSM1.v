// test_FSM1.v
`timescale 10ns/1ns
module test_lzy_74HC165;
    reg PL, CE, CP, Ds;
    reg [0:7]D;
    wire Q7, Qn7;
lzy_74HC165 u0(PL, CE, CP, Ds, D, Q7, Qn7);
    always #5 CP=~CP;
    initial
    begin
    D = $random; CP = 1;
    #10 PL = 0;
    #10 PL = 1; CE = 0; Ds = 0;
    repeat(10) begin
    #10 PL = 1; CE = 0; Ds = 0;
    end
    #10 PL = 1; CE = 1;
    end
endmodule

`timescale 1ns/1ns
module test_lzy_VM1;
    reg Clk,Reset;
    reg[1:0] D_in;
    wire D_out;
    wire D_C;
    parameter DELY=32;
lzy_VM u0(.Clk(Clk),.Reset(Reset),.D_in(D_in),.D_out(D_out),.D_C(D_C));
    always#(DELY/2) Clk=~Clk;
    initial begin
    Clk=0;
    Reset=0;
    #5 Reset=1;
    #20 Reset=0;
    end
    initial
  begin
    D_in=0;
    #25 D_in=2'b01;
    #25 D_in=2'b00;
    #25 D_in=2'b11;
    #25 D_in=2'b00;
    #75 D_in=2'b10;
    #25 D_in=2'b00;
    #125 D_in=2'b10;
    #25 D_in=2'b00;
    #100 D_in=2'b01;
    #25 D_in=2'b00;
    #50 D_in=2'b01;
    #25 D_in=2'b00;
    #25 D_in=2'b10;
end

endmodule
     