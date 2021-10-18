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
//2020-02-27      Chaochen Wei  1.0          Original
//2020-                         1.1          
// --------------------------------------------------------------------
// --------------------------------------------------------------------
module hdmi_trans (
	input 	wire 			clk1x 			,// Clock
	input 	wire 			clk5x 			,// Clock
	input 	wire 			rst 			,// Asynchronous reset active high
	input 	wire 	[23:0]	image_rgb 		,//输入R分量
	input	wire 			vsync 			,//场同步信�?
	input	wire			hsync			,//行同步信�?
	input 	wire			de 				,//输出数据有效信号
	
	output	wire			hdmi_tx_clk_n	,//TMDS时钟
	output	wire 			hdmi_tx_clk_p	,
	output	wire			hdmi_tx_chn_r_n	,//TMDS数据
	output	wire			hdmi_tx_chn_r_p	, 
	output	wire			hdmi_tx_chn_g_n	,
	output	wire			hdmi_tx_chn_g_p	, 
	output	wire			hdmi_tx_chn_b_n	,
	output	wire			hdmi_tx_chn_b_p	
);


wire 	[7:0]	image_r 	;//输入R分量
wire 	[7:0]	image_g 	;//输入G分量
wire 	[7:0]	image_b 	;//输入B分量

wire 	[9:0]	encode_chn_r;
wire 	[9:0]	encode_chn_g;
wire 	[9:0]	encode_chn_b;

assign {image_r,image_g,image_b}=image_rgb;

	encode inst_encode_chn_r (
			.clkin (clk1x),
			.rstin (rst),
			.din   (image_r),
			.c0    (1'b0),
			.c1    (1'b0),
			.de    (de),
			.dout  (encode_chn_r)
		);

	encode inst_encode_chn_g (
			.clkin (clk1x),
			.rstin (rst),
			.din   (image_g),
			.c0    (1'b0),
			.c1    (1'b0),
			.de    (de),
			.dout  (encode_chn_g)
		);

	encode inst_encode_chn_b (
			.clkin (clk1x),
			.rstin (rst),
			.din   (image_b),
			.c0    (hsync),
			.c1    (vsync),
			.de    (de),
			.dout  (encode_chn_b)
		);


	parallel_to_serial inst_parallel_to_serial_clk
		(
			.clk1x  (clk1x),
			.clk5x  (clk5x),
			.rst    (rst),
			.din    (10'b11111_00000),
			.dout_p (hdmi_tx_clk_p),
			.dout_n (hdmi_tx_clk_n)
		);

	parallel_to_serial inst_parallel_to_serial_chn_r
		(
			.clk1x  (clk1x),
			.clk5x  (clk5x),
			.rst    (rst),
			.din    (encode_chn_r),
			.dout_p (hdmi_tx_chn_r_p),
			.dout_n (hdmi_tx_chn_r_n)
		);


	parallel_to_serial inst_parallel_to_serial_chn_g
		(
			.clk1x  (clk1x),
			.clk5x  (clk5x),
			.rst    (rst),
			.din    (encode_chn_g),
			.dout_p (hdmi_tx_chn_g_p),
			.dout_n (hdmi_tx_chn_g_n)
		);

	parallel_to_serial inst_parallel_to_serial_chn_b
		(
			.clk1x  (clk1x),
			.clk5x  (clk5x),
			.rst    (rst),
			.din    (encode_chn_b),
			.dout_p (hdmi_tx_chn_b_p),
			.dout_n (hdmi_tx_chn_b_n)
		);


endmodule