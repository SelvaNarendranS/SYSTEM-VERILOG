module way2_signal(
  input clk, rst,
  input start,
  output [2:0] east_signal,
  output [2:0] west_signal,
  output walk_n2s
);

  reg [4:0]timer32;
  reg [2:0]timer8;
  reg rd, ylw, grn;

  localparam [1:0]  IDLE = 0,
  					RED = 1,
  					YELLOW = 2,
  					GREEN = 3;
  reg [1:0] state, nxt_state;

  // sequential block
  always @(posedge clk or posedge rst) begin
    if(rst) begin
      state <= IDLE;
      timer32 <= 0;
      timer8 <= 0;
    end

    else begin
      state <= nxt_state;

      case(state)
        IDLE : begin
          timer32 <= 0;
          timer8 <= 0;
        end

        RED : begin
          if(nxt_state != RED)
            timer32 <= 0;
          else
            timer32 <= timer32 + 1'b1;
        end

        YELLOW : begin
          if(nxt_state != YELLOW)
            timer8 <= 0;
          else
            timer8 <= timer8 + 1'b1;
        end

        GREEN : begin
          if(nxt_state != GREEN)
            timer32 <= 0;
          else
            timer32 <= timer32 + 1'b1;
        end

        default : begin
          timer32 <= 0;
          timer8 <= 0;
        end

      endcase
    end
  end

  // combinational block
  always @(*) begin
    
    // setting default 
    nxt_state = IDLE;
    rd = 0;
    ylw = 0;
    grn = 0;

    case(state)
      IDLE : begin
        rd = 1;
        nxt_state = (start) ? RED : IDLE;
      end

      RED : begin
        rd = 1;
        nxt_state = (timer32 > 23) ? YELLOW : RED;
      end

      YELLOW : begin
        ylw = 1;
        nxt_state = (timer8 > 4) ? GREEN : YELLOW;
      end

      GREEN : begin
        grn = 1;
        nxt_state = (timer32 > 30) ? RED : GREEN;
      end
      
      default: nxt_state = IDLE;
      
    endcase
  end


  assign east_signal[0] = rd;
  assign east_signal[1] = ylw;
  assign east_signal[2] = grn;

  assign west_signal[0] = rd;
  assign west_signal[1] = ylw;
  assign west_signal[2] = grn;

  assign walk_n2s = rd;		// Pedestrian walk for nort south direction when red is on on east and west
  
  sequence reset;
    @(posedge clk) (east_signal == 3'd1) && (west_signal == 3'd1) && (walk_n2s == 1'd1);
  endsequence 

  property reset_check;
    @(posedge clk) (rst) |-> reset;
  endproperty

  assert property(reset_check)
    $display("RESET : passed");
  else
    $error("RESET : failed");
    
  // light movement
  property light_mov;
    @(posedge clk) (!rst && $rose(start)) |=> 
    
    // red signal
    (((east_signal[0] == 1'b1) && (west_signal[0] == 1'b1))[*25]) ##1
    
    // yellow signal
    (((east_signal[1] == 1'b1) && (west_signal[1] == 1'b1))[*6])  ##1
    
    // green signal
    (((east_signal[2] == 1'b1) && (west_signal[2] == 1'b1))[*32]);
  endproperty
    
  assert property(light_mov)
    $display("traffic signal : passed");
  else
    $error("traffic Signal : failed");


   property walk_disable_if;
    @(posedge clk) disable iff (rst)
    (state == GREEN) |-> (walk_n2s == 1'b0);
  endproperty
    
  assert property(walk_disable_if)
    $display("walk_disabled : Passed");
  else
    $display("walk_disabled : Failed");
endmodule


