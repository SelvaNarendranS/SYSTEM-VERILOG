// How are classes used in verification as opposed to modules

// interface --- a connection (bridge) between dynamic and static 
interface intff(input logic clk);
  logic [7:0] data_in;		// input
  logic 	  valid;
  logic [7:0] data_out;		// output
endinterface


// design   ----- static module
module pass(intff intf);
  always @(posedge intf.clk) begin
    if(intf.valid) begin
      intf.data_out <= intf.data_in;
    end
  end
endmodule

// class driver --- dynamic class
class driver;
  
  virtual intff vintf;
  
  function new(virtual intff vintf);
    this.vintf = vintf;
  endfunction
  
  task task_main(int a, b);
    @(posedge vintf.clk)
    vintf.data_in = a;
    vintf.valid   = b;
    $display("In driver -- data in = %0d, valid = %0d", a, b);
  endtask
  
endclass

// class monitor --- dynamic class
class monitor;
  int a, b, c;
  
  virtual intff vintf;
  
  function new(virtual intff vintf);
    this.vintf = vintf;
  endfunction
  
  task task_main;
    @(posedge vintf.clk);
    a = vintf.data_in;
    b = vintf.valid;
    c = vintf.data_out;
    $display("In monitor -- data in = %0d, valid = %0d, data_out = %0d\n", a, b, c);
  endtask
  
endclass


// testbench ----- static module
module tb;
  logic clk;
  driver drv; 		// driver handle
  monitor mon;
  
  intff intf(clk);		// interface instantation
  
  // instantation
  pass dut(intf);
  
  // clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    drv = new(intf);		// creating object allocation to the dynamic class
    mon = new(intf);
    
    fork
      begin
        drv.task_main(200, 1);
        mon.task_main;
        #15;
        drv.task_main(154, 0);
        mon.task_main;
      end
      mon.task_main;
    join_any
    
    
    #50;
    $finish;
  end
endmodule
