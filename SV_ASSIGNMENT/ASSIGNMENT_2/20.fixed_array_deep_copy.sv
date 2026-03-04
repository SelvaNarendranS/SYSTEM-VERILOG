// How would you handle deep copying in SystemVerilog for a class with arrays? 

// nested class
class nested_class;
  int a[5];				// fixed sized array
  
  function new(int a = 2);
    foreach(a[i])
      this.a[i] = a+i;
  endfunction
    
endclass

// base class -- host class
class base;
  int num;
  byte unsigned value;
  nested_class nst_cls;		// nested class handle
  
  function new(int a = 1, byte b = 20);
    num   	= a;
    value 	= b;
    nst_cls = new(60);		// nested class object allocation -- / assigning value to the nested class propert
  endfunction
  
  // user customization function for deep copy of the nested class
  function void deep(nested_class nst1);
    nst_cls = new nst1;				// copying the nested class -- deep copy(shallow copy od nested fron host to copier)
  endfunction
  
endclass

module fixed_array_deep_copy;
  base base_host, base_copy;		// base class handle
  
  initial begin
    
    // display before object allocation
    $display(" -----Base class handle has beeen created ------ ");
    $display("Object allocation to host base class handle");
    
    base_host = new(100, 150);		// object allocation to the base host class
    
    $display("BASE_HOST : num = %0d | value = %0d | NESTED CLASS a = %0p", base_host.num, base_host.value, base_host.nst_cls.a);    
    $display("Object allocated to base_host only");
    
    
    
    base_copy = new base_host;		// shallow copy of the base class      
    
    base_copy.deep(base_host.nst_cls);		// deep copy -- passing arguments of the nested class from host to copier
    
    // deep copy 
    $display("\n------ DEEP COPY -----------------");
    $display("BASE_HOST : num = %0d | value = %0d | NESTED CLASS a = %0p", base_host.num, base_host.value, base_host.nst_cls.a);
    $display("BASE_COPY : num = %0d | value = %0d | NESTED CLASS a = %0p", base_copy.num, base_copy.value, base_copy.nst_cls.a);
    
    
    // deep copy -- overwriting nested class values and base class from base_copy
    base_copy.num   = 1645;
    base_copy.value = 245;
    base_copy.nst_cls.a = '{462, 16, 316, 178, 972};
    
    $display("\n------ DEEP copy ---- overwriting nested class values and base class from base_copy ------");
    $display("BASE_HOST : num = %0d | value = %0d | NESTED CLASS a = %0p", base_host.num, base_host.value, base_host.nst_cls.a);
    $display("BASE_COPY : num = %0d | value = %0d | NESTED CLASS a = %0p", base_copy.num, base_copy.value, base_copy.nst_cls.a);
    
  end
endmodule