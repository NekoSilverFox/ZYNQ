//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Fri Oct 15 12:56:40 2021
//Host        : DESKTOP-HMF772I running 64-bit major release  (build 9200)
//Command     : generate_target ip_design_wrapper.bd
//Design      : ip_design_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ip_design_wrapper
   (AXI_GPIO_tri_io,
    DDR_addr,
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
    EMIO_GPIO_tri_io,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    lcd_bl0,
    lcd_lcd_de,
    lcd_lcd_hs,
    lcd_lcd_pclk,
    lcd_lcd_vs,
    lcd_rgb_o);
  inout [1:0]AXI_GPIO_tri_io;
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
  inout [1:0]EMIO_GPIO_tri_io;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  output lcd_bl0;
  output lcd_lcd_de;
  output lcd_lcd_hs;
  output lcd_lcd_pclk;
  output lcd_lcd_vs;
  output [23:0]lcd_rgb_o;

  wire [0:0]AXI_GPIO_tri_i_0;
  wire [1:1]AXI_GPIO_tri_i_1;
  wire [0:0]AXI_GPIO_tri_io_0;
  wire [1:1]AXI_GPIO_tri_io_1;
  wire [0:0]AXI_GPIO_tri_o_0;
  wire [1:1]AXI_GPIO_tri_o_1;
  wire [0:0]AXI_GPIO_tri_t_0;
  wire [1:1]AXI_GPIO_tri_t_1;
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
  wire [0:0]EMIO_GPIO_tri_i_0;
  wire [1:1]EMIO_GPIO_tri_i_1;
  wire [0:0]EMIO_GPIO_tri_io_0;
  wire [1:1]EMIO_GPIO_tri_io_1;
  wire [0:0]EMIO_GPIO_tri_o_0;
  wire [1:1]EMIO_GPIO_tri_o_1;
  wire [0:0]EMIO_GPIO_tri_t_0;
  wire [1:1]EMIO_GPIO_tri_t_1;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire lcd_bl0;
  wire lcd_lcd_de;
  wire lcd_lcd_hs;
  wire lcd_lcd_pclk;
  wire lcd_lcd_vs;
  wire [23:0]lcd_rgb_o;

  IOBUF AXI_GPIO_tri_iobuf_0
       (.I(AXI_GPIO_tri_o_0),
        .IO(AXI_GPIO_tri_io[0]),
        .O(AXI_GPIO_tri_i_0),
        .T(AXI_GPIO_tri_t_0));
  IOBUF AXI_GPIO_tri_iobuf_1
       (.I(AXI_GPIO_tri_o_1),
        .IO(AXI_GPIO_tri_io[1]),
        .O(AXI_GPIO_tri_i_1),
        .T(AXI_GPIO_tri_t_1));
  IOBUF EMIO_GPIO_tri_iobuf_0
       (.I(EMIO_GPIO_tri_o_0),
        .IO(EMIO_GPIO_tri_io[0]),
        .O(EMIO_GPIO_tri_i_0),
        .T(EMIO_GPIO_tri_t_0));
  IOBUF EMIO_GPIO_tri_iobuf_1
       (.I(EMIO_GPIO_tri_o_1),
        .IO(EMIO_GPIO_tri_io[1]),
        .O(EMIO_GPIO_tri_i_1),
        .T(EMIO_GPIO_tri_t_1));
  ip_design ip_design_i
       (.AXI_GPIO_tri_i({AXI_GPIO_tri_i_1,AXI_GPIO_tri_i_0}),
        .AXI_GPIO_tri_o({AXI_GPIO_tri_o_1,AXI_GPIO_tri_o_0}),
        .AXI_GPIO_tri_t({AXI_GPIO_tri_t_1,AXI_GPIO_tri_t_0}),
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
        .EMIO_GPIO_tri_i({EMIO_GPIO_tri_i_1,EMIO_GPIO_tri_i_0}),
        .EMIO_GPIO_tri_o({EMIO_GPIO_tri_o_1,EMIO_GPIO_tri_o_0}),
        .EMIO_GPIO_tri_t({EMIO_GPIO_tri_t_1,EMIO_GPIO_tri_t_0}),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .lcd_bl0(lcd_bl0),
        .lcd_lcd_de(lcd_lcd_de),
        .lcd_lcd_hs(lcd_lcd_hs),
        .lcd_lcd_pclk(lcd_lcd_pclk),
        .lcd_lcd_vs(lcd_lcd_vs),
        .lcd_rgb_o(lcd_rgb_o));
endmodule
