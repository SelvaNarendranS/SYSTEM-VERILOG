// Write a module that reverses a given string. For example, reverse "SystemVerilog" to get "golireVmetsyS 

module string_reverse;
  string name, str_rev;
  
  initial begin
    name = "SystemVerilog";
    $display("The input string = %s", name);
    
    for(int i = name.len(); i >=0; i--) begin
      str_rev = {str_rev, name[i]};
    end
    $display("string reversed = %s", str_rev);
  end
endmodule