`timescale 1ns / 1ps
module test;

    // Parameters
    parameter CLK_PERIOD = 20; // Clock period in time units

    // Signals
    logic clock;
    logic [15:0] din;
    logic [15:0] valid_in;
    logic [15:0] frame_in;
    logic [15:0] dout;
    logic [15:0] valid_out;
    logic [15:0] frame_out;
    logic [15:0] sum_not_busy;
    logic [2:0] current_state[15:0];
    logic [3:0] address[15:0];

    // Instantiate the top module
    Router router_instance (
        .clock(clock),
        .din(din),
        .valid_in(valid_in),
        .frame_in(frame_in),
        
        .dout(dout),
        .valid_out(valid_out),
        .frame_out(frame_out),

        .current_state(current_state),
        .address(address),
        .sum_not_busy(sum_not_busy)
    );

    // Clock generation
    always #((CLK_PERIOD)/2) clock = ~clock;

    // Testbench stimulus
    initial begin
        clock = 0;

        // Test input values
        din = 16'h0000;
        valid_in = 16'h0000;
        frame_in = 16'hFFFF;

        // Test case 1 : Transmit 1 port
        #20;
        // Print out results
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);


        // Transmit address  0->F to 0->F
        #30 
        din = 16'hAAAA;
        valid_in = 16'h0000;
        frame_in = 16'h0000;
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        
        #15 
        din = 16'hCCCC;
        valid_in = 16'h0000;
        frame_in = 16'h0000;
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        
        #20 
        din = 16'hF0F0;
        valid_in = 16'h0000;
        frame_in = 16'h0000;
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        
        #20 
        din = 16'hFF00;
        valid_in = 16'h0000;
        frame_in = 16'h0000;
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        // End transmit address



        // Padding: Current State 5
        #20 
        din = 16'hXXXX;  
        valid_in = 16'h0000;
        frame_in = 16'h0000;
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        // Transmit Data
        #20
        frame_in = 16'h0000;
        valid_in = 16'h0000;
        for(int i = 0; i < 16; i++) begin
          if (sum_not_busy[i] == 1) begin
            din[i] = 1'b1;
          end
          else if (sum_not_busy[i] == 0) begin
            din[i] = 1'bX;
          end
        end
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        
        #20 
        frame_in = 16'h0000;
        valid_in = 16'h0000;
        for(int i = 0; i < 16; i++) begin
          if (sum_not_busy[i] == 1) begin
            din[i] = 1'b1;
          end
          else if (sum_not_busy[i] == 0) begin
            din[i] = 1'bX;
          end
        end
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        
        #20
        frame_in = 16'h0000;
        valid_in = 16'h0000;
        for(int i = 0; i < 16; i++) begin
          if (sum_not_busy[i] == 1) begin
            din[i] = 1'b1;
          end
          else if (sum_not_busy[i] == 0) begin
            din[i] = 1'bX;
            valid_in = 1'b0;
            frame_in = 1'b0;
          end
        end
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);
      
        #20
        frame_in = 16'h0000;
        valid_in = 16'h0000;
        for(int i = 0; i < 16; i++) begin
          if (sum_not_busy[i] == 1) begin
            din[i] = 1'b1;
          end
          else if (sum_not_busy[i] == 0) begin
            din[i] = 1'bX;
            valid_in = 1'b0;
            frame_in = 1'b0;
          end
        end
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        
        // Valid = 1
        #20
        frame_in = 16'h0000;
        valid_in = 16'hFFFF;
        for(int i = 0; i < 16; i++) begin
          if (sum_not_busy[i] == 1) begin
            din[i] = 1'b1;
          end
          else if (sum_not_busy[i] == 0) begin
            din[i] = 1'bX;
            valid_in = 1'b0;
            frame_in = 1'b0;
          end
        end
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        // Valid = 1
        #20
        frame_in = 16'h0000;
        valid_in = 16'hFFFF;
        for(int i = 0; i < 16; i++) begin
          if (sum_not_busy[i] == 1) begin
            din[i] = 1'b1;
          end
          else if (sum_not_busy[i] == 0) begin
            din[i] = 1'bX;
            valid_in = 1'b0;
            frame_in = 1'b0;
          end
        end
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        
        // Normal
        #20 
        frame_in = 16'h0000;
        valid_in = 16'h0000;
        for(int i = 0; i < 16; i++) begin
          if (sum_not_busy[i] == 1) begin
            din[i] = 1'b0;
          end
          else if (sum_not_busy[i] == 0) begin
            din[i] = 1'bX;
            valid_in = 1'b0;
            frame_in = 1'b0;
          end
        end
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        
        #20 
        frame_in = 16'h0000;
        valid_in = 16'h0000;
        for(int i = 0; i < 16; i++) begin
          if (sum_not_busy[i] == 1) begin
            din[i] = 1'b0;
          end
          else if (sum_not_busy[i] == 0) begin
            din[i] = 1'bX;
            valid_in = 1'b0;
            frame_in = 1'b0;
          end
        end
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        
        // End
        #20 
        din = 16'h0000;
        valid_in = 16'h0000;
        frame_in = 16'hFFFF;
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        #20 
        din = 16'h0000;
        valid_in = 16'h0000;
        frame_in = 16'hFFFF;
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        
        // Test case 2 : Transmit 3 port 
        #20
        din = 16'hAAAA;
        valid_in = 16'h0000;
        frame_in = 16'hFF0F;
        // Print out results
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        $display("Start test case 2: time = %0d ns", $time);

        // Transmit address
        #20
        din = 16'hAAAA;
        valid_in = 16'h0000;
        frame_in = 16'hFF0F;
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        
        #20
        din = 16'hAAAA;
        valid_in = 16'h0000;
        frame_in = 16'hFF0F;
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        
        #20
        din = 16'hAAAA;
        valid_in = 16'h0000;
        frame_in = 16'hFF0F;
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        
        #20
        din = 16'hAAAA;
        valid_in = 16'h0000;
        frame_in = 16'hFF0F;
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        // End transmit address

        // Padding: Current State 5
        #20 
        din = 16'hXXXX;  
        valid_in = 16'h0000;
        frame_in = 16'h0000;
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        // Transmit Data
        #20 
        frame_in = 16'h0000;
        valid_in = 16'h0000;
        for(int i = 0; i < 16; i++) begin
          if (sum_not_busy[i] == 1) begin
            din[i] = 1'b1;
          end
          else if (sum_not_busy[i] == 0) begin
            din[i] = 1'bX;
          end
        end
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        
        #20 
        frame_in = 16'h0000;
        valid_in = 16'h0000;
        for(int i = 0; i < 16; i++) begin
          if (sum_not_busy[i] == 1) begin
            din[i] = 1'b1;
          end
          else if (sum_not_busy[i] == 0) begin
            din[i] = 1'bX;
          end
        end
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        
        #20 
        frame_in = 16'h0000;
        valid_in = 16'h0000;
        for(int i = 0; i < 16; i++) begin
          if (sum_not_busy[i] == 1) begin
            din[i] = 1'b1;
          end
          else if (sum_not_busy[i] == 0) begin
            din[i] = 1'bX;
          end
        end
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        #20 
        frame_in = 16'h0000;
        valid_in = 16'h0000;
        for(int i = 0; i < 16; i++) begin
          if (sum_not_busy[i] == 1) begin
            din[i] = 1'b1;
          end
          else if (sum_not_busy[i] == 0) begin
            din[i] = 1'bX;
          end
        end
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        
        // Valid = 1
        #20
        frame_in = 16'h0000;
        valid_in = 16'hFFFF;
        for(int i = 0; i < 16; i++) begin
          if (sum_not_busy[i] == 1) begin
            din[i] = 1'b1;
          end
          else if (sum_not_busy[i] == 0) begin
            din[i] = 1'bX;
            valid_in = 1'b0;
            frame_in = 1'b0;
          end
        end
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        // Valid = 1
        #20
        frame_in = 16'h0000;
        valid_in = 16'hFFFF;
        for(int i = 0; i < 16; i++) begin
          if (sum_not_busy[i] == 1) begin
            din[i] = 1'b1;
          end
          else if (sum_not_busy[i] == 0) begin
            din[i] = 1'bX;
            valid_in = 1'b0;
            frame_in = 1'b0;
          end
        end
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        
        // Normal
        #20 
        frame_in = 16'h0000;
        valid_in = 16'h0000;
        for(int i = 0; i < 16; i++) begin
          if (sum_not_busy[i] == 1) begin
            din[i] = 1'b0;
          end
          else if (sum_not_busy[i] == 0) begin
            din[i] = 1'bX;
          end
        end
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        
        #20 
        frame_in = 16'h0000;
        valid_in = 16'h0000;
        for(int i = 0; i < 16; i++) begin
          if (sum_not_busy[i] == 1) begin
            din[i] = 1'b0;
          end
          else if (sum_not_busy[i] == 0) begin
            din[i] = 1'bX;
          end
        end
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        
        // End
        #20 
        din = 16'h0000;
        valid_in = 16'h0000;
        frame_in = 16'hFFFF;
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        // End
        #20 
        din = 16'h0000;
        valid_in = 16'h0000;
        frame_in = 16'hFFFF;
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        // End
        #20 
        din = 16'h0000;
        valid_in = 16'h0000;
        frame_in = 16'hFFFF;
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        // End
        #20 
        din = 16'h0000;
        valid_in = 16'h0000;
        frame_in = 16'hFFFF;
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        
        // Transmit for port 3
        #20 
        din = 16'h1001;
        valid_in = 16'h0000;
        frame_in = 16'h0010;
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        
        #20 
        din = 16'h1001;
        valid_in = 16'h0000;
        frame_in = 16'h0010;
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        
        #20 
        din = 16'h0100;
        valid_in = 16'h0000;
        frame_in = 16'h0010;
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);

        

        #20 
        din = 16'h1101;
        valid_in = 16'h0000;
        frame_in = 16'h0010;
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_not_busy = %h", $time, dout, valid_out, frame_out, sum_not_busy);


        // End simulation
        #20 
        $finish;
    end
 
endmodule