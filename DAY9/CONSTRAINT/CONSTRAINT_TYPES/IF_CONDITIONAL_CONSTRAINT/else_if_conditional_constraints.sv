// constraint -- if- else if- else conditional constraint
class parent;
  rand byte unsigned a;
  rand byte unsigned b;
  rand byte unsigned c;
  static bit [1:0]i;
  
  // else-if constraint
  constraint c1 {
    if(a == b)							// conditional constraint
      c inside {34, 136, [a:(a*2)]};
    else if(a > b)
      c inside {[1:40]};
    else {
      a inside {[20:195]};
      b < c;
    }
  }
  
  // function pre randomize
  function void pre_randomize();
    i++;
    if(i == 0) begin
      a = 60;
      b = 60;
      a.rand_mode(0);			// setting randomization disable -- solver to pick the loaded a, b value
      b.rand_mode(0);
    end
    else begin
      a.rand_mode(1);			// setting randomization enable -- solver to generate a, b value
      b.rand_mode(1);
    end
  endfunction
    
  
  // function to print random generated values
  function void print();
    $display("	a = %0d | b = %0d | c = %0d 	-- %0s", a, b, c, (a == b) ? "a == b" : (a > b) ? "a > b" : "(a != b) && (a < b)");
  endfunction
  
endclass

module else_if_conditional_constraint;
  parent p1;		// class handle
  
  initial begin
    p1 = new();		// object allocation
    
    $display("\n----------printing if- else-if - else conditional constraint ramdomized values----------------");
    repeat(10) begin
      p1.randomize();		// calling randomize function for randomize
    
      p1.print();	
    end  
  end
endmodule