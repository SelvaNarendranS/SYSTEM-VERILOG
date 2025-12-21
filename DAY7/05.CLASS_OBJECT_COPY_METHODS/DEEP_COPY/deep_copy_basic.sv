// deep_copy_basic
class packet;
  int a;
  
  function packet copy();
    packet p;
    p = new();
    p.a = this.a;
    return p;
  endfunction
endclass

module deep_copy_basic;
  packet p1, p2;
  
  initial begin 
    p1 = new();
    p1.a = 20;
    
    p2 = p1.copy();			// deep copy
    p2.a = 30;
    $display("p1.data = %0d", p1.a);
    $display("p2.data = %0d", p2.a);
  end
endmodule
    