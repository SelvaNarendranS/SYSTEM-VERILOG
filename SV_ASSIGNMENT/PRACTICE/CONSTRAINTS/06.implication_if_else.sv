// Implication (If-Else) Constraint
// Write a class cpu_instruction with two random variables:
// opcode (2-bit, values 0, 1, 2, 3).
// immediate_val (16-bit).
// Write a constraint such that:
// If opcode is 0, then immediate_val must be less than 256.
// If opcode is 1 or 2, then immediate_val must be between 1000 and 2000.
// If opcode is 3, then immediate_val must be exactly 16'hFFFF.

class cpu_instruction;
  rand bit[1:0] opcode;
  rand bit[15:0] immediate_val;
  
  constraint inst{
    (opcode == 0) -> (immediate_val < 256);
    (opcode inside {[1:2]}) -> (immediate_val inside {[1000:2000]});
    (opcode == 3) -> (immediate_val == 16'hFF_FF);
  }
  
endclass

module tb; 
  cpu_instruction cpu_inst;
  
  initial begin
    cpu_inst = new();
    
    repeat(10) begin
      if(!cpu_inst.randomize())
        $display("randomization faied");
      else
        $display("opcode = %0d | immediate_val = %0d", cpu_inst.opcode, cpu_inst.immediate_val);
    end
  end
  
endmodule
