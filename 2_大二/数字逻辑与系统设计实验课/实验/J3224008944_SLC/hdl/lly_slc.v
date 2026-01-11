// lly_slc.v
module lly_fsm_0101(clk, rst, ina, dataout);
    input clk, rst, ina;
    output reg dataout;  
    parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b011, s3 = 3'b010, s4 = 3'b110;
    reg [2:0] state;
    always @ (posedge clk or negedge rst)
    if(!rst) begin
      state <= s0; 
      dataout <= 0;
    end
    else
    case(state)
      s0:begin
          state <= (ina)?s0:s1;
          dataout <= 0;
         end 
      s1:begin
          state <= (ina)?s2:s1;
          dataout <= 0;
         end    
      s2:begin     
          state <= (ina)?s0:s3;
          dataout <= 0;
         end   
      s3:begin      
          state <= (ina)?s4:s1;
          dataout <= 0;
         end  
      s4:begin  
          state <= (ina)?s0:s3;
          dataout <= 1;
         end 
      default: state <= s0;
    endcase
endmodule

module lly_VM( Reset,Clk,D_in,D_out,D_C);
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

