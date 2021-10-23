// --------------------------------------------------------------------
// Copyright (c) 2019 by MicroPhase Technologies Inc. 
// --------------------------------------------------------------------
//
// Permission:
//
//   MicroPhase grants permission to use and modify this code for use
//   in synthesis for all MicroPhase Development Boards.
//   Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  MicroPhase provides no warranty regarding the use 
//   or functionality of this code.
//
// --------------------------------------------------------------------
//           
//                     MicroPhase Technologies Inc
//                     Shanghai, China
//
//                     web: http://www.microphase.cn/   
//                     email: support@microphase.cn
//
// --------------------------------------------------------------------
// --------------------------------------------------------------------
//
// Major Functions:	
//
// --------------------------------------------------------------------
// --------------------------------------------------------------------
//
//  Revision History:
//  Date          By            Revision    Change Description
//---------------------------------------------------------------------
//2019-12-11      Chaochen Wei  1.0          Original
//2019/                         1.1          
// --------------------------------------------------------------------
// --------------------------------------------------------------------


`timescale 1ns / 1ps
module cmos_img_capture(
    input   wire            rst                 ,//复位信号
    input   wire            cmos_cfg_done       ,//寄存器配置完成信�? 
    //摄像头接�? 
    input   wire            cmos_pclk           ,//cmos 数据像素时钟
    input   wire            cmos_vsync          ,//cmos 场同步信�?
    input   wire            cmos_href           ,//cmos 行同步信�?
    input   wire   [7:0]    cmos_data           ,//cmos 数据                             
    //用户接口  
    output  wire            pclk                ,//pixel out clock
    output  wire            cmos_data_vld       ,//frame is active flag
    output  wire            cmos_clk_en         ,//cmos clock enable siagnl
    output  wire   [23:0]   capture_data        ,
    output  wire            vsync                    
    );


//=============================================
//internal signals
//=============================================
reg     [11:0]  cnt_data        ;//计数当前已经接收了多少从cmos传来的数�?
wire    [23:0]  din             ;//写入buffer�?32位数据，由rgb565转换而来的数�?
reg     [1:0]   cmos_vsync_dd   ;//cmos_vsync 延时信号
reg             ready           ;//准备好接收数据（�?帧完整的数据�?
reg     [15:0]  cmos_capture_data;//捕捉到的数据
reg             cmos_data_vld_r   ;//捕捉到的数据有效信号


wire    [4:0]   rgb_r           ;
wire    [5:0]   rgb_g           ;
wire    [4:0]   rgb_b           ;


assign  cmos_data_vld = cmos_href;
assign  pclk = cmos_pclk;
assign  capture_data = din ;
assign  vsync = cmos_vsync ;
assign  cmos_clk_en = cmos_data_vld_r ||(!cmos_href); 

//---------------------------------------------
//write port siganls(写buffer侧信�?)
//---------------------------------------------


//--------------------cmos_vsync_dd--------------------
always @(posedge cmos_pclk)begin
    if(rst == 1'b1)begin
        cmos_vsync_dd <= 'd0;
    end
    else if(cmos_cfg_done==1'b0)begin
        cmos_vsync_dd <= 'd0;
    end
    else begin
        cmos_vsync_dd <= {cmos_vsync_dd[0],cmos_vsync};
    end
end

//--------------------ready--------------------
//接收到了帧同步信号，可以�?始接收数�?
always @(posedge cmos_pclk)begin
    if(rst == 1'b1)begin
        ready <= 'd0;
    end
    else if(cmos_cfg_done==1'b0)begin
        ready <= 'd0;
    end
    else if(cmos_vsync_dd[0]==1'b1 && cmos_vsync_dd[1]==1'b0)begin
        ready <= 1'b1;
    end
end

//--------------------cnt_data--------------------
always @(posedge cmos_pclk)begin
    if(rst == 1'b1)begin
        cnt_data <= 'd0;
    end
    else if(cmos_cfg_done==1'b0)begin
        cnt_data <= 'd0;
    end
    else if(cmos_href==1'b1 && ready==1'b1)begin
        cnt_data <= cnt_data + 1'b1;
    end
    else begin
        cnt_data <= 'd0;
    end
end

//--------------------cmos_capture_data--------------------
always @(posedge cmos_pclk)begin
    if(rst == 1'b1)begin
        cmos_capture_data <= 'd0;
    end
    else if(cmos_cfg_done==1'b0)begin
        cmos_capture_data <= 'd0;
    end
    else if(cmos_href==1'b1 && ready==1'b1)begin
        cmos_capture_data <= {cmos_capture_data[7:0],cmos_data};
    end
    else begin
        cmos_capture_data <= 'd0;
    end
end

//--------------------cmos_data_vld_r--------------------
always @(posedge cmos_pclk)begin
    if(rst == 1'b1)begin
        cmos_data_vld_r <= 1'd0;
    end
    else if(cnt_data[0]==1'b1)begin
        cmos_data_vld_r <= 1'b1;
    end
    else begin
        cmos_data_vld_r <= 1'b0;
    end
end

assign rgb_r = cmos_capture_data[15:11];
assign rgb_g = cmos_capture_data[10:5];
assign rgb_b = cmos_capture_data[4:0];

assign din = {{rgb_r,rgb_r[2:0]},{rgb_g,rgb_g[1:0]},{rgb_b,rgb_b[2:0]}};



// wire  [63:0]probe0;

// assign probe0 = {
// 	cnt_data        	,//计数当前已经接收了多少从cmos传来的数�?
// 	din             	,//写入buffer�?32位数据，由rgb565转换而来的数�?
// 	cmos_vsync_dd   	,//cmos_vsync 延时信号
// 	ready           	,//准备好接收数据（�?帧完整的数据�?
// 	cmos_data_vld_r   	,//捕捉到的数据有效信号
// 	cmos_vsync          ,//cmos 场同步信�?
//     cmos_cfg_done       ,
// 	cmos_href           ,//cmos 行同步信�?
// 	cmos_data            //cmos 数据      
// };

// ila_0 inst_ila_0 (
//   .clk(cmos_pclk), // input wire clk


//   .probe0(probe0) // input wire [63:0] probe0
// );

endmodule