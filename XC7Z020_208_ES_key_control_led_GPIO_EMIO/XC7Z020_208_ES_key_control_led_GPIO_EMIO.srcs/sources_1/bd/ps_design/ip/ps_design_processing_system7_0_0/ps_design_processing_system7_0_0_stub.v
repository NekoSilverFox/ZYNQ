// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.3 (win64) Build 1682563 Mon Oct 10 19:07:27 MDT 2016
// Date        : Wed Sep 15 15:54:35 2021
// Host        : DESKTOP-HMF772I running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_208_ES_key_control_led_GPIO_EMIO/XC7Z020_208_ES_key_control_led_GPIO_EMIO.srcs/sources_1/bd/ps_design/ip/ps_design_processing_system7_0_0/ps_design_processing_system7_0_0_stub.v
// Design      : ps_design_processing_system7_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "processing_system7_v5_5_processing_system7,Vivado 2016.3" *)
module ps_design_processing_system7_0_0(GPIO_I, GPIO_O, GPIO_T, MIO, DDR_CAS_n, DDR_CKE, 
  DDR_Clk_n, DDR_Clk, DDR_CS_n, DDR_DRSTB, DDR_ODT, DDR_RAS_n, DDR_WEB, DDR_BankAddr, DDR_Addr, 
  DDR_VRN, DDR_VRP, DDR_DM, DDR_DQ, DDR_DQS_n, DDR_DQS, PS_SRSTB, PS_CLK, PS_PORB)
/* synthesis syn_black_box black_box_pad_pin="GPIO_I[0:0],GPIO_O[0:0],GPIO_T[0:0],MIO[53:0],DDR_CAS_n,DDR_CKE,DDR_Clk_n,DDR_Clk,DDR_CS_n,DDR_DRSTB,DDR_ODT,DDR_RAS_n,DDR_WEB,DDR_BankAddr[2:0],DDR_Addr[14:0],DDR_VRN,DDR_VRP,DDR_DM[3:0],DDR_DQ[31:0],DDR_DQS_n[3:0],DDR_DQS[3:0],PS_SRSTB,PS_CLK,PS_PORB" */;
  input [0:0]GPIO_I;
  output [0:0]GPIO_O;
  output [0:0]GPIO_T;
  inout [53:0]MIO;
  inout DDR_CAS_n;
  inout DDR_CKE;
  inout DDR_Clk_n;
  inout DDR_Clk;
  inout DDR_CS_n;
  inout DDR_DRSTB;
  inout DDR_ODT;
  inout DDR_RAS_n;
  inout DDR_WEB;
  inout [2:0]DDR_BankAddr;
  inout [14:0]DDR_Addr;
  inout DDR_VRN;
  inout DDR_VRP;
  inout [3:0]DDR_DM;
  inout [31:0]DDR_DQ;
  inout [3:0]DDR_DQS_n;
  inout [3:0]DDR_DQS;
  inout PS_SRSTB;
  inout PS_CLK;
  inout PS_PORB;
endmodule