`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2024 10:41:14 PM
// Design Name: 
// Module Name: Router
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


module Router (
    input logic clock,
    input logic reset_n,
    input logic [15:0] din,
    input logic [15:0] valid_in,
    input logic [15:0] frame_in,

    output logic [15:0] dout,
    output logic [15:0] valid_out,
    output logic [15:0] frame_out,

    output logic [15:0] sum_busy
);

    logic [15:0] frame_bus_in[15:0];
    logic [15:0] valid_bus_in[15:0];
    logic [15:0] data_bus_in[15:0];
    logic [15:0] busy_bus_in[15:0];
    logic [15:0] finished_bus_in[15:0];


    logic [15:0] frame_bus_out[15:0];
    logic [15:0] valid_bus_out[15:0];
    logic [15:0] data_bus_out[15:0];
    logic [15:0] busy_bus_out[15:0];
    logic [15:0] finished_bus_out[15:0];


    genvar i;
    for (i = 0; i < 16; i++) begin: lgIn_loop
        Logic_in lgIn (
            .clock(clock),
            .reset_n(reset_n),
            .din(din[i]),
            .valid_in(valid_in[i]),
            .frame_in(frame_in[i]), 
            .busy(busy_bus_in[i]),

            .dout(data_bus_in[i]), 
            .valid_out(valid_bus_in[i]),
            .frame_out(frame_bus_in[i]),

            .finished_out(finished_bus_in[i]),
            .sum_busy(sum_busy[i])
        );
    end
    
    for (i = 0; i < 16; i++) begin: lgOut_loop
        Logic_out lgOut (
            .din(data_bus_out[i]),
            .valid_in(valid_bus_out[i]),
            .frame_in(frame_bus_out[i]), 
            .finished_in(finished_bus_out[i]),

            .busy(busy_bus_out[i]), 
            .dout(dout[i]), 
            .valid_out(valid_out[i]),
            .frame_out(frame_out[i])
        );
    end
    
        
    always_comb begin
        for (int i = 0; i < 16; i++) begin
            data_bus_out[i] = {
                data_bus_in[15][i], data_bus_in[14][i], data_bus_in[13][i], data_bus_in[12][i],
                data_bus_in[11][i], data_bus_in[10][i], data_bus_in[9][i], data_bus_in[8][i],
                data_bus_in[7][i], data_bus_in[6][i], data_bus_in[5][i], data_bus_in[4][i],
                data_bus_in[3][i], data_bus_in[2][i], data_bus_in[1][i], data_bus_in[0][i]
            };

            valid_bus_out[i] = {
                valid_bus_in[15][i], valid_bus_in[14][i], valid_bus_in[13][i], valid_bus_in[12][i],
                valid_bus_in[11][i], valid_bus_in[10][i], valid_bus_in[9][i], valid_bus_in[8][i],
                valid_bus_in[7][i], valid_bus_in[6][i], valid_bus_in[5][i], valid_bus_in[4][i],
                valid_bus_in[3][i], valid_bus_in[2][i], valid_bus_in[1][i], valid_bus_in[0][i]
            };

            frame_bus_out[i] = {
                frame_bus_in[15][i], frame_bus_in[14][i], frame_bus_in[13][i], frame_bus_in[12][i],
                frame_bus_in[11][i], frame_bus_in[10][i], frame_bus_in[9][i], frame_bus_in[8][i],
                frame_bus_in[7][i], frame_bus_in[6][i], frame_bus_in[5][i], frame_bus_in[4][i],
                frame_bus_in[3][i], frame_bus_in[2][i], frame_bus_in[1][i], frame_bus_in[0][i]
            };

            finished_bus_out[i] = {
                finished_bus_in[15][i], finished_bus_in[14][i], finished_bus_in[13][i], finished_bus_in[12][i],
                finished_bus_in[11][i], finished_bus_in[10][i], finished_bus_in[9][i], finished_bus_in[8][i],
                finished_bus_in[7][i], finished_bus_in[6][i], finished_bus_in[5][i], finished_bus_in[4][i],
                finished_bus_in[3][i], finished_bus_in[2][i], finished_bus_in[1][i], finished_bus_in[0][i]
            };

            busy_bus_in[i] = {
                busy_bus_out[15][i], busy_bus_out[14][i], busy_bus_out[13][i], busy_bus_out[12][i],
                busy_bus_out[11][i], busy_bus_out[10][i], busy_bus_out[9][i], busy_bus_out[8][i],
                busy_bus_out[7][i], busy_bus_out[6][i], busy_bus_out[5][i], busy_bus_out[4][i],
                busy_bus_out[3][i], busy_bus_out[2][i], busy_bus_out[1][i], busy_bus_out[0][i]
            };
        end
    end

endmodule
