module cyq_fsm_011(Rst,Clk,X,Y);
    input Rst,Clk,X;
    output reg Y;
    parameter S0=2'b00,S1=2'b01,S2=2'b11,S3=2'b10;
    reg[1:0]current_S,next_S;
        
    always @(X,current_S)
        case(current_S)
            S0:next_S<=X?S0:S1;
            S1:next_S<=X?S2:S1;
            S2:next_S<=X?S3:S1;
            S3:next_S<=X?S0:S1;
            default:next_S<=S0;
        endcase

    always @(posedge Clk,negedge Rst)
        if(!Rst) current_S=S0;
        else current_S=next_S;

    always @(current_S)
        Y=(current_S==S3);
    
endmodule


module cyq_VM(Reset, Clk, D_in, D_out, D_C);
    input Reset, Clk;
    input [1:0]D_in;
    output reg D_out, D_C;
    reg [2:0]current_s, next_s;
    parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100, S5=3'b101;

    always@(D_in, current_s)
        case(current_s)
            S0: if(D_in[1])         next_s=S2;
                else if(D_in[0])    next_s=S1;
                else                next_s=S0;

            S1: if(D_in[1])         next_s=S3;
                else if(D_in[0])    next_s=S2;
                else                next_s=S1;

            S2: if(D_in[1])         next_s=S4;
                else if(D_in[0])    next_s=S3;
                else                next_s=S2;

            S3: if(D_in[1])         next_s=S5;
                else if(D_in[0])    next_s=S4;
                else                next_s=S3;

            default:                next_s=S0;
        endcase

    always@(posedge Clk, posedge Reset)
        if(Reset)
            current_s=S0;
        else
            current_s=next_s;

    always@(current_s)
        begin
           D_out=(current_s==S4)||(current_s==S5);
           D_C=(current_s==S5);
        end

endmodule