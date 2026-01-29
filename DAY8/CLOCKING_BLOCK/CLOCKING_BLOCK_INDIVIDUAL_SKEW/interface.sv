// clocking block - individual skew
// interface
interface intf;
  logic a, b, clk;
  logic z;
  
  // clocking block with individual input and output skew
  clocking cb @(negedge clk);
    input #2 z;			// samples output from dut at 2 skew delay
    output #1 a, b;		// drives input to dut at 1 skew delay
  endclocking
  
endinterface