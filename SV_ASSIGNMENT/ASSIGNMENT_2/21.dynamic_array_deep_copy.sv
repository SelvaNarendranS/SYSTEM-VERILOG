// How would you handle deep copying in SystemVerilog for a class with dynamic array arrays? 

// nested class
class nested_class;
  int a[];				// dynamic sized array
  
  function new(int size = 5, a = 2);
    this.a = new[size];
    foreach(a[i])
      this.a[i] = a+i;
  endfunction
    
endclass

// base class -- host class
class base;
  nested_class nst_cls;		// nested class handle
  
  function new(int a = 1, byte b = 20);
    nst_cls = new(6, 60);		// nested class object allocation -- / assigning value to the nested class
  endfunction
  
  // user customization function for deep copy of the nested class
  function void deep(base source);
    this.nst_cls = new();  		// creating instance for nested class
    
    // copying the nested class -- deep copy(shallow copy from nested from host to copier) this allocates each space to the array location
    this.nst_cls.a = new[source.nst_cls.a.size()](source.nst_cls.a);
  endfunction
  
endclass

module dynamic_array_deep_copy;
  base base_host, base_copy;		// base class handle
  
  initial begin
    
    // display before object allocation
    $display(" -----Base class handle has beeen created ------ ");
    $display("Object allocation to host base class handle");
    
    base_host = new(8, 150);		// object allocation to the base host class
    
    $display("BASE_HOST :NESTED CLASS a = %0p", base_host.nst_cls.a);    
    $display("Object allocated to base_host only");
    
    
    
    base_copy = new base_host;		// shallow copy of the base class      
    
    base_copy.deep(base_host);		// deep copy -- passing arguments of the nested class from host to copier
    
    // deep copy 
    $display("\n------ DEEP COPY -----------------");
    $display("BASE_HOST : NESTED CLASS a = %0p", base_host.nst_cls.a);
    $display("BASE_COPY : NESTED CLASS a = %0p", base_copy.nst_cls.a);
    
    
    // deep copy -- overwriting nested class values from base_copy
    base_copy.nst_cls.a = '{462, 16, 316, 178, 972};
    
    $display("\n------ DEEP copy ---- overwriting nested class values and base class from base_copy ------");
    $display("BASE_HOST : NESTED CLASS a = %0p", base_host.nst_cls.a);
    $display("BASE_COPY : NESTED CLASS a = %0p", base_copy.nst_cls.a);
    
  end
endmodule