module cyq_74HC165(PL, CE, CP, Ds, D, Y, Yn);
    
    input PL, CE, CP, Ds;
    input [0:7]D;
    reg [0:7]Q;
    output Y, Yn; 
    
    assign Y=Q[7];
    assign Yn=~Q[7];
    
    always@(posedge CP or negedge PL)
        begin
            if(PL==0)
                Q<=D;
            else if(CE==0)
                Q<={Ds, Q[0:6]};
            else
                Q<=Q;
        end
endmodule


module cyq_VM1(Reset, Clk, D_in, D_out, D_C);
    input Reset, Clk;
    input [1:0]D_in;
    output reg D_out, D_C;
    reg [0:7]current_s, next_s;
    parameter S0=7'b000_0001, 
              S1=7'b000_0010, 
              S2=7'b000_0100,
              S3=7'b000_1000,
              S4=7'b001_0000,
              S5=7'b010_0000,
              S6=7'b100_0000;

    always@(D_in, current_s)
        case(current_s)
            S0: if(D_in[1]&&D_in[0])next_s=S3;
                else if(D_in[1])    next_s=S2;
                else if(D_in[0])    next_s=S1;
                else                next_s=S0;

            S1: if(D_in[1]&&D_in[0])next_s=S4;
                else if(D_in[1])    next_s=S3;
                else if(D_in[0])    next_s=S2;
                else                next_s=S1;

            S2: if(D_in[1]&&D_in[0])next_s=S5;
                else if(D_in[1])    next_s=S4;
                else if(D_in[0])    next_s=S3;
                else                next_s=S2;

            S3: if(D_in[1]&&D_in[0])next_s=S6;
                else if(D_in[1])    next_s=S5;
                else if(D_in[0])    next_s=S4;
                else                next_s=S3;

            S4: if(D_in[1]&&D_in[0])next_s=S6;
                else if(D_in[1])    next_s=S6;
                else if(D_in[0])    next_s=S5;
                else                next_s=S4;

            default:                next_s=S0;
        endcase

    always@(posedge Clk, posedge Reset)
        if(Reset)
            current_s=S0;
        else
            current_s=next_s;

    always@(current_s)
        begin
           D_out=(current_s==S5)||(current_s==S6);
           D_C=(current_s==S6);
        end
endmodule