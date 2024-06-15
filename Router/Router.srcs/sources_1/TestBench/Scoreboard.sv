`ifndef GUARD_SCOREBOARD
`define GUARD_SCOREBOARD

`include "Packet.sv"
typedef mailbox #(Packet) mymailbox;

class Scoreboard;
    mymailbox drvr2sb;
    mymailbox rcvr2sb;

    extern function new(mymailbox drvr2sb,mymailbox rcvr2sb);
    extern task start();
endclass

function Scoreboard::new(mymailbox drvr2sb,mymailbox rcvr2sb);
    this.drvr2sb = drvr2sb;
    this.rcvr2sb = rcvr2sb;
endfunction:new


task Scoreboard::start();
    Packet pkt_rcv,pkt_drv;
    forever begin
        rcvr2sb.get(pkt_rcv);
        $display("\n -----%0d : Scorebooard : Scoreboard received a packet from receiver -----",$time);
        drvr2sb.get(pkt_drv);
        if(pkt_rcv.compare(pkt_drv)) begin
            $display("\npkt_rcv");
            pkt_rcv.display();
            $display("\npkt_drv");
            pkt_drv.display();
            $display(" %0d : Scoreboard :Packet Matched\n",$time);
        end
        //else
            // $root.error++;
    end
endtask : start

`endif