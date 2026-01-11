// lzy_FSM1.v
module lzy_74HC165(PL, CE, CP, Ds, D, Q7, Qn7);
    input PL, CE, CP, Ds;
    input [0:7]D;
    output Q7, Qn7;
    reg [0:7]Q;
    assign Q7 = Q[7];
    assign Qn7 = ~Q;
    always@(posedge CP, negedge PL) begin
    if(!PL) Q <= D;
    else if(!CE) Q <= {Ds, Q[0:6]};
    end
endmodule

module lzy_VM1( Reset,Clk,D_in,D_out,D_C);
    input Reset,Clk;
    input [1:0]D_in;
    output reg D_out,D_C;
    parameter S0=3'b000,S1=3'b001,S2=3'b010,S3=3'b011,S4=3'b100,S5=3'b101,S6=3'b110;
    reg[2:0]current_s,next_s;
    always@(D_in,current_s)
    case(current_s)
    S0: if(D_in[1])next_s=S2;
        else if(D_in[0]) next_s=S1;
        else next_s=S0;
    S1: if(D_in[1])next_s=S3;
        else if(D_in[0])next_s=S2;
        else next_s=S1;
    S2:if(D_in[1])next_s=S4;
       else if(D_in[0])next_s=S3;
       else next_s=S2;
    S3:if(D_in[1])next_s=S5;
       else if(D_in[0])next_s=S4;
       else next_s=S3;
    S4:if(D_in[1])next_s=S6;
       else if(D_in[0])next_s=S5;
       else next_s=S4;
    default:next_s=S0;
    endcase
    always@(posedge Clk,posedge Reset)
    if(Reset)
     current_s=S0;
    else
     current_s=next_s;
    always @(current_s)
    begin
    D_out=(current_s==S5)||(current_s==S6);
    D_C=current_s==S6;
    end
endmodule