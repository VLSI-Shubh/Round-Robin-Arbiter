`timescale 1ns/1ps
`include "../../src/rra.v"   

module rra_tb_2;

  reg  clk;
  reg  rst;
  reg  req3;
  reg  req2;
  reg  req1;
  reg  req0;
  wire gnt3;
  wire gnt2;
  wire gnt1;
  wire gnt0;

  // Clock: 10 ns period
  always #5 clk = ~clk;

  // One time quantum = 100 ns
  localparam QUANTUM_NS = 100;

  initial begin
    $dumpfile("rrarbiter.vcd");
    $dumpvars();

    clk  = 0;
    rst  = 1;
    req0 = 0;
    req1 = 0;
    req2 = 0;
    req3 = 0;

 
    #30 rst = 0;



    #20  req0 = 1;         
    #220 req0 = 0;          

 
    #10  req1 = 1;        
    #240 req1 = 0;          

  
    #10  req2 = 1;          
    #260 req2 = 0;         

   
    #10  req3 = 1;         
    #220 req3 = 0;          


    #100 $finish;
  end

  // DUT
  rra U (
    .clk (clk),
    .rst (rst),
    .req3(req3),
    .req2(req2),
    .req1(req1),
    .req0(req0),
    .gnt3(gnt3),
    .gnt2(gnt2),
    .gnt1(gnt1),
    .gnt0(gnt0)
  );

endmodule
