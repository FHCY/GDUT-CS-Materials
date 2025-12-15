// test_gate.v
`timescale 1ns/1ns
module test_cyq_BasGate();
    reg a, b;
    wire y1, y2, y3, y4, y5, y6;
    cyq_BasGate u1(a, b, y1, y2, y3, y4, y5, y6);
    initial
        begin
            a=0; b=0;
            #5 b=1;
            #5 a=1;
            #5 b=0;
        end
    initial
        $monitor("time=%t, y1=%b, y2=%b, y3=%b, y4=%b, y5=%b, y6=%b, a=%b, b=%b", $time, y1, y2, y3, y4, y5, y6, a, b);
endmodule