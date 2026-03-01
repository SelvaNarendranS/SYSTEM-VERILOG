// In what scenarios would you prefer using shallow copy over deep copy in SystemVerilog? Discuss the advantages and disadvantages of using shallow copy.

// shallow copy -- only copy host properties and methods and store it in different memory (a seprate memory), but it could not able to make a seprate copy of the host nested classes - it shares reference to the host by the copy handle

// nested class
interface intf;
  logic [15:0] a = 1;    
endinterface

// base class -- host class
class env_config;
  int num = 3;
  virtual intf vintf;		// interface handle
  
  function new(virtual intf vf);
    vintf = vf;
  endfunction
   
endclass

module top;
  env_config host_cfg, copy_cfg;		// env_config class handle
  intf physical_intf();				// interface handle
  
  initial begin
    
    // display before object allocation
    $display(" -----env_config handle has beeen created ------ ");
    $display("Object allocation to host_cfg class handle");
    
    host_cfg = new(physical_intf);		// object allocation to the host_cfg class
    
    $display("HOST_CFG : num = %0d | NESTED interface a = %0d", host_cfg.num, host_cfg.vintf.a);    
    $display("Object allocated to host_cfg only");
    
    
    copy_cfg = new host_cfg;		// shallow copy of the env_config class
    
    // shallow copy display
    $display("\n------ SHALLOW copy ---- copying Host_cfg to copy_cfg ------");
    $display("HOST_CFG : num = %0d | NESTED interface a = %0d", host_cfg.num, host_cfg.vintf.a);
    $display("COPY_CFG : num = %0d | NESTED interface a = %0d", copy_cfg.num, copy_cfg.vintf.a);
    
    // shallow copy -- overwriting only env_config class values from copy_cfg
    copy_cfg.num   = 506;
    
    // shallow copy display
    $display("\n------ SHALLOW copy ---- copying Host_cfg to copy_cfg ------");
    $display("HOST_CFG : num = %0d | NESTED interface a = %0d", host_cfg.num, host_cfg.vintf.a);
    $display("COPY_CFG : num = %0d | NESTED interface a = %0d", copy_cfg.num, copy_cfg.vintf.a);
    
    
    // shallow copy -- overwriting nested class values from copy_cfg
    copy_cfg.vintf.a = 30;
    
    $display("\n------ SHALLOW copy ---- overwriting nested class values from copy_cfg ------");
    $display("HOST_CFG : num = %0d | NESTED interface a = %0d", host_cfg.num, host_cfg.vintf.a);
    $display("COPY_CFG : num = %0d | NESTED interface a = %0d", copy_cfg.num, copy_cfg.vintf.a);
    
    // shallow copy -- overwriting nested class values from host_cfg
    host_cfg.vintf.a = 60;
    
    $display("\n------ SHALLOW copy ---- overwriting nested class values from host_cfg ------");
    $display("HOST_CFG : num = %0d | NESTED interface a = %0d", host_cfg.num, host_cfg.vintf.a);
    $display("COPY_CFG : num = %0d | NESTED interface a = %0d", copy_cfg.num, copy_cfg.vintf.a);
    
    // so if host and copy changes the nested class values the values will get changed so shallow copy is prefered more than deep copy for this behaviour ---- here a real hardware interface and a virtual interface both need to be act same to point a single dut
    
  end
endmodule