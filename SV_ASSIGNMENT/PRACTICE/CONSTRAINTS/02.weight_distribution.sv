// Write a class data_generator with an 8-bit variable data. Use the dist operator to assign weights so that:
// Values from 0 to 50 get a weight of 30.
// Values from 51 to 100 get a weight of 70.

class data_generator;
  rand byte data;
  
  constraint data_gen{
    data dist {[0:50] :/ 30, 
               [51:100] :/ 70};
  }
  
endclass

module tb;
  
  data_generator gen;
  
  initial begin
    gen = new();
    
    repeat(5) begin
      if(!gen.randomize())
        $display("randomization faied");
      else
        $display("data = %0d", gen.data);
    end
  end
  
endmodule
