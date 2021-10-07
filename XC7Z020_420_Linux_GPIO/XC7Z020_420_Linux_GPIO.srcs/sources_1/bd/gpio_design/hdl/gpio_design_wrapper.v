//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.3 (win64) Build 1682563 Mon Oct 10 19:07:27 MDT 2016
//Date        : Thu Oct 07 11:19:12 2021
//Host        : DESKTOP-HMF772I running 64-bit major release  (build 9200)
//Command     : generate_target gpio_design_wrapper.bd
//Design      : gpio_design_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module gpio_design_wrapper
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
    axi_gpio_tri_io,
    emio_gpio_tri_io);
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
  inout [1:0]axi_gpio_tri_io;
  inout [1:0]emio_gpio_tri_io;

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
  wire [0:0]axi_gpio_tri_i_0;
  wire [1:1]axi_gpio_tri_i_1;
  wire [0:0]axi_gpio_tri_io_0;
  wire [1:1]axi_gpio_tri_io_1;
  wire [0:0]axi_gpio_tri_o_0;
  wire [1:1]axi_gpio_tri_o_1;
  wire [0:0]axi_gpio_tri_t_0;
  wire [1:1]axi_gpio_tri_t_1;
  wire [0:0]emio_gpio_tri_i_0;
  wire [1:1]emio_gpio_tri_i_1;
  wire [0:0]emio_gpio_tri_io_0;
  wire [1:1]emio_gpio_tri_io_1;
  wire [0:0]emio_gpio_tri_o_0;
  wire [1:1]emio_gpio_tri_o_1;
  wire [0:0]emio_gpio_tri_t_0;
  wire [1:1]emio_gpio_tri_t_1;

  IOBUF axi_gpio_tri_iobuf_0
       (.I(axi_gpio_tri_o_0),
        .IO(axi_gpio_tri_io[0]),
        .O(axi_gpio_tri_i_0),
        .T(axi_gpio_tri_t_0));
  IOBUF axi_gpio_tri_iobuf_1
       (.I(axi_gpio_tri_o_1),
        .IO(axi_gpio_tri_io[1]),
        .O(axi_gpio_tri_i_1),
        .T(axi_gpio_tri_t_1));
  IOBUF emio_gpio_tri_iobuf_0
       (.I(emio_gpio_tri_o_0),
        .IO(emio_gpio_tri_io[0]),
        .O(emio_gpio_tri_i_0),
        .T(emio_gpio_tri_t_0));
  IOBUF emio_gpio_tri_iobuf_1
       (.I(emio_gpio_tri_o_1),
        .IO(emio_gpio_tri_io[1]),
        .O(emio_gpio_tri_i_1),
        .T(emio_gpio_tri_t_1));
  gpio_design gpio_design_i
       (.AXI_GPIO_tri_i({axi_gpio_tri_i_1,axi_gpio_tri_i_0}),
        .AXI_GPIO_tri_o({axi_gpio_tri_o_1,axi_gpio_tri_o_0}),
        .AXI_GPIO_tri_t({axi_gpio_tri_t_1,axi_gpio_tri_t_0}),
        .DDR_addr(DDR_addr),
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
        .EMIO_GPIO_tri_i({emio_gpio_tri_i_1,emio_gpio_tri_i_0}),
        .EMIO_GPIO_tri_o({emio_gpio_tri_o_1,emio_gpio_tri_o_0}),
        .EMIO_GPIO_tri_t({emio_gpio_tri_t_1,emio_gpio_tri_t_0}),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb));
endmodule