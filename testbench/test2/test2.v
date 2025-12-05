`timescale 1ns/1ns 

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

  always #5 clk = ~clk;

  localparam QUANTUM_NS = 100;

  initial begin
    $dumpfile("rra_test2.vcd");
    $dumpvars();

    clk  = 0;
    rst  = 1;
    req0 = 0;
    req1 = 0;
    req2 = 0;
    req3 = 0;

    #30 rst = 0;

    req0 = 1;
    req1 = 1;
    #350;
    req0 = 0;
    req1 = 0;

    #20;

    req0 = 1;
    req1 = 1;
    req2 = 1;
    #400;
    req0 = 0;
    req1 = 0;
    req2 = 0;

    #20;

    req0 = 1;
    req1 = 1;
    req2 = 1;
    req3 = 1;
    #450;
    req0 = 0;
    req1 = 0;
    req2 = 0;
    req3 = 0;

    #20;


    req0 = 1;
    req2 = 1;
    #150;
    req1 = 1;
    req3 = 1;
    #250;
    req0 = 0;
    #150;
    req1 = 0;
    req2 = 0;
    req3 = 0;

    #20;


    req0 = 1;
    #50;
    req1 = 1;
    #250;
    req0 = 0;
    req1 = 0;

    #100 $finish;
  end

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