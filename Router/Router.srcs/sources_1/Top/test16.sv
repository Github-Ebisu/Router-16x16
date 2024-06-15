`timescale 1ns / 1ps
module test;

    // Parameters
    parameter CLK_PERIOD = 20; // Clock period in time units

    // Signals
    logic clock;
    logic reset_n;
    logic [15:0] din;
    logic [15:0] valid_in;
    logic [15:0] frame_in;
    logic [15:0] dout;
    logic [15:0] valid_out;
    logic [15:0] frame_out;
    logic [15:0] sum_busy;


    // Instantiate the top module
    Router router_instance (
        .clock(clock),
        .reset_n(reset_n),
        .din(din),
        .valid_in(valid_in),
        .frame_in(frame_in),
        
        .dout(dout),
        .valid_out(valid_out),
        .frame_out(frame_out),


        .sum_busy(sum_busy)
    );

    // Clock generation
    always #((CLK_PERIOD)/2) clock = ~clock;

 //   Testbench stimulus
    initial begin
        clock = 0;

        // Test input values
        reset_n = 0;

        // Reset the system
        #30
        reset_n = 1;
        din[0] = 1;
        din[7] = 1;
        din[8] = 1;
        valid_in = 16'h0000;
        frame_in[0] = 0;
        frame_in[7] = 0;
        frame_in[8] = 0;
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_busy = %h", 
                  $time, dout, valid_out, frame_out, sum_busy);

        // First transmit block
        #20
        din[0] = 1;
        din[7] = 1;
        din[8] = 1;
        valid_in = 16'h0000;
        frame_in[0] = 0;
        frame_in[7] = 0;
        frame_in[8] = 0;
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_busy = %h", 
                  $time, dout, valid_out, frame_out, sum_busy);

        // First transmit block
        #20
        din[0] = 0;
        din[7] = 0;
        din[8] = 0;
        valid_in = 16'h0000;
        frame_in[0] = 0;
        frame_in[7] = 0;
        frame_in[8] = 0;
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_busy = %h", 
                  $time, dout, valid_out, frame_out, sum_busy);

        
        // First transmit block
        #20
        din[0] = 0;
        din[7] = 0;
        din[8] = 0;
        valid_in = 16'h0000;
        frame_in[0] = 0;
        frame_in[7] = 0;
        frame_in[8] = 0;
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_busy = %h", 
                  $time, dout, valid_out, frame_out, sum_busy);

        // Padding block
        #20
        din = 16'hxxxx;  
        valid_in = 16'h0000;
        frame_in[0] = 0;
        frame_in[7] = 0;
        frame_in[8] = 0;
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_busy = %h", 
                  $time, dout, valid_out, frame_out, sum_busy);

        // Transmit Data with wait logic
        #20
        frame_in[0] = 0;
        frame_in[7] = 0;
        frame_in[8] = 0;
        valid_in = 16'h0000;

        foreach(sum_busy[i]) begin
            if(sum_busy[i] == 1) begin
                din[i] = 1'b1;
            end
            if (sum_busy[i] == 0) din[i] = 1'bX; // Set the input data bit to 1
        end

        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_busy = %h", 
                  $time, dout, valid_out, frame_out, sum_busy);


        // Transmit Data with wait logic
        #20
        frame_in[0] = 0;
        frame_in[7] = 0;
        frame_in[8] = 0;
        valid_in = 16'h0000;

        foreach(sum_busy[i]) begin
            if(sum_busy[i] == 1) begin
                din[i] = 1'b1;
            end
            if (sum_busy[i] == 0) din[i] = 1'bX; // Set the input data bit to 1
        end

        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_busy = %h", 
                  $time, dout, valid_out, frame_out, sum_busy);


        // Close state 01
        #20
        frame_in[0] = 1;
        frame_in[7] = 0;
        frame_in[8] = 0;
        valid_in = 16'h0000;
        
        foreach(sum_busy[i]) begin
            if(sum_busy[i] == 1) begin
                din[i] = 1'b0;
            end
            if (sum_busy[i] == 0) din[i] = 1'bX; // Set the input data bit to 1
        end

        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_busy = %h", 
                  $time, dout, valid_out, frame_out, sum_busy);


        // Close state 02 // Stage chuuyển tiếp
        #20
        frame_in[0] = 1;
        frame_in[7] = 0;
        frame_in[8] = 0;
        valid_in = 16'h0000;
        
        foreach(sum_busy[i]) begin
            din[i] = 1'bX;
        end
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_busy = %h", 
                  $time, dout, valid_out, frame_out, sum_busy);

        
        // Transmot 07
        // Normal block
        #20
        frame_in[0] = 1;
        frame_in[7] = 0;
        frame_in[8] = 0;
        valid_in = 16'h0000;

        foreach(sum_busy[i]) begin
            if(sum_busy[i] == 1) begin
                din[i] = 1'b0; // Set the input data bit to unknown
            end
            if (sum_busy[i] == 0) din[i] = 1'bX; // Set the input data bit to 1
        end

        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_busy = %h", 
                  $time, dout, valid_out, frame_out, sum_busy);


        // Normal block
        #20
        frame_in[0] = 1;
        frame_in[7] = 0;
        frame_in[8] = 0;        
        valid_in = 16'h0000;

        foreach(sum_busy[i]) begin
            if(sum_busy[i] == 1) begin
                din[i] = 1'b1; // Set the input data bit to unknown
            end
            if (sum_busy[i] == 0) din[i] = 1'bX; // Set the input data bit to 1
        end

        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_busy = %h", 
                  $time, dout, valid_out, frame_out, sum_busy);



        // Close state 01
        #20
        frame_in[0] = 1;
        frame_in[7] = 1;
        frame_in[8] = 0;
        valid_in = 16'h0000;
        
        foreach(sum_busy[i]) begin
            din[i] = 1'bX;
        end

        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_busy = %h", 
                  $time, dout, valid_out, frame_out, sum_busy);


        // Close state 02
        #20
        frame_in[0] = 1;
        frame_in[7] = 1;
        frame_in[8] = 0;
        valid_in = 16'h0000;
        
        foreach(sum_busy[i]) begin
            din[i] = 1'bX;
        end

        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_busy = %h", 
                  $time, dout, valid_out, frame_out, sum_busy);


        // Transmit 8
        #20
        frame_in[0] = 1;
        frame_in[7] = 1;
        frame_in[8] = 0; 
        valid_in = 16'h0000;

        foreach(sum_busy[i]) begin
            if(sum_busy[i] == 1) begin
                din[i] = 1'b1; // Set the input data bit to unknown
            end
            if (sum_busy[i] == 0) din[i] = 1'bX; // Set the input data bit to 1
        end

        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_busy = %h", 
                  $time, dout, valid_out, frame_out, sum_busy);


        // Normal block
        #20
        frame_in[0] = 1;
        frame_in[7] = 1;
        frame_in[8] = 0; 
        valid_in = 16'h0000;

        foreach(sum_busy[i]) begin
            if(sum_busy[i] == 1) begin
                din[i] = 1'b1; // Set the input data bit to unknown
            end
            if (sum_busy[i] == 0) din[i] = 1'bX; // Set the input data bit to 1
        end

        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_busy = %h", 
                  $time, dout, valid_out, frame_out, sum_busy);


        #20
        frame_in[0] = 1;
        frame_in[7] = 1;
        frame_in[8] = 1; 
        valid_in = 16'h0000;

        foreach(sum_busy[i]) begin
            if(sum_busy[i] == 1) begin
                din[i] = 1'b1; // Set the input data bit to unknown
            end
            if (sum_busy[i] == 0) din[i] = 1'bX; // Set the input data bit to 1
        end

        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_busy = %h", 
                  $time, dout, valid_out, frame_out, sum_busy);

        // End block
        #20
        din = 16'h0000;
        valid_in = 16'h0000;
        frame_in = 16'hFFFF;
        $display("time = %0d ns, dout = %h, valid_out = %h, frame_out = %h, sum_busy = %h", 
                  $time, dout, valid_out, frame_out, sum_busy);

        // End simulation
        #20 
        $finish;
    end

 endmodule