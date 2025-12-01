// Enumerated data type methods
module Enumerated_methods;
  enum logic[3:0]{apple, mango, orange= 5, grapes, jackfruit = 10, pinapple, gova}fruits;
  
  initial begin 
    
    fruits = grapes;
    $display ("family.first() = %0d", fruits.first());  // First value 
    $display ("family.last()  = %0d", fruits.last());	// Last value 
    $display ("family.next()  = %0d", fruits.next()); 	// Next value 
    $display ("family.prev()  = %0d", fruits.prev()); 	// Previous value 
    $display ("family.num()   = %0d", fruits.num()); 	// Total number of enum
    $display ("family.name()  = %s" , fruits.name()); 	// Name of the current enum

  end
endmodule
  