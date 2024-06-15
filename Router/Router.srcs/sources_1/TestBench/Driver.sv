`ifndef GUARD_DRIVER
`define GUARD_DRIVER

`include "Global.sv"


class Driver;
    virtual input_interface.IP input_intf;
    mymailbox drvr2sb;
    Packet pkt;
    bit[3:0] sa;   
    bit[3:0] da;

    extern function new(virtual input_interface.IP input_intf_new, mymailbox drvr2sb, bit[3:0] sa, bit[3:0] da);
    extern virtual task start();

endclass

//// constructor method ////
function Driver::new(virtual input_interface.IP input_intf_new, mymailbox drvr2sb, bit[3:0] sa, bit[3:0] da);
    
    this.input_intf = input_intf_new;
    if(drvr2sb == null) begin
        $display(" **ERROR**: drvr2sb is null");
        $finish;
    end
    else begin
        this.sa = sa;
        this.da = da;
        this.drvr2sb = drvr2sb;
        pkt = new("Driver");
    end

endfunction : new

/// method to send the packet to DUT ////////
task Driver::start();
    logic[7:0] payload;

    // repeat(4) begin
        // repeat(3) @(posedge input_intf.clock);
        @(posedge input_intf.clock);
        //// Randomize the packet /////
        if (pkt.randomize())  begin
            $display ("\n------ %0d : Driver : Randomization Successes full. ------",$time);
            //// display the packet content ///////
            pkt.sa = sa;
            pkt.da = da;
            pkt.display();
            payload = pkt.payload;

            //// Pack the packet in tp stream of bytes //////
           //length = pkt.byte_pack(payload);   

            ///// Start transmission //////
            
            for(int i = 0; i < 4; i++) begin    // Address State : State 1 -> 4
                @(posedge input_intf.clock);
                input_intf.cb.frame_in[sa] <= 0;    
                input_intf.cb.valid_in[sa] <= 0;   
                input_intf.cb.din[sa] <= da[i];
            end
            
            @(posedge input_intf.clock); // Padding State : State 5
                input_intf.cb.frame_in[sa] <= 0;    
                input_intf.cb.valid_in[sa] <= 0;   
                input_intf.cb.din[sa] <=  1'bX;

            while (input_intf.cb.sum_busy[sa] == 0) begin   // Waiting
                @(posedge input_intf.clock);
                input_intf.cb.frame_in[sa] <= 0;    
                input_intf.cb.valid_in[sa] <= 0;   
                input_intf.cb.din[sa] <=  1'bX;
            end

            foreach(payload[i]) begin   // Data State
                @(posedge input_intf.clock);
                input_intf.cb.frame_in[sa] <= 0;    
                input_intf.cb.valid_in[sa] <= 0;   
                input_intf.cb.din[sa] <=  payload[i];
            end

            //// End transmission //////
            @(posedge input_intf.clock);
            input_intf.cb.frame_in[sa] <= 1;
            input_intf.cb.valid_in[sa] <= 1;
            input_intf.cb.din[sa] <= 0;

            // Push the packet in to mymailbox for scoreboard /////
            drvr2sb.put(pkt);

            $display("------ %0d : Driver : Finished Driving the packet with length %0d ------\n",$time,8);
        end
        
        else begin
            $display ("------ %0d Driver : ** Randomization failed. ** ------\n",$time);
            ////// Increment the error count in randomization fails ////////
            //$root.error++;
        end
   // end
endtask


`endif
