// NESTED FORK JOIN 
module nested_fork_join;
  initial begin
    $display("Time = %0t start of initial", $time);
    fork : outer
      $display("Time = %0t start of outer fork", $time);
      #1 $display("Time = %0t start of fork A", $time);
      begin : Task_A													// TASK A
        $display("Time = %0t start of Task A", $time);
        for(int i = 0; i < 3; i++) 
          #2 $display("Time = %0t Task A = iteration -%0d", $time, i);
        $display("Time = %0t end of Task A", $time);
      end
        
      fork : inner
        $display("Time = %0t start of inner fork", $time);
        #1 $display("Time = %0t start of fork B", $time);
        begin : Task_B													// TASK B
          $display("Time = %0t start of Task B", $time);
          for(int i = 0; i < 3; i++) 
            #3 $display("Time = %0t Task B = iteration -%0d", $time, i);
          $display("Time = %0t end of Task B", $time);
        end
        
        $display("Time = %0t start of Task C", $time);					// TASK C
          for(int i = 0; i < 3; i++) 
            #5 $display("Time = %0t Task C = iteration -%0d", $time, i);
        $display("Time = %0t end of Task C", $time);
      join
      #7 $display("Time = %0t end of inner fork", $time);
      $display("Time = %0t start of Task D", $time);
      for(int i = 0; i < 3; i++) 										// TASK D
            #3 $display("Time = %0t Task D = iteration -%0d", $time, i);
      $display("Time = %0t end of Task D", $time);
    join
    #10 $display("Time = %0t end of outer fork", $time);
  end
endmodule
    