// Randomization --- randcase randomization  -- randcase_pick_random_constraint
class parent;
  rand bit [32:0]a;
  rand bit [32:0]b[5];							
  
  constraint c1 {					// foreach constraint
    foreach(b[i]){
      a == 60;
      b[i] == 50;
    }
  }
  
  constraint c2 {
    foreach(b[i]) {
      a inside {[20:30]};				// inside constraint -- specific set of range constraint
      b[i] inside {[15:35]};
    }
  }
  
  constraint c3 {
    foreach(b[i]) {
      a > 20; a < 50;					// bidirectional constraint
      a > 15;
      b[i] > 30; b[i] < 90;
      b[i] < 70;
    }
  }
  
  constraint c4 {
    foreach(b[i])
      (a == 10) -> (b[i] > a);				// implication constraint
  }
  
  constraint c5 {
    foreach(b[i]) {
      if(a == 10)
        (b[i] > a);
      else
        b[i] == 30;							// conditional constraint
    }
  }
  
  constraint c6 {
    foreach(b[i]) {
      soft a inside {[20:30]};				// soft constraint 
      soft b[i] inside {[15:35]};
    }
  }
  
  constraint c7 {
    foreach(b[i]) {
      a dist {[0:100]:/ 80, [101:255]:/ 20};			// weighted distribution
      b[i] dist {[60:100]:= 80, [169:255]:= 20};
    }
  }
  
  constraint c8 {
    foreach(b[i]) {
      a inside {[20:30]};				// unique constraint 
      b[i] inside {[12:30], 1876};
      unique {b};
    }
  }
  
  constraint c9 {
    foreach(b[i]) {
      a == 10;							// solve before constraint 
      b[i] == a + 2;
      solve a before b;
    }
  }
        
  // function to print random generated values
  function void print(string str);
    $display("\n%s", str);
    $display("a = %0d | b = %0p", a, b);
  endfunction
  
endclass

module randcase_pick_random_constraint;
  string name;
  parent p1;		// class handle
  
  initial begin
    p1 = new();		// object allocation
    
    $display("\n----------printing randcase ramdomized values----------------");
    repeat(10) begin
      
      // initialization
      p1.constraint_mode(0);		// disable all constraints
      
      // randcase to select constraints
      randcase
        1  : begin
          p1.c1.constraint_mode(1);
          name = "------------ foreach constraint ----------------";
        end
      
        20 : begin
          p1.c2.constraint_mode(1);
          name = "------------ inside constraint ----------------";
        end
      
        30 : begin
          p1.c3.constraint_mode(1);
          name = "------------ bidirectional constraint ----------------";
        end
      
        40 : begin
          p1.c4.constraint_mode(1);
          name = "------------ implication constraint ----------------";
        end
      
        50 : begin
          p1.c5.constraint_mode(1);
          name = "------------ conditional constraint ----------------";
        end
      
        60 : begin
          p1.c6.constraint_mode(1);
          name = "------------ soft constraint ----------------";
        end
      
        70 : begin
          p1.c7.constraint_mode(1);
          name = "------------ weighted distribution ----------------";
        end
      
        80 : begin
          p1.c8.constraint_mode(1);
          name = "------------ unique constraint ----------------";
        end
      
        9  : begin
          p1.c9.constraint_mode(1);
          name = "------------ solve before constraint ----------------";
        end
      
      endcase  				// case values(1, 20, 30 , ....) are weightage  --- according to the weightage each get picked and get randomized
      
      p1.randomize();		// calling randomize function for randomize
    
      p1.print(name);	
    end  
  end
endmodule