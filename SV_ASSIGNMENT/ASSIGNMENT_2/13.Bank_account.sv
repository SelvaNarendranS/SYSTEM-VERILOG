//  Define a base class BankAccount with a protected member balance and methods to deposit() and withdraw() money. Create a derived class SavingsAccount that modifies balance with interest after a withdrawal. Add a display_balance() method in Savings Account that uses the protected balance variable. 

// base class
class Bank_Account;
  protected real balance;		// protected means the variable is only visible to the base class and the exteded class only
  
  function new(int balance = 0);
    this.balance = balance;
  endfunction
  
  // function deposit
  function void deposit(int amount);
    balance += amount;
  endfunction
  
  // function withdraw
  function void withdraw(int amount);
    if(balance > amount)
      balance -= amount;
  endfunction
  
endclass

// extended class  -- child class
class Savings_Account extends Bank_Account;
  local int interest = 5;
  
  function new(int b = 0);
    super.new(b);
  endfunction
  
  // overriting the function with interst calculation
  function void withdraw(int amount);
    real fee;
    super.withdraw(amount);
    if(balance > amount)  begin
      fee = (amount * (interest / 100.00));
      balance -= fee;
      $display("Withdrawal: %0.3f | Fee: %0.3f", amount, fee);
      display_balance(0);		// calling display function
    end
    else
      display_balance(1);		// calling display function
  endfunction
    
  function void display_balance(bit error = 0);
    if(error == 1) begin
      $display(" Insufficient Balance -- Account balance = %0.3f", balance);
    end
    else
      $display("Savings account balance = %0.3f", balance);
  endfunction
  
endclass

module user_account;
  
  Savings_Account sa;			// child class handle
  
  initial begin
    
    $display("--- Creating Account with 5000 ---");
    sa = new(5000);			// object allocation
    sa.display_balance(0);		// calling display function
    
    $display("\n--- Deposit Account with 3000 ---");
    sa.deposit(3000);		// calling deposit function inside base class from child handle
    
    sa.display_balance(0);		// calling display function
    
    $display("\n--- Withdraw amount in Account with 4000 ---");
    sa.withdraw(3553);		// calling withdraw function in child handle
    
    $display("\n--- Withdraw amount in Account with 5000 ---");
    sa.withdraw(4500);
  end
  
endmodule
