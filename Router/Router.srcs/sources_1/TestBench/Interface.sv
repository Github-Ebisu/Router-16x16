`ifndef GUARD_INTERFACE
`define GUARD_INTERFACE


////////////////////////////////////////////
// Interface for the input side of switch.//
// Reset signal is also passed hear. //
////////////////////////////////////////////
interface input_interface(input bit clock);
    
    logic reset_n;
    logic [15:0] din;
    logic [15:0] valid_in;
    logic [15:0] frame_in;
    logic [15:0] sum_busy;

    clocking cb@(posedge clock);
        // default input #1ns output #1ns;
        
        output reset_n;
        output din;
        output valid_in;
        output frame_in;
        input sum_busy;
    endclocking

    modport IP(clocking cb, output reset_n, input clock);

endinterface

/////////////////////////////////////////////////
// Interface for the output side of the switch.//
// output_interface is for only one output port//
/////////////////////////////////////////////////

interface output_interface(input bit clock);
    
    logic [15:0] dout;
    logic [15:0] valid_out;
    logic [15:0] frame_out;

    clocking cb@(posedge clock);
        // default input #1 output #1;
        
        input dout;
        input valid_out;
        input frame_out;
    endclocking

    modport OP(clocking cb,input clock);

endinterface


//////////////////////////////////////////////////

`endif