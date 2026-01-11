// lzy_gate.v
module lzy_BasGate(A, B, Y1, Y2, Y3, Y4, Y5, Y6);
input A, B;
output Y1, Y2, Y3, Y4, Y5, Y6;
assign Y1 = A&B;
assign Y2 = ~(A&B);
assign Y3 = A|B;
assign Y4 = ~(A|B);
assign Y5 = A^B;
assign Y6 = ~A;
endmodule