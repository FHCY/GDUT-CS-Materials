`timescale 10ns/1ns
module test_cyq_74HC161;
     reg MR,CLK,CEP,CET,PE;
     reg [3:0]D;
     wire [3:0]Q;
     wire TC;
     cyq_74HC161 u0(MR,CLK,CEP,CET,PE,D,Q,TC);
     initial
        begin
           CLK=1;
        repeat(100)
      #5   CLK=~CLK;
        end
      initial
          D=4'b1111;
      initial
         begin
            MR=0;
            PE=1;
            CEP=1;
            CET=1;
        #22 MR=1;
        #30 PE=0;
        #10 PE=1;
        #200 CEP=0;
        #30  CEP=1;
        #50 CET=0;
        #30 CET=1;
          end
endmodule

module test_cyq_74HC194;
    reg MR,Dsr,Dsl,clk;
    reg [3:0]D;
    reg [1:0]S;
    wire [0:3]Q;
    cyq_74HC194   u0(MR,S,clk,Dsr,Dsl,D,Q);
    initial
         begin
         clk=1;
          repeat(100)
        #5 clk=~clk;
          end
     initial
          begin
          MR=0;
          S=0;
          Dsr=0;
          Dsl=1;
          D=0;
     #100 MR=1;
     #50  S=1;
     #50  Dsr=1;
     #50  S=2;
     #50  Dsl=1;
     #50  S=3;
        repeat(15)
     #50  D=D+1;
          end
endmodule

module test_cyq_74HC112;
      reg Sd,Rd,clk,J,K;
      wire Q;
      wire Q_n;
      cyq_74HC112   u0(Sd,Rd,clk,J,K,Q,Q_n);
      initial
         begin
        clk=0;
      repeat(100)
       #5 clk=~clk;
        end
     initial
        begin
          {Sd,Rd}=0;
          {J,K}=0;
       #100 {Sd,Rd}=1;
       #100 {Sd,Rd}=2;
       #100 {Sd,Rd}=3;
       #50  {J,K}=1;
       #50  {J,K}=2;
       #50  {J,K}=3;
        end
endmodule

module test_cyq_74HC74;
     reg Sd,Rd,clk,D;
     wire Q;
     wire Q_n;
     cyq_74HC74   u0(Sd,Rd,clk,D,Q,Q_n);
     initial
        begin
         clk=1;
        repeat(100)
       #5 clk=~clk;
        end
    initial
       begin
         {Sd,Rd}=0;
         D=0;
      #100 {Sd,Rd}=1;
      #100 {Sd,Rd}=2;
      #100 {Sd,Rd}=3;
      #50 D=1;
        end
endmodule
    

    