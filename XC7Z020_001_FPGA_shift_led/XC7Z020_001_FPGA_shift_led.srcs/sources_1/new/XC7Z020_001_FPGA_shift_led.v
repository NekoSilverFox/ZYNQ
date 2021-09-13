`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/12 18:44:13
// Design Name: 
// Module Name: XC7Z020_001_FPGA_shift_led
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


module XC7Z020_001_FPGA_shift_led(
    input   wire            sys_clk  ,
    input   wire            rst_n     ,
    output  reg     [3:0]   led     
        );
        
    // internal siganls
    red [27:0] cnt;
    wire add_cnt; // cut 
    wire end_cut;
    
        
endmodule
