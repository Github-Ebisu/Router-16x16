`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2024 07:59:48 AM
// Design Name: 
// Module Name: FSM
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


module Logic_in (
    input logic clock,
    input logic reset_n,

    input logic din,
    input logic valid_in,
    input logic frame_in,
    input logic [15:0] busy,

    output logic[15:0] dout,
    output logic [15:0] valid_out,
    output logic [15:0] frame_out,
    output logic [15:0] finished_out,

    output logic sum_busy
);
    


    localparam idle = 3'd0;
    localparam rcv_addr1 = 3'd1;
    localparam rcv_addr2 = 3'd2;
    localparam rcv_addr3 = 3'd3;
    localparam rcv_addr4 = 3'd4;
    localparam waiting_for_connection = 3'd5;
    localparam connection = 3'd6;
    localparam close_transmission  = 3'd7;

    bit[2:0] current_state = idle;
    bit[2:0] next_state = idle;
    logic[3:0] address;

    bit temp = 1'b0;

    // Current state memory
    always_ff @( posedge clock or negedge reset_n) begin
        if (!reset_n) begin
            current_state = idle;
        end
        else begin
            current_state = next_state; // Blocking for sequence
            if (current_state == rcv_addr1) address[0] = din;
            else if (current_state == rcv_addr2) address[1] = din;
            else if (current_state == rcv_addr3) address[2] = din;
            else if (current_state == rcv_addr4) address[3] = din;
            else if (current_state == idle) address = 4'bX;  
        end


    end

    // Next state logic
    always_comb begin 
        if (frame_in == 0) begin
            case (current_state)
                idle: begin
                    next_state = rcv_addr1; 
                end
                rcv_addr1: begin
                    next_state = rcv_addr2;
                end
                rcv_addr2: begin
                    next_state = rcv_addr3; 
                end 
                rcv_addr3: begin
                    next_state = rcv_addr4;
                end  
                rcv_addr4: begin
                    next_state = waiting_for_connection;
                end
                
                waiting_for_connection:
                    if(sum_busy == 1) next_state = connection;

                connection:
                    next_state = connection;

                default: next_state = idle;
            endcase
        end
        else if (frame_in == 1) begin
            case (current_state)
                idle: next_state = idle;
                close_transmission: next_state = idle; 
                default: next_state = close_transmission;
            endcase
        end 
    end

    // Output logic
    always_ff @( posedge clock or negedge reset_n) begin
        if (!reset_n) begin
            dout <= 16'h0000;
            valid_out <= 16'hFFFF;
            frame_out <= 16'hFFFF;
        end
        else begin
            if (frame_in == 0) begin
                if (current_state == connection) begin
                    if (valid_in == 0) begin
                        dout[address] <= din;
                        finished_out[address] <= 1'b0;
                        valid_out[address] <= valid_in;
                        frame_out[address] <= frame_in;               
                    end
                    else if (valid_in == 1)begin
                        dout[address] <= 1'bX;
                        finished_out[address] <= 1'b0;
                        valid_out[address] <= valid_in;
                        frame_out[address] <= frame_in;               
                    end

                end
                else begin
                    dout[address] <= 1'bX;
                    finished_out[address] <= 1'b0;
                    valid_out[address] <= valid_in;
                    frame_out[address] <= frame_in;
                end
            end
            else if (frame_in == 1) begin
                if (current_state == idle) begin
                    dout = 1'bX;
                    finished_out <= 16'h0;
                    valid_out <= 16'h0;
                    frame_out <=  16'hFFFF;
                end
                if (current_state == close_transmission) begin
                    dout[address] = din;
                    finished_out[address] <= 1'b1;
                    valid_out[address] <= valid_in;
                    frame_out[address] <= frame_in;
                end
            end        
        end
    end

    always_comb begin
        for (int i = 0; i < 16 ; i++ ) begin
            temp = temp | busy[i];
        end
        sum_busy = temp;
        temp = 0;
    end

endmodule
