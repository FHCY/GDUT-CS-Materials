// lzy_slc.v
module lzy_74HC74(Rd, Sd, Clk, D, Q, Qn);
    input Rd, Sd, Clk;
    input D;
    output Q, Qn;
    reg Q;
    always @ (posedge Clk, negedge Rd, negedge Sd)
    case({Sd, Rd})
    2'b01: Q <= 1;
    2'b10: Q <= 0;
    2'b11: Q <= D;
    default: Q <= 1'bx;
    endcase
    assign Qn = ~Q;
endmodule

module lzy_74HC112(Rd, Sd, Clk, J, K, Q, Qn);
    input Rd, Sd, Clk;
    input J, K;
    output Q, Qn;
    reg Q;
    always @ (negedge Clk, negedge Rd, negedge Sd)
    if (!Sd) Q <= 1;
    else if (!Rd) Q <= 0;
    else case({J, K})
    2'b00: Q <= Q;
    2'b01: Q <= 0;
    2'b10: Q <= 1;
    2'b11: Q <= ~Q;
    default: Q <= 1'bx;
    endcase
    assign Qn = ~Q;
endmodule

module lzy_74HC161(MR, Clk, CEP, CET, PE, D, Q, C);
    input MR, Clk, CEP, CET, PE;
    input [3:0]D;
    output reg [3:0]Q;
    output C;
    always @ (posedge Clk, negedge MR)
    if (!MR) Q <= 0;
    else if (!PE) Q <= D;
    else if (CEP & CET) Q <= Q+1;
    else Q <= Q;
    assign C = &{CET, Q};
endmodule

module lzy_74HC194(MR, S, Clk, Dsr, Dsl, D, Q);
    input MR,Clk,Dsr,Dsl;
    input [1:0]S;
    input [0:3]D;
    output reg [0:3]Q;
    always @(posedge Clk,negedge MR)
        if(!MR) Q<=0;
        else 
            case(S)
            0:Q<=Q;
            1:Q<={Dsr,Q[0:2]};
            2:Q<={Q[1:3],Dsl};
            3:Q<=D;
            endcase
endmodule

module lzy_74HC4511(LE,BI,LT,A,Y);
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

module lzy_74HC138(E1, E2, E3, A, Y);
    input E1, E2, E3;
    input [2:0]A;
    output reg [7:0]Y;
    always @* 
        begin
        Y = 8'b1111_1111;
        if ({E1, E2, E3} == 3'b001)
           Y[A] = 0;
        end
endmodule

module _counter(Aclr, Clk, Q);
    input Aclr,Clk;
    output reg [1:0]Q;

    always @(posedge Clk , negedge Aclr)
    begin
        if(!Aclr) Q <= 0;
        else      Q <= Q+1;
    end
endmodule

module lzy_fsm_100(clk, rst, ina, dataout);
    input clk, rst, ina;
    output reg dataout;
    parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b11, s3 = 2'b10;
    reg [1:0]state;
    always @ (posedge clk or negedge rst)
    if(!rst) begin
      state <= s0; dataout <= 0;
    end
    else
    case(state)
      s0:begin
          state <= (ina)?s1:s0;
          dataout <= 0;
         end
      s1:begin
          state <= (ina)?s1:s2;
          dataout <= 0;
         end
      s2:begin
          state <= (ina)?s1:s3;
          dataout <= 0;
         end
      s3:begin
          state <= (ina)?s1:s0;
          dataout <= 1;
         end
     endcase
endmodule

module lzy_VM( Reset,Clk,D_in,D_out,D_C);
    input Reset,Clk;
    input [1:0]D_in;
    output reg D_out,D_C;
    parameter S0=3'b000,S1=3'b001,S2=3'b010,S3=3'b011,S4=3'b100,S5=3'b101;
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
    default:next_s=S0;
    endcase
    always@(posedge Clk,posedge Reset)
    if(Reset)
     current_s=S0;
    else
     current_s=next_s;
    always @(current_s)
    begin
    D_out=(current_s==S4)||(current_s==S5);
    D_C=current_s==S5;
    end
endmodule

module _multiplexor (Data0_port, Data1_port, Data2_port, Data3_port, sel0, sel1, result);
    input [3:0] Data0_port;   
    input [3:0] Data1_port;  
    input [3:0] Data2_port;   
    input [3:0] Data3_port;  
    input sel0;                
    input sel1;                
    output reg [3:0] result;   
    always @(*) begin
        case ({sel1, sel0})
            2'b00: result = Data0_port;  
            2'b01: result = Data1_port;  
            2'b10: result = Data2_port;  
            2'b11: result = Data3_port;  
            default: result = 4'b0000;   
        endcase
    end

endmodule
