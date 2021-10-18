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
//2019-12-10      Chaochen Wei  1.0          Original
//2019/                         1.1          
// --------------------------------------------------------------------
// --------------------------------------------------------------------


`timescale 1ns / 1ps

module ov5640_capture(
    input   wire            clk           ,//100M
    input   wire            rst           ,//active high
    output  wire            cmos_scl      ,//cmos config sclk
    inout   wire            cmos_sda      ,

    //ov5640 port
    input   wire            cmos_pclk     ,//pixel clock
    input   wire            cmos_vsync    ,
    input   wire            cmos_href     ,
    output  wire            cmos_rst_n    ,
    input   wire     [9:0]  cmos_data     ,

    output  wire            pclk          ,//pixel out clock
    output  wire            data_active  ,//frame is active flag
    output  wire            cmos_clk_en   ,//cmos clock enable siagnl
    output  wire     [23:0] capture_data  ,
    output  wire            vsync                  
    );


//---------------------------------------------
//configuration related port
//---------------------------------------------
wire            cmos_cfg_done         ;


assign cmos_rst_n = 1'b1;

    cmos_cfg inst_cmos_cfg (
      .clk      (clk),
      .rst      (rst),
      .scl      (cmos_scl),
      .cfg_done (cmos_cfg_done),
      .sda      (cmos_sda)
    );


    cmos_img_capture inst_cmos_img_capture (
      .rst           (rst),
      .cmos_cfg_done (1'b1), 
      .cmos_pclk     (cmos_pclk),
      .cmos_vsync    (cmos_vsync),
      .cmos_href     (cmos_href),
      .cmos_data     (cmos_data[9:2]),
      .pclk          (pclk),
      .cmos_data_vld (data_active),
      .cmos_clk_en   (cmos_clk_en),
      .capture_data  (capture_data),
      .vsync         (vsync)
    );


endmodule
