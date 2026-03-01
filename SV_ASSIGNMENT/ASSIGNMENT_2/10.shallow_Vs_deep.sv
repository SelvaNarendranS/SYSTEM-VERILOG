// What happens to the original object if a nested object's property is modified after performing a shallow copy? Explain your answer with an example. 


// shallow copy flaws and the flaws are overcame by deep copy
// shallow copy -- only copy host properties and methods and store it in different memory (a seprate memory), but it could not able to make a seprate copy of the host nested classes - it shares reference to the host by the copy handle, so deep copy is used it copies entirly and store in different memory location

// nested class
class nested_class;
  int a;
  
  function new(int a = 2);
    this.a = a;
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

module shallow_Vs_deep_copy;
  base base_host, base_copy;		// base class handle
  
  initial begin
    
    // display before object allocation
    $display(" -----Base class handle has beeen created ------ ");
    $display("Object allocation to host base class handle");
    
    base_host = new(100, 150);		// object allocation to the base host class
    
    $display("BASE_HOST : num = %0d | value = %0d | NESTED CLASS a = %0d", base_host.num, base_host.value, base_host.nst_cls.a);    
    $display("Object allocated to base_host only");
    
    
    
    base_copy = new base_host;		// shallow copy of the base class
    
    // shallow copy display
    $display("\n------ SHALLOW copy ---- copying base_Host to Base_copy ------");
    $display("BASE_HOST : num = %0d | value = %0d | NESTED CLASS a = %0d", base_host.num, base_host.value, base_host.nst_cls.a);
    $display("BASE_COPY : num = %0d | value = %0d | NESTED CLASS a = %0d", base_copy.num, base_copy.value, base_copy.nst_cls.a);
    
    // shallow copy -- overwriting only base class values from base_copy
    base_copy.num   = 506;
    base_copy.value = 21;
    
    $display("\n------ SHALLOW copy ---- overwriting only base class values from Base_copy ------");
    $display("BASE_HOST : num = %0d | value = %0d | NESTED CLASS a = %0d", base_host.num, base_host.value, base_host.nst_cls.a);
    $display("BASE_COPY : num = %0d | value = %0d | NESTED CLASS a = %0d", base_copy.num, base_copy.value, base_copy.nst_cls.a);
    
    
    // shallow copy flaws -- overwriting nested class values from base_copy
    base_copy.nst_cls.a = 30;
    
    $display("\n------ SHALLOW copy flaws ---- overwriting nested class values from Base_copy ------");
    $display("BASE_HOST : num = %0d | value = %0d | NESTED CLASS a = %0d", base_host.num, base_host.value, base_host.nst_cls.a);
    $display("BASE_COPY : num = %0d | value = %0d | NESTED CLASS a = %0d", base_copy.num, base_copy.value, base_copy.nst_cls.a);
    
    
    base_copy.deep(base_host.nst_cls);		// deep copy -- passing arguments of the nested class from host to copier
    
    // deep copy 
    $display("\n------ DEEP COPY -----------------");
    $display("BASE_HOST : num = %0d | value = %0d | NESTED CLASS a = %0d", base_host.num, base_host.value, base_host.nst_cls.a);
    $display("BASE_COPY : num = %0d | value = %0d | NESTED CLASS a = %0d", base_copy.num, base_copy.value, base_copy.nst_cls.a);
    
    
    // deep copy -- overwriting nested class values and base class from base_copy
    base_copy.num   = 1645;
    base_copy.value = 245;
    base_copy.nst_cls.a = 462;
    
    $display("\n------ DEEP copy ---- overwriting nested class values and base class from base_copy ------");
    $display("BASE_HOST : num = %0d | value = %0d | NESTED CLASS a = %0d", base_host.num, base_host.value, base_host.nst_cls.a);
    $display("BASE_COPY : num = %0d | value = %0d | NESTED CLASS a = %0d", base_copy.num, base_copy.value, base_copy.nst_cls.a);
    
  end
endmodule