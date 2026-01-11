// test_gate.v
`timescale 10ns/1ns
module test_lzy_BasGate;
reg A, B;
wire Y1, Y2, Y3, Y4, Y5, Y6;
lzy_BasGate u0(A, B, Y1, Y2, Y3, Y4, Y5, Y6);



initial
begin
A = 0;B = 0;
#10 B = 1;
#10 A = 1;
#10 B = 0;
end
initial
$monitor("time=%t,a=%b,b=%b,y1~y6=%b,%b,%b,%b,%b,%b",$time,A,B,Y1, Y2, Y3, Y4, Y5, Y6);
endmodule