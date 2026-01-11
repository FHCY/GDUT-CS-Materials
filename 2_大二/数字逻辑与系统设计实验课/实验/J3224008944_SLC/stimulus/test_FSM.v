// test_FSM.v
`timescale 1ns/1ns
module test_lly_fsm_0101;
    reg ina, rst, clk;
    wire dataout;
    parameter clock_period = 20;
    always#(clock_period/2) clk = ~clk;
    
lly_fsm_0101 u0(clk, rst, ina, dataout);

    initial begin
        clk = 0; rst = 1;
        #5 rst = 0;
        #5 rst = 1;
    end
    
    initial begin 
        clk = 0; 
        rst = 1;
        ina = 0;
        
        #5 rst = 0;
        #5 rst = 1;

        #20 ina = 0;
        #20 ina = 1; 
        #20 ina = 0; 
        #20 ina = 1; 

        #20 ina = 0; 
        #20 ina = 1; 

        #20 ina = 0; 
        #50;
        $stop;
    end
endmodule

`timescale 1ns/1ns
module test_lly_VM;
    reg Clk,Reset;
    reg[1:0] D_in;
    wire D_out;
    wire D_C;
    parameter DELY=32;
lly_VM u0(.Clk(Clk),.Reset(Reset),.D_in(D_in),.D_out(D_out),.D_C(D_C));
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