`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2024 12:03:24 PM
// Design Name: 
// Module Name: Logic_out
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Logic_out(
    input logic [15:0] din,
    input logic [15:0] valid_in,
    input logic [15:0] frame_in,
    input logic [15:0] finished_in,
    output logic [15:0] busy,
    output logic dout,
    output logic valid_out,
    output logic frame_out
);
always_comb begin
        if (frame_in[0] == 0 || finished_in[0] == 1) begin
            dout = din[0];
            busy = 16'h0001;
            valid_out = valid_in[0];
            frame_out = frame_in[0];
        end
        else if (frame_in[1] == 0 || finished_in[1] == 1) begin
            dout = din[1];
            busy = 16'h0002;
            valid_out = valid_in[1];
            frame_out = frame_in[1];
        end
        else if (frame_in[2] == 0 || finished_in[2] == 1) begin
            dout = din[2];
            busy = 16'h0004;
            valid_out = valid_in[2];
            frame_out = frame_in[2];            
        end
        else if (frame_in[3] == 0 || finished_in[3] == 1) begin
            dout = din[3];
            busy = 16'h0008;
            valid_out = valid_in[3];
            frame_out = frame_in[3];            
        end
        else if (frame_in[4] == 0 || finished_in[4] == 1) begin
            dout = din[4];
            busy = 16'h0010;
            valid_out = valid_in[4];
            frame_out = frame_in[4];
        end
        else if (frame_in[5] == 0 || finished_in[5] == 1) begin
            dout = din[5];
            busy = 16'h0020;
            valid_out = valid_in[5];
            frame_out = frame_in[5];
        end
        else if (frame_in[6] == 0 || finished_in[6] == 1) begin
            dout = din[6];
            busy = 16'h0040;
            valid_out = valid_in[6];
            frame_out = frame_in[6];            
        end
        else if (frame_in[7] == 0 || finished_in[7] == 1) begin
            dout = din[7];
            busy = 16'h0080;
            valid_out = valid_in[7];
            frame_out = frame_in[7];            
        end
        else if (frame_in[8] == 0 || finished_in[8] == 1) begin
            dout = din[8];
            busy = 16'h0100;
            valid_out = valid_in[8];
            frame_out = frame_in[8];
        end
        else if (frame_in[9] == 0 || finished_in[9] == 1) begin
            dout = din[9];
            busy = 16'h0200;
            valid_out = valid_in[9];
            frame_out = frame_in[9];
        end
        else if (frame_in[10] == 0 || finished_in[10] == 1) begin
            dout = din[10];
            busy = 16'h0400;
            valid_out = valid_in[10];
            frame_out = frame_in[10];            
        end
        else if (frame_in[11] == 0 || finished_in[11] == 1) begin
            dout = din[11];
            busy = 16'h0800;
            valid_out = valid_in[11];
            frame_out = frame_in[11];            
        end
        else if (frame_in[12] == 0 || finished_in[12] == 1) begin
            dout = din[12];
            busy = 16'h1000;
            valid_out = valid_in[12];
            frame_out = frame_in[12];
        end
        else if (frame_in[13] == 0 || finished_in[13] == 1) begin
            dout = din[13];
            busy = 16'h2000;
            valid_out = valid_in[13];
            frame_out = frame_in[13];
        end
        else if (frame_in[14] == 0 || finished_in[14] == 1) begin
            dout = din[14];
            busy = 16'h4000;
            valid_out = valid_in[14];
            frame_out = frame_in[14];            
        end
        else if (frame_in[15] == 0 || finished_in[15] == 1) begin
            dout = din[15];
            busy = 16'h8000;
            valid_out = valid_in[15];
            frame_out = frame_in[15];            
        end
        else begin
            dout = 1'bX;
            busy = 16'h0000;
            valid_out = 1'bX;
            frame_out = 1'b1;      
        end
        
    end
endmodule
