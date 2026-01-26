// modport with task
// interface

interface intf #(parameter WIDTH = 8);
  logic 			      rst;
  logic 			      en;
  logic [WIDTH-1:0] data_in;
  logic [WIDTH-1:0] b2g;
  logic [WIDTH-1:0] g2b;
  
  // task for stimulus drive to dut
  task drive_data(input logic enable, input logic [WIDTH-1:0]data);
    #5;
    en      = enable;
    data_in = data;
  endtask
  
  // task for reset condition
  task reset();
    rst 	= 1;
    data_in = 0;
    en	    = 0;
    
    // release reset
    #10;
    rst = 0;
  endtask
    
  // modport 
  modport dut(input rst, en, data_in, output b2g, g2b); // design
  modport tb(output rst, en, data_in, input b2g, g2b, import reset, drive_data);	// testbench -- need to import task to the testbench modport
  

endinterface
