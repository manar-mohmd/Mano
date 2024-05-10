`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 08:07:44 PM
// Design Name: 
// Module Name: MEMORY
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


module MEMORY (CLK, read, AR, write, INDATA, OUTDATA );
    input CLK,read,write;
    input [7:0]INDATA;
    input [3:0] AR;
    output reg [7:0] OUTDATA;
    
    reg [7:0] MEM[15:0];
      initial begin  
    MEM[0] = 8'h0A; //AND
    MEM[1] = 8'h1B; //ADD
    MEM[2] = 8'h2C; //LDA
    MEM[3] = 8'h45; //BUN
    MEM[4] = 8'h78; //INC
    MEM[5] = 8'h74; //CLR
    MEM[6] = 8'h72; 
    MEM[7] = 8'h8D; 
    MEM[8] = 8'h9E; 
    MEM[9] = 8'hAF; 
    MEM[10] = 8'hC4; 
    MEM[11] = 8'hFF;
    MEM[12] = 8'hFC; 
    MEM[13] = 8'h19;
    MEM[14] = 8'h09;
    MEM[15] = 8'h0B;
    end
    
    always@* begin
         if(read)
            OUTDATA = MEM[AR];
        end
        
endmodule
