`ifndef INC_PACKET_SV
`define INC_PACKET_SV

class Packet;
    bit[3:0] sa;
    bit[3:0] da;
    rand logic[7:0] payload;
    string name;    // message for debuging

    extern function new(string name = "Packet");
    extern function void display();
    //extern function int unsigned byte_pack(ref logic[7:0] bytes[]);
    extern function void byte_unpack(logic[7:0] payload, bit[3:0] sa, bit[3:0] da);   
    extern function bit compare(Packet pkt);
endclass //Packet


function Packet::new(string name);
    this.name = name;
endfunction

function void Packet::display();
    $display("\t\t-------- PACKET ---------- ");
    $display(
        "Name: %s, Source Address: %0h, Destination Address: %0h", 
        name, sa, da
    );
    $display("Payload: ");
    $write("%3d : %02h ",3, payload);

    $display("\n\t\t-------- END PACKET ---------- ");
endfunction

// function int unsigned Packet::byte_pack(ref logic[7:0] bytes[]);   

//    bytes = new[3];
//    bytes[0] = this.sa;
//    bytes[1] = this.da;
//    bytes[2] = payload[i];

//    byte_pack = bytes.size;
// endfunction : byte_pack


function void Packet::byte_unpack(logic[7:0] payload, bit[3:0] sa, bit[3:0] da);   

    this.sa = sa;
    this.da = da;
    this.payload = payload;

endfunction : byte_unpack


function bit Packet::compare(Packet pkt);
    
    compare = 1;
    
    if(pkt == null) begin
        $display(" ** ERROR ** : pkt : received a null object ");
        compare = 0;
    end
    else begin
        if (pkt.da !== this.da)begin
            $display(" ** ERROR **: pkt : Da field did not match");
            compare = 0;
        end
        
        if(pkt.sa !== this.sa) begin
            $display(" ** ERROR **: pkt : Sa field did not match");
            compare = 0;
        end


        foreach(this.payload[i]) begin
            if(pkt.payload[i] !== this.payload[i]) begin
                $display(" ** ERROR **: pkt : Data[%0d] field did not match",i);
                compare = 0;
            end
        end
    end
    if (compare) $display( "Packets match");
endfunction : compare

`endif