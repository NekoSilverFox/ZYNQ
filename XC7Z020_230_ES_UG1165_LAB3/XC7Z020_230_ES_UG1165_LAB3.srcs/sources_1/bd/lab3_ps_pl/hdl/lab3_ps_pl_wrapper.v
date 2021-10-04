//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.3 (win64) Build 1682563 Mon Oct 10 19:07:27 MDT 2016
//Date        : Thu Sep 23 22:40:43 2021
//Host        : DESKTOP-HMF772I running 64-bit major release  (build 9200)
//Command     : generate_target lab3_ps_pl_wrapper.bd
//Design      : lab3_ps_pl_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module lab3_ps_pl_wrapper
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
    gpio_axi_key_tri_io,
    gpio_emio_key_tri_io);
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
  inout [0:0]gpio_axi_key_tri_io;
  inout [0:0]gpio_emio_key_tri_io;

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
  wire [0:0]gpio_axi_key_tri_i_0;
  wire [0:0]gpio_axi_key_tri_io_0;
  wire [0:0]gpio_axi_key_tri_o_0;
  wire [0:0]gpio_axi_key_tri_t_0;
  wire [0:0]gpio_emio_key_tri_i_0;
  wire [0:0]gpio_emio_key_tri_io_0;
  wire [0:0]gpio_emio_key_tri_o_0;
  wire [0:0]gpio_emio_key_tri_t_0;

  IOBUF gpio_axi_key_tri_iobuf_0
       (.I(gpio_axi_key_tri_o_0),
        .IO(gpio_axi_key_tri_io[0]),
        .O(gpio_axi_key_tri_i_0),
        .T(gpio_axi_key_tri_t_0));
  IOBUF gpio_emio_key_tri_iobuf_0
       (.I(gpio_emio_key_tri_o_0),
        .IO(gpio_emio_key_tri_io[0]),
        .O(gpio_emio_key_tri_i_0),
        .T(gpio_emio_key_tri_t_0));
  lab3_ps_pl lab3_ps_pl_i
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
        .GPIO_AXI_KEY_tri_i(gpio_axi_key_tri_i_0),
        .GPIO_AXI_KEY_tri_o(gpio_axi_key_tri_o_0),
        .GPIO_AXI_KEY_tri_t(gpio_axi_key_tri_t_0),
        .GPIO_EMIO_KEY_tri_i(gpio_emio_key_tri_i_0),
        .GPIO_EMIO_KEY_tri_o(gpio_emio_key_tri_o_0),
        .GPIO_EMIO_KEY_tri_t(gpio_emio_key_tri_t_0));
endmodule
