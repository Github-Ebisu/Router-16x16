`ifndef GUARD_TOP
`define GUARD_TOP

module top();

    /////////////////////////////////////////////////////
    // Clock Declaration and Generation //
    /////////////////////////////////////////////////////
    bit Clock;

    initial
    forever #10 Clock = ~Clock;

    /////////////////////////////////////////////////////
    // Input interface instance //
    /////////////////////////////////////////////////////

    input_interface input_intf(Clock);

    /////////////////////////////////////////////////////
    // output interface instance //
    /////////////////////////////////////////////////////

    output_interface output_intf(Clock);

    /////////////////////////////////////////////////////
    // Program block Testcase instance //
    /////////////////////////////////////////////////////

    testcase TC (input_intf,output_intf);

    /////////////////////////////////////////////////////
    // DUT instance and signal connection //
    /////////////////////////////////////////////////////


    Router DUT (
        .clock(Clock),
        .reset_n(input_intf.reset_n),

        .din(input_intf.din),
        .valid_in(input_intf.valid_in),
        .frame_in(input_intf.frame_in),

        .dout(output_intf.dout),
        .valid_out(output_intf.valid_out),
        .frame_out(output_intf.frame_out),

        .sum_busy(input_intf.sum_busy)
    );


endmodule


`endif