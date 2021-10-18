// (c) Copyright 1995-2021 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:user:ddr3_hdmi_ov5640:1.0
// IP Revision: 16

(* X_CORE_INFO = "ov5640_capture,Vivado 2018.3" *)
(* CHECK_LICENSE_TYPE = "ov5640_hdmi_design_ddr3_hdmi_ov5640_0_0,ov5640_capture,{}" *)
(* CORE_GENERATION_INFO = "ov5640_hdmi_design_ddr3_hdmi_ov5640_0_0,ov5640_capture,{x_ipProduct=Vivado 2018.3,x_ipVendor=xilinx.com,x_ipLibrary=user,x_ipName=ddr3_hdmi_ov5640,x_ipVersion=1.0,x_ipCoreRevision=16,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module ov5640_hdmi_design_ddr3_hdmi_ov5640_0_0 (
  clk,
  rst,
  cmos_scl,
  cmos_sda,
  cmos_pclk,
  cmos_vsync,
  cmos_href,
  cmos_rst_n,
  cmos_data,
  pclk,
  data_active,
  cmos_clk_en,
  capture_data,
  vsync
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 50000000, PHASE 0.000, CLK_DOMAIN ov5640_hdmi_design_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *)
input wire rst;
output wire cmos_scl;
inout wire cmos_sda;
input wire cmos_pclk;
input wire cmos_vsync;
input wire cmos_href;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME cmos_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 cmos_rst_n RST" *)
output wire cmos_rst_n;
input wire [9 : 0] cmos_data;
output wire pclk;
output wire data_active;
output wire cmos_clk_en;
output wire [23 : 0] capture_data;
output wire vsync;

  ov5640_capture inst (
    .clk(clk),
    .rst(rst),
    .cmos_scl(cmos_scl),
    .cmos_sda(cmos_sda),
    .cmos_pclk(cmos_pclk),
    .cmos_vsync(cmos_vsync),
    .cmos_href(cmos_href),
    .cmos_rst_n(cmos_rst_n),
    .cmos_data(cmos_data),
    .pclk(pclk),
    .data_active(data_active),
    .cmos_clk_en(cmos_clk_en),
    .capture_data(capture_data),
    .vsync(vsync)
  );
endmodule
