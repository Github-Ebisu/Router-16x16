`ifndef GUARD_RECEIVER
`define GUARD_RECEIVER


class Receiver;
    logic [7:0] payload;
    virtual output_interface.OP output_intf;
    mymailbox rcvr2sb;

    // Sa, da ở đây thể hiện recevier dành cho driver có sa nào và xuất ra ở cổng da nào
    // Tư đó ta có, nếu 16 sa truyền cho 16 da khác nhau thì ta mở 16 da.
    // Nếu 16 sa cùng truyền cho 1 da, thì ta tạo 16 cái receiver mở đúng 1 cổng da đó 16 lần.
    bit [3:0] sa;
    bit [3:0] da;

    extern function new(virtual output_interface.OP output_intf_new,mymailbox rcvr2sb, bit[3:0] sa, bit[3:0] da);
    extern virtual task start();
endclass

//// constructor method ////
function Receiver::new(virtual output_interface.OP output_intf_new,mymailbox rcvr2sb, bit[3:0] sa, bit[3:0] da);
    this.output_intf = output_intf_new ;
    if(rcvr2sb == null) begin
        $display(" **ERROR**: rcvr2sb is null");
        $finish;
    end
    else
        this.rcvr2sb = rcvr2sb;
        this.sa = sa;
        this.da = da;
endfunction : new

task Receiver::start();
    int count = 0;
    //repeat(2) begin
        Packet pkt;
        integer i = 7;
        //$display(" %0d : Count %d, frame out: %b",$time, count, output_intf.cb.frame_out[da]);
        while (output_intf.cb.frame_out[da] != 0) begin
            @(posedge output_intf.clock);
        end
        //$display(" %0d : Receiver after %0d : Received data",$time, da);
        //$display(" %0d : 02 Count %d, frame out: %b",$time, count, output_intf.cb.frame_out[da]);

        repeat(2)@(posedge output_intf.clock);
        while (output_intf.cb.frame_out[da] == 0 && i >= 0) begin
            @(posedge output_intf.clock);
            //$display(" %0d : Receiver at %0d : %b , i = %d",$time, da,  output_intf.cb.dout[da], i);
            this.payload[i] = output_intf.cb.dout[da];
            i = i - 1;
        end
        count = count + 1;
        $display ("\n------ %0d : Receiver : Received Successes full. ------",$time);
   
        // foreach (payload[i]) begin
        //     $display(" %0d : Payload[i] %h ",$time, payload[i]);
        // end

        @(posedge output_intf.clock);
        pkt = new("Receiver");
        pkt.byte_unpack(payload, sa, da);
        //pkt.display();
        rcvr2sb.put(pkt);
        $display("------ %0d :  Receiver : Finished  Receiving the packet with length %0d ------\n",$time,8);

    //end
 

endtask : start


`endif