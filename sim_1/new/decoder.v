`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 08:10:36 PM
// Design Name: 
// Module Name: decoder
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


module decoder (value, timing_signals);
input [2:0] value;
output wire [7:0] timing_signals;
assign timing_signals =( value == 3'b000) ? 8'h00:
                       ( value == 3'b001) ? 8'h01:
                       ( value == 3'b010) ? 8'h02:
                       ( value == 3'b011) ? 8'h04:
                       ( value == 3'b100) ? 8'h08:
                       ( value == 3'b101) ? 8'h10:
                       ( value == 3'b110) ? 8'h20:                   
                       ( value == 3'b111) ? 8'h40: 8'hxx;
                                            
                      endmodule
