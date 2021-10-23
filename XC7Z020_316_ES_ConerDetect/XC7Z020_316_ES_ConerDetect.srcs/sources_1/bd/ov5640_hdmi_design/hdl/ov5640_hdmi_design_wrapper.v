//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Sun Oct 24 01:11:41 2021
//Host        : DESKTOP-HMF772I running 64-bit major release  (build 9200)
//Command     : generate_target ov5640_hdmi_design_wrapper.bd
//Design      : ov5640_hdmi_design_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ov5640_hdmi_design_wrapper
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    cmos_data,
    cmos_href,
    cmos_pclk,
    cmos_rst_n,
    cmos_vsync,
    emio_sccb_tri_io,
    hdmi_oen,
    hdmi_tx_chn_b_n,
    hdmi_tx_chn_b_p,
    hdmi_tx_chn_g_n,
    hdmi_tx_chn_g_p,
    hdmi_tx_chn_r_n,
    hdmi_tx_chn_r_p,
    hdmi_tx_clk_n,
    hdmi_tx_clk_p);
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  input [9:0]cmos_data;
  input cmos_href;
  input cmos_pclk;
  output cmos_rst_n;
  input cmos_vsync;
  inout [1:0]emio_sccb_tri_io;
  output [0:0]hdmi_oen;
  output hdmi_tx_chn_b_n;
  output hdmi_tx_chn_b_p;
  output hdmi_tx_chn_g_n;
  output hdmi_tx_chn_g_p;
  output hdmi_tx_chn_r_n;
  output hdmi_tx_chn_r_p;
  output hdmi_tx_clk_n;
  output hdmi_tx_clk_p;

  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire [9:0]cmos_data;
  wire cmos_href;
  wire cmos_pclk;
  wire cmos_rst_n;
  wire cmos_vsync;
  wire [0:0]emio_sccb_tri_i_0;
  wire [1:1]emio_sccb_tri_i_1;
  wire [0:0]emio_sccb_tri_io_0;
  wire [1:1]emio_sccb_tri_io_1;
  wire [0:0]emio_sccb_tri_o_0;
  wire [1:1]emio_sccb_tri_o_1;
  wire [0:0]emio_sccb_tri_t_0;
  wire [1:1]emio_sccb_tri_t_1;
  wire [0:0]hdmi_oen;
  wire hdmi_tx_chn_b_n;
  wire hdmi_tx_chn_b_p;
  wire hdmi_tx_chn_g_n;
  wire hdmi_tx_chn_g_p;
  wire hdmi_tx_chn_r_n;
  wire hdmi_tx_chn_r_p;
  wire hdmi_tx_clk_n;
  wire hdmi_tx_clk_p;

  IOBUF emio_sccb_tri_iobuf_0
       (.I(emio_sccb_tri_o_0),
        .IO(emio_sccb_tri_io[0]),
        .O(emio_sccb_tri_i_0),
        .T(emio_sccb_tri_t_0));
  IOBUF emio_sccb_tri_iobuf_1
       (.I(emio_sccb_tri_o_1),
        .IO(emio_sccb_tri_io[1]),
        .O(emio_sccb_tri_i_1),
        .T(emio_sccb_tri_t_1));
  ov5640_hdmi_design ov5640_hdmi_design_i
       (.DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .cmos_data(cmos_data),
        .cmos_href(cmos_href),
        .cmos_pclk(cmos_pclk),
        .cmos_rst_n(cmos_rst_n),
        .cmos_vsync(cmos_vsync),
        .emio_sccb_tri_i({emio_sccb_tri_i_1,emio_sccb_tri_i_0}),
        .emio_sccb_tri_o({emio_sccb_tri_o_1,emio_sccb_tri_o_0}),
        .emio_sccb_tri_t({emio_sccb_tri_t_1,emio_sccb_tri_t_0}),
        .hdmi_oen(hdmi_oen),
        .hdmi_tx_chn_b_n(hdmi_tx_chn_b_n),
        .hdmi_tx_chn_b_p(hdmi_tx_chn_b_p),
        .hdmi_tx_chn_g_n(hdmi_tx_chn_g_n),
        .hdmi_tx_chn_g_p(hdmi_tx_chn_g_p),
        .hdmi_tx_chn_r_n(hdmi_tx_chn_r_n),
        .hdmi_tx_chn_r_p(hdmi_tx_chn_r_p),
        .hdmi_tx_clk_n(hdmi_tx_clk_n),
        .hdmi_tx_clk_p(hdmi_tx_clk_p));
endmodule
