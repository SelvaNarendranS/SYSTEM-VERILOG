// class extends keyword
class parent;				// parent class (main class)
  int a, b;
  function new(int a = 2, b = 3);			// first this parent executes by default value
    this.a = a;
    this.b = b;
    $display("a = %0d | b = %0d | class parent", a, b);
  endfunction
endclass

// using extends keyword - connects parent to child(continuation of parent details into child) 
class child extends parent;		// child class from parent (sub class of main class)
  int a;
  function new(int a = 6);					// then this executes
    super.a = a;							// passes value a by overwriting previous value
    $display("a = %0d | | b = %0d | class child", a, b);
  endfunction
endclass

module extends_keyword;
  
  child c1;
  
  initial begin
  	c1 = new();
  end
endmodule