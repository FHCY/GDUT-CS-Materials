`timescale 10ns/1ns

module test_cyq_SLC;
    reg Clk, Aclr;
    wire a, b, c, d, e, f, g, COM_1, COM_2, COM_3, COM_4;

/*
    cyq_SSD1 u0(.Clk(Clk), .Aclr(Aclr),
                .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g),
                .COM_1(COM_1), .COM_2(COM_2), .COM_3(COM_3), .COM_4(COM_4));
*/
    cyq_SSD2 u0(.Clk(Clk), .Aclr(Aclr),
                .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g),
                .COM_1(COM_1), .COM_2(COM_2), .COM_3(COM_3), .COM_4(COM_4));

    initial
        begin
                 Clk = 0;
                 Aclr = 0;
            #200 Aclr = 1;
        end

    always 
        #20 Clk = ~Clk;

endmodule