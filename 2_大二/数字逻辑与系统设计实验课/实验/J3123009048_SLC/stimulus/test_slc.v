// test_slc.v
`timescale 10ns/1ns
module test_lzy_74HC74;
    reg Rd, Sd, Clk;
    reg D;
    wire Q, Qn;
    lzy_74HC74 u0(Rd, Sd, Clk, D, Q, Qn);
    always #10 Clk=~Clk;
    initial
        begin
            Clk=0;D=0;
            repeat(20)
            begin #20 {Sd, Rd}=$random;  D=$random; end
        end
endmodule

module test_lzy_74HC112;
    reg Sd, Rd, Clk;
    reg J, K;
    wire Q, Qn;
    lzy_74HC112 u0(Rd, Sd, Clk, J, K, Q, Qn);
    always #5 Clk=~Clk;
    initial
        begin
            Clk=0;{J,K}=0;
            repeat(100)
            begin #5 {Sd, Rd}=$random;{J,K}=$random; end
        end
endmodule

module test_lzy_74HC194;
    reg MR, Clk, Dsr, Dsl;
    reg [1:0]S;
    reg [0:3]D;
    wire [0:3]Q;
    lzy_74HC194 u0(MR, S, Clk, Dsr, Dsl, D, Q);
    always #5 Clk=~Clk;
    initial
        begin
            Clk=0;MR=0;
            repeat(100)
            begin #5  MR=1;S=$random;Dsr=$random;Dsl=$random;D=$random;end
        end
endmodule

module test_lzy_74HC161;
    reg MR,Clk,CEP,CET,PE;
    reg [3:0]D;
    wire [3:0]Q;
    wire C;
    lzy_74HC161 u0(MR, Clk, CEP, CET, PE, D, Q, C);
    always #5 Clk=~Clk;
    initial
        begin
            Clk=0;MR=0;
            repeat(100)
            begin #5  MR=1;{CEP,CET}=$random;PE=$random;D=$random;end
        end
endmodule

`timescale 10ns/1ns
module test_lzy_fsm_100;
    reg ina, rst, clk;
    wire dataout;
    parameter clock_period = 20;
    always#(clock_period/2) clk = ~clk;
    
lzy_fsm_100 u0(clk, rst, ina, dataout);

    initial begin
    clk = 0; rst = 1;
    #5 rst = 0;
    #5 rst = 1;
    end
    
    initial begin 
    ina = 0;
    #5 repeat(10) begin
    #10 ina = 1;
    #10 ina = 0;
    #10 ina = 0;
    end
    #5 repeat(10) begin
    #10 ina = 1;
    #10 ina = 0;
    #10 ina = 0;
    #10 ina = 1;
    end
    end
endmodule

`timescale 1ns/1ns
module test_lzy_VM;
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


`timescale 1ns/1ns
module test_lzy_SLC1;
    reg Clk, Aclr;
    wire [7:0]seg;
    wire [1:4]DG;
    lzy_SSD1 u0(.Clk(Clk), .Aclr(Aclr), .seg(seg), .DG(DG));
    initial
        begin
        Clk = 1;
        repeat(50)
        #5 Clk = ~Clk;
        end
        initial
        begin
        Aclr = 0;
        #12 Aclr = 1;
        end
endmodule

`timescale 1ns/1ns;
module test_lzy_SSD2;
    reg Clk,Aclr;
    reg [3:0]A,B,C,D;
    wire [7:0]seg;
    wire[1:4]DG;
    lzy_SSD2 u0(.Clk(Clk),.Aclr(Aclr),.A(A),.B(B),.C(C),.D(D),.seg(seg),.DG(DG));
    initial
        A=9;
    initial
        B=0;
    initial
        C=4;
    initial
        D=8;
    initial
        begin
        Clk=1;
        repeat(100)
        #20 Clk=~Clk;
        end
    initial
        begin
        Aclr=0;
        #20 Aclr=1;
        end
endmodule