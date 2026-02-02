// Class Handle Randomization
class base;
  rand byte unsigned addr;
endclass

module handle_randomize;
  base b[5];		// array of class handle
  
  initial begin
    $display("\t\t-------random values by function based ----'$urandom_range'----");
    foreach(b[i]) begin
      b[i] = new();		// memory allocation
      b[i].addr = $uraandom_range(0, 256);
      $display("The array of class handle element addr = %0p\n", h[i].addr);
    end
  end
endmodule