`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 08:03:50 PM
// Design Name: 
// Module Name: BUS_ARCH
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


module BUS_ARCH(Ins, D, T, J);

	input  J;
	input [7:0] D;
	input [7:0] T;

	output [7:0] Ins;
wire D7n;
	assign D7n = ~D[7];
	wire S1 ,S2, S3,S4;
	
	assign S1 = D[4] & T[4];
	assign S2= D[2]& T[5];
	assign S3=  D7n & J & T[3];
	assign S4= ((D[0] | D[1] | D[2]) & T[4]);
	
	
	assign Ins[0] = 0;                                                                  //EMPTY_NONE
	assign Ins[1] = S1;                                                                //AR as source
	assign Ins[2] = T[0];                                                             //PC as source
	assign Ins[3] = S2;                                                              //DR as source
	assign Ins[4] = 0 ;                                                             //AC as source_EMPTY
	assign Ins[5] = T[2] ;                                                         //IR as source
    assign Ins[6] = 0;                                                        //TR as source            
    assign Ins[7] = S3 | S4 | T[1] ;                                             //M[AR] as source

endmodule
