`ifndef GUARD_ENV
`define GUARD_ENV

`include "Packet.sv"


class Environment;

    virtual input_interface.IP input_intf;
    virtual output_interface.OP output_intf;
    
    Driver driver[16];
    mymailbox drvr2sb;

    Receiver receiver[16];
    mymailbox rcvr2sb;

    Scoreboard sb;

    logic[3:0] da;

    function new (virtual input_interface.IP input_intf_new, virtual output_interface.OP output_intf_new );

        this.input_intf = input_intf_new;
        this.output_intf = output_intf_new;

        $display(" %0d : Environment : created env object",$time);

    endfunction : new

    function void build();
        $display(" %0d : Environment : start of build() method",$time);

            rcvr2sb = new(); 
            drvr2sb = new(); 

            for (int i = 0; i < 16; i++) begin
                randomize(da);  
                driver[i] = new(input_intf, drvr2sb, i, 4);
                receiver[i] = new(output_intf, rcvr2sb, i, 4);
            end


            // for(int i = 0; i < 16; i++) begin
            //     randomize(da);  
            //     driver[i]= new(input_intf, drvr2sb, i, da);
            //     receiver[i]= new(output_intf, rcvr2sb, i, da);

            // end

            sb = new(drvr2sb,rcvr2sb);

        $display(" %0d : Environment : end of build() method",$time);
    endfunction :build

    task reset();
        $display(" %0d : Environment : start of reset() method",$time);
            for (int i=0; i<16; i++) begin
                input_intf.cb.frame_in[i] <= 1;
                input_intf.cb.valid_in[i] <= 1;
                input_intf.cb.din[i] <= 1'bX;         
            end

            // Reset the DUT
            input_intf.reset_n <= 0;
            repeat (3) @ input_intf.clock;
            input_intf.reset_n <= 1;

        $display(" %0d : Environment : end of reset() method",$time);
    endtask : reset

    task cfg_dut();
        $display(" %0d : Environment : start of cfg_dut() method",$time);
            
        $display(" %0d : Environment : end of cfg_dut() method",$time);
    endtask : cfg_dut

    task start();
        $display(" %0d : Environment : start of start() method", $time);
        fork

            driver[0].start();
            driver[1].start();
            driver[2].start();
            driver[3].start();
            driver[4].start();
            driver[5].start();
            driver[6].start();
            driver[7].start();
            driver[8].start();
            driver[9].start();
            driver[10].start();
            driver[11].start();
            driver[12].start();
            driver[13].start();
            driver[14].start();
            driver[15].start();

            
            // receiver[0].start();
            // receiver[1].start();
            // receiver[2].start();
            // receiver[3].start();
            // receiver[4].start();
            // receiver[5].start();
            // receiver[6].start();
            // receiver[7].start();
            // receiver[8].start();
            // receiver[9].start();
            // receiver[10].start();
            // receiver[11].start();
            // receiver[12].start();
            // receiver[13].start();
            // receiver[14].start();
            // receiver[15].start();
            

            //Chạy tuần tự 16 receiver để nhận lần lượt 16 driver chạy cùng lúc
            foreach (receiver[i]) begin
                receiver[i].start;
            end

            sb.start();
            
        join_any
        $display(" %0d : Environment : end of start() method", $time);
    endtask : start

    task wait_for_end();
        $display(" %0d : Environment : start of wait_for_end() method",$time);
        repeat(10000) @(input_intf.clock);  
        $display(" %0d : Environment : end of wait_for_end() method",$time);
    endtask : wait_for_end


    task run();
        $display(" %0d : Environment : start of run() method",$time);
        build();
        reset();
        cfg_dut();
        start();
        wait_for_end();
        report();
        $display(" %0d : Environment : end of run() method",$time);
    endtask : run


    task report();
    endtask : report

endclass

`endif
