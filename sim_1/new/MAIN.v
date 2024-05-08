`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 08:14:37 PM
// Design Name: 
// Module Name: MAIN
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


       module MAIN(input CLK,
             /*
             , output E,
             output reg[7:0] AC,DR
             */
             output wire [7:0] DR, AC, IR, MEM,
             output wire [3:0] PC, AR,
             output wire [7:0] D,
             output wire [7:0] Timer,
             output wire [2:0] OUTSEQ,
             output wire [7:0] Data,
             output wire [2:0] sel, en,
             output wire [7:0] I ,
             output wire J,
             output wire E
             );
             
            wire    LDAR, CLRAR, INCAR,
                   INCPC, LDPC, CLRPC,                                                       
                   LDDR,CLRDR, INCDR,
                   INCAC, LDAC,CLRAC,
                   LDIR, CLRIR, INCIR,
                   READ, WRITE,       
                   AND,ADD, LDA, COM,
                   CLRSEQ,INCSEQ;
            
            
            
            wire  cout; 
            assign E =cout ; 
            assign CLK =0;
            /////////////////////////
            wire [7:0] m0, m1, m2, m3, m4 ,m5,m6, m7;  // (reg) input wires of the bus selection 
            
            //MEMORy
 MEMORY ram(CLK,READ,AR,WRITE,Data,MEM);   //module RAM(CLK,read,AR,write,INDATA,OUTDATA );
                                    assign m7 = MEM;
                                                                                                            
            // AR REG-                                                   
AR_REG ar  (AR,Data[3:0],LDAR,CLRAR, INCAR, CLK);    //instatiating AR reg.|PC(Q, INR, Data, Load, CLK, CLR);                                            
            assign m1 = {4'b0000, AR}; 
            
            // PC REG 
PROG_COUNTER pc         (PC,INCPC, LDPC, CLRPC, Data[3:0],CLK); 
            assign m2 = {4'b0000, PC};
            // DR ERG -
DATA_REG dr         (DR,Data,LDDR, CLRDR, INCDR, CLK);                          
            assign m3=DR;
            
            
            // ALU & AC REG 
            wire [7:0] ACDATA;                                                   ///ACDATA is INPUT OF AC reg. coming from ALU as an output not common bus
 ALU alu       (AND,ADD,LDA,COM,E,cout ,AC, DR, ACDATA);
ACC ac      (AC,INCAC,ACDATA,LDAC,CLK,CLRAC);                  //AC(Q, INR, Data, LD, CLK, CLR);
            assign m4 = AC;    
            
            
            // IR & IR control
            
 INS_REG ir        (IR,Data,LDIR,CLRIR,INCIR, CLK);                  
                           
            assign m5 = IR;                              
            
            // CONTROL UNIT 
 CONTROL_UNIT cu      (CLK, Timer, AC, IR,
                       CLRSEQ, INCSEQ,
                        LDAR, CLRAR, INCAR,
                        INCPC, LDPC,CLRPC,
                        LDDR, CLRDR, INCDR,
                        AND,ADD, LDA, COM,
                        INCAC, LDAC, CLRAC,
                         LDIR, CLRIR, INCIR, 
                         READ, WRITE,
                        E,I, J, D);          
ENCODER3x8 encoder    (en,I);                                            
                         MUX mux       (m0,m1,m2,m3,m4,m5,m6,m7,sel,Data);// MUX(d0,d1,d2,d3,d4,d5,d6,d7,sel,out);
                        
            // Sequence COUNTER 
                                                    // INCREMENT SC                                                                                                                                                  
                   assign INCSEQ = ~CLRSEQ;                           
                     SEQ_COUNTER seq       (CLRSEQ,INCSEQ ,CLK,OUTSEQ);  
                     decoder deco      (OUTSEQ, Timer);                   
                                     
                                                
                                
                                                                               
                                endmodule