// simple class
class car;				// class in heap
  int year; 			
  string model;			// class - properties
endclass

module  car_info;
  
  car branch1, branch2;				// handle created (null handle)
  //class  object1(handle1), object2(handle2)
  
  initial begin
    branch1 = new();
  	branch2 = new();   // handle is allocated with object memory(class properties default values allocated)
  
  	// accessing and allocating values
  	branch1.year  = 2024;
 	branch1.model = "xyland24";
  
  	branch2.year  = 2015;
 	branch2.model = "dayon15";
  
    $display("\n------ BRANCH1 (object) --------");
    $display("$Time = %0t | year = %0d | model = %0s", $time, branch1.year, branch1.model);
    
    $display("------ BRANCH2 (object) --------");
    $display("$Time = %0t | year = %0d | model = %0s\n", $time, branch2.year, branch2.model);
  end
endmodule