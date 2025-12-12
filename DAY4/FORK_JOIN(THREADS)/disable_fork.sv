// DISABLE FORK
module disable_fork;
  initial begin
    $display("\n Starting of the initial block");
    $display("time = %0t - start of initial", $time); #3;
    
    $display("time = %0t - entering fork join", $time);
    fork      
      #5 $display("time = %0t - Thread A delay 5", $time);
      #2 $display("time = %0t - Thread B delay 2", $time);
      #3 $display("time = %0t - Thread c delay 3", $time);
    join_any
    $display("time = %0t - Event detected has Exit from the fork join", $time);
    
    disable fork; #1;
    
    #2 $display("time = %0t - Thread D outside fork join delay 2", $time);
    
    $display("time = %0t - end of initial delay", $time);
    $display(" ending of the initial block\n");
  end
endmodule