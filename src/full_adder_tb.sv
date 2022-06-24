module full_adder_tb();
    timeunit 1ns;
    timeprecision 1ps;
    
    localparam CLK_PERIOD =10;
    logic clk;
    initial begin
        clk=0;
        forever #(CLK_PERIOD/2) clk <=~clk;
    end
    
    logic a=0;
    logic b;
    logic c_in=0;
    logic sum;
    logic c_out;
    
    full_adder fa(.*); //wild card instantiation - module instantiation
    
    //hard instantiation
    //full_adder fa(.clk(clk), .a(a), .b(b), .c_in(c_in), .sum(sum), .c_out(c_out));
    
    initial begin
        //simulation starts
        @(posedge clk);
        #(CLK_PERIOD*3);
        
        @(posedge clk);
        a   <=0;
        b   <=0;
        c_in<=0;
        
        @(posedge clk);
        a   <=0;
        b   <=0;
        c_in<=0;
        
        #(CLK_PERIOD*2); 
        @(posedge clk);
        a   <=1;
        b   <=1;
        c_in<=0;
        
        @(posedge clk);
        a   <=1;
        b   <=1;
        c_in<=1;
    end
endmodule
