`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2020 00:08:34
// Design Name: 
// Module Name: sim_task2
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


module sim_task2;

reg clk;
reg cs;
reg oe;
reg we;
reg [7: 0] address;
wire [7: 0] data_in;
wire [7: 0] data_out;
reg [7: 0] mem [0: 4] ;




assign data_in = mem[address];

task02 t2(.clk(clk),.cs(cs),.oe(oe),.we(we),.address(address),.data_in(data_in),.data_out(data_out));

initial forever
    #5 clk = ~clk;

initial begin
    clk = 0;
    oe = 1;
    cs = 1;
      
    we = 1;
    
    address = 0;
    mem[0] = 3;
    #10
    address = 1;
    mem[1] = 13;
    #10
    address = 2;
    mem[2] = 23;
    #10
    address = 3;
    mem[3] = 33;
    #10
    address = 4;
    mem[4] = 43;

    #10
    address = 0;
    we = 0;
    #10;
    address = 3;
    #10;
    cs = 0;
    address = 1;
    #10;
    oe = 0;
    address = 2;
end
endmodule
