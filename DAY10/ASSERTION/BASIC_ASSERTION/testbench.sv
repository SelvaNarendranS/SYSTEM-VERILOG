// Testbench
module tb_basic;
  reg clk;
  reg in;
  wire out;

  // Instantiation
  basic dut (
    .clk(clk),
    .in(in),
    .out(out)
  );

  // Clock Generation
  always begin
    #10 clk = ~clk;
  end

  // Stimulus Generation
  initial begin
    
    // Initialization
    clk = 0;
    in = 0;
    
    @(posedge clk);
    #1;
    
    $display("Setting in = 1");
    in = 1;
    @(posedge clk); 
    #1;
   
    $display("Keeping in = 1");
    @(posedge clk);
    #1;

    $display("Setting in = 0");
    in = 0;
    @(posedge clk);
    #1;

    $display("Keeping in = 0");
    @(posedge clk);
    #1;

    $display("Done");
    $finish;
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_basic);
  end

endmodule
