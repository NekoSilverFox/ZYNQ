// ==============================================================
// File generated on Wed May 13 09:29:52 +0800 2020
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// CTRL_BUS
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read)
//        bit 7  - auto_restart (Read/Write)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0  - Channel 0 (ap_done)
//        bit 1  - Channel 1 (ap_ready)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0  - Channel 0 (ap_done)
//        bit 1  - Channel 1 (ap_ready)
//        others - reserved
// 0x10 : Data signal of operation
//        bit 31~0 - operation[31:0] (Read/Write)
// 0x14 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XDOKERNEL_CTRL_BUS_ADDR_AP_CTRL        0x00
#define XDOKERNEL_CTRL_BUS_ADDR_GIE            0x04
#define XDOKERNEL_CTRL_BUS_ADDR_IER            0x08
#define XDOKERNEL_CTRL_BUS_ADDR_ISR            0x0c
#define XDOKERNEL_CTRL_BUS_ADDR_OPERATION_DATA 0x10
#define XDOKERNEL_CTRL_BUS_BITS_OPERATION_DATA 32

// KERNEL_BUS
// 0x10 ~
// 0x1f : Memory 'kernel' (9 * 8b)
//        Word n : bit [ 7: 0] - kernel[4n]
//                 bit [15: 8] - kernel[4n+1]
//                 bit [23:16] - kernel[4n+2]
//                 bit [31:24] - kernel[4n+3]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XDOKERNEL_KERNEL_BUS_ADDR_KERNEL_BASE 0x10
#define XDOKERNEL_KERNEL_BUS_ADDR_KERNEL_HIGH 0x1f
#define XDOKERNEL_KERNEL_BUS_WIDTH_KERNEL     8
#define XDOKERNEL_KERNEL_BUS_DEPTH_KERNEL     9

