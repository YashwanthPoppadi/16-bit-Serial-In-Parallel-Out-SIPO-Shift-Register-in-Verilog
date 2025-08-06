`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2025 08:47:00
// Design Name: 
// Module Name: SIPO_16bit
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


module df(clk, reset,d,q);
input clk,reset,d;
output reg q;

    always@(posedge clk)
    begin
    if(reset)
        q<=1'b0;
    else
    q<=d;
   end
endmodule

module SIPO_4bit(clk, reset, serial_in, parallel_out);
    input clk, reset, serial_in;
    output wire [3:0] parallel_out;

    df ff0(clk, reset, serial_in, parallel_out[0]);
    df ff1(clk, reset, parallel_out[0], parallel_out[1]);
    df ff2(clk, reset, parallel_out[1], parallel_out[2]);
    df ff3(clk, reset, parallel_out[2], parallel_out[3]);
endmodule

module SIPO_16bit(clk,reset, serial_in, parallel_out);
   input clk, reset, serial_in;
   output [15:0] parallel_out;
   wire[3:0] SIPO0_out,SIPO1_out,SIPO2_out,SIPO3_out;
   wire [5:0] six_bit_out;
   
   SIPO_4bit d0(clk,reset,serial_in,SIPO0_out);
   SIPO_4bit d1(clk,reset, SIPO0_out[3],SIPO1_out);
   SIPO_4bit d2(clk,reset,SIPO1_out[3],SIPO2_out);
   SIPO_4bit d3(clk,reset,SIPO2_out[3],SIPO3_out);
   
   assign parallel_out={SIPO3_out,SIPO2_out,SIPO1_out,SIPO0_out};
   assign six_bit_out=parallel_out[5:0];
 endmodule
