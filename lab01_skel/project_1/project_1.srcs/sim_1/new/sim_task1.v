`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2020 18:41:03
// Design Name: 
// Module Name: sim_task1
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


module sim_task1;
    reg [3:0]in;
    wire [7:0]out;
    
    task01 t1(.address(in),
    .data(out)
    );
    initial begin
    in = 4'd1;
    #10 in = 4'd5;
    #10 in = 4'd10;
    #10 in = 4'd3;
    end
endmodule
