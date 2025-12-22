// virtual task
class parent;								// parent class
  virtual task display;
    #5;
    $display("time = %0t | Parent", $time);
  endtask
endclass

class child extends parent;					// extended class child class from parent class
  virtual task display;
    #5;
    $display("time = %0t | child", $time);
  endtask
endclass

module virtual_task;
  parent p1;				// class handle creation
  child c1;
  
  initial begin
    c1 = new();				// object allocation to child
    p1 = c1;				// up casting 
    
    $display("------- p1.display ---------");
    p1.display;
    $display("------- c1.display ---------");
    c1.display;
  end
endmodule