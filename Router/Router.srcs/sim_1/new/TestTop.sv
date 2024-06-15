`timescale 1ns/100ps
module TestTop ;
    parameters simulation_cycle = 100;
    bit SystemClock;
    
    Router_io top_io(SystemClock);

    test_extra testbech(top_io);
    logic [2:0] current_state[15:0];
    logic [3:0] address[15:0];

    Router dut (
        .clock(top_io.clock),
        .din(top_io.din),
        .valid_in(top_io.valid_in),
        .frame_in(top_io.frame_in),
        
        .dout(top_io.dout),
        .valid_out(top_io.valid_out),
        .frame_out(top_io.frame_out),

        .current_state(current_state),
        .address(address),
        .sum_not_busy(top_io.sum_not_busy)
    );

    initial begin
        SystemClock = 0;
        forever begin
            #(simulation_cycle/2)
            SystemClock = ~SystemClock;
        end
    end

    
endmodule