module cyq_74HC74(sd,rd,clk,D,Q,Q_n);
    input sd,rd,clk,D;
    output reg Q,Q_n;
    always @(posedge clk,negedge sd,negedge rd)
    case ({sd,rd})
    0:begin Q=1;Q_n=1; end
    1:begin Q=1;Q_n=0; end
    2:begin Q=0;Q_n=1; end
    3:begin Q=D;Q_n=~D; end
    default: {Q,Q_n}=2'b11;
    endcase
endmodule

module cyq_74HC112(sd,rd,clk,J,K,Q,Q_n);
    input sd,rd,clk,J,K;
    output reg Q;

    output Q_n;
    assign Q_n=~Q;
    always @(negedge clk,negedge sd,negedge rd)
       if(!sd) Q=1;
       else if(!rd) Q=0;
       else 
          case({J,K})
           0:Q=Q;
           1:Q=0;
           2:Q=1;
           3:Q=~Q;
           default: Q=1'bx;
            endcase
endmodule

module cyq_74HC194(MR,S,clk,Dsr,Dsl,D,Q);
      input MR,clk,Dsr,Dsl;
      input [3:0]D;
      input [1:0]S;
      output reg [0:3]Q;
      always @ (posedge clk,negedge MR)
      if(!MR) Q<=4'b0000;
      else 
      case(S)
      0:Q<=Q;
      1:Q<={Dsr,Q[0:2]};
      2:Q<={Q[1:3],Dsl};
      3:Q<=D;
      default:Q<=4'bxxxx;
      endcase
endmodule

module cyq_74HC161(MR,clk,Cep,Cet,PE,D,Q,TC);
     input MR,clk,Cep,Cet,PE;
     input [3:0]D;
     output reg [3:0]Q;
     output TC;
     always @(negedge MR,posedge clk)
     if(!MR) Q<=0;
     else if (!PE) Q<=D;
     else if(Cep&Cet) Q<=Q+1;
     else Q<=Q;
     assign TC=&{Q,Cet};
endmodule


//cyq_74HC4511 LED Decoder
module cyq_74HC4511(LE,BI,LT,D,Y);
    input LE,BI,LT;
    input [3:0]D;
    output reg [6:0]Y;

    always @*
        if(!LT) Y=7'b111_1111;
        else if (!BI) Y=0;
        else if (!LE) 
            case (D)
                0:      Y=7'b111_1110;
                1:      Y=7'b011_0000;
                2:      Y=7'b110_1101;
                3:      Y=7'b111_1001;
                4:      Y=7'b011_0011;
                5:      Y=7'b101_1011;
                6:      Y=7'b101_1111;
                7:      Y=7'b111_0000;
                8:      Y=7'b111_1111;
                9:      Y=7'b111_1011;
                default:Y=7'b000_0000;
            endcase
endmodule
     

//cyq_74HC138: 3-8 Decoder
module cyq_74HC138(E,A,Y);
    input [1:3]E;
    input [2:0]A;
    output reg [7:0]Y;
    
    always @*
        if(E[1]) Y=8'b1111_1111;
        else if(E[2]) Y=8'b1111_1111;
        else if(E[3]==0) Y=8'b1111_1111;
        else if(E[1]==0 & E[2]==0 & E[3]==1)
            begin
                Y=8'b1111_1111;
                Y[A]=0;
            end
endmodule


module counter_width2(Aclr, Clk, Q);
    input Aclr, Clk;
    output reg [1:0]Q;

    always @*
        if(Aclr==0)
            Q<=0;

    always @(posedge Clk)
        Q<=Q+1;

endmodule


module register_width4(I, Y);
    input [1:0]I;
    output reg [3:0]Y;
    
    always @(I)
        case(I)
            0: Y<=4'b1000;
            1: Y<=4'b1000;
            2: Y<=4'b1000;
            3: Y<=4'b0011;
        endcase
endmodule