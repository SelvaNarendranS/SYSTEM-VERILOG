// clocking block - individual skew
// design
module xor_gate(
  input logic a, b, clk,
  output logic z);
  
  always @(posedge clk) begin
    z <= a ^ b;
  end
  
endmodule