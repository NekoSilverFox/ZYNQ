`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/13 20:28:58
// Design Name: 
// Module Name: pwm_ip
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

module pwm_ip(
    input sys_clk ,
    input sys_rst_n , 
    input [9:0] set_freq_step , 
    output pwm 
);
 //*****************************************************
 //** main code
 //*****************************************************
 //reg define
reg [15:0] period_cnt ; 
reg [15:0] duty_cycle ; 
reg inc_flag ; 
//wire define
wire led_t ;

assign led_t = ( period_cnt <= duty_cycle ) ? 1'b1 : 1'b0 ;
assign pwm = led_t;
always @ (posedge sys_clk) begin
    if (!sys_rst_n)
        period_cnt <= 16'd0;
    else if( period_cnt == 16'd50_0000 )
        period_cnt <= 16'd0;
    else
        period_cnt <= period_cnt + 16'd1;
    end
always @(posedge sys_clk) begin
    if (sys_rst_n == 1'b0) begin
        duty_cycle <= 16'd0;
        inc_flag <= 1'b0;
    end
    else if( period_cnt == 16'd50_0000 ) begin
        if( inc_flag ) begin 
            if( duty_cycle == 16'd0 )
                inc_flag <= 1'b0;
            else if(duty_cycle < 10'd100)
                duty_cycle <= 16'd0;
        else
            duty_cycle <= duty_cycle - set_freq_step;
        end
    else begin 
        if( duty_cycle >= 16'd50_0000 )
            inc_flag <= 1'b1;
        else
            duty_cycle <= duty_cycle + set_freq_step;
        end
    end
    else 
        duty_cycle <= duty_cycle ;
    end
 endmodule
