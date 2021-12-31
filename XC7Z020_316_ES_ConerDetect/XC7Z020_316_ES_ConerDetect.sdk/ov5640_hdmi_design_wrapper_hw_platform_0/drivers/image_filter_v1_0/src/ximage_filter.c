// ==============================================================
// File generated on Tue Mar 10 09:24:31 +0800 2020
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "ximage_filter.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XImage_filter_CfgInitialize(XImage_filter *InstancePtr, XImage_filter_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Ctrl_bus_BaseAddress = ConfigPtr->Ctrl_bus_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XImage_filter_Start(XImage_filter *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XImage_filter_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XIMAGE_FILTER_CTRL_BUS_ADDR_AP_CTRL) & 0x80;
    XImage_filter_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XIMAGE_FILTER_CTRL_BUS_ADDR_AP_CTRL, Data | 0x01);
}

u32 XImage_filter_IsDone(XImage_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XImage_filter_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XIMAGE_FILTER_CTRL_BUS_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XImage_filter_IsIdle(XImage_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XImage_filter_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XIMAGE_FILTER_CTRL_BUS_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XImage_filter_IsReady(XImage_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XImage_filter_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XIMAGE_FILTER_CTRL_BUS_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XImage_filter_EnableAutoRestart(XImage_filter *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XImage_filter_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XIMAGE_FILTER_CTRL_BUS_ADDR_AP_CTRL, 0x80);
}

void XImage_filter_DisableAutoRestart(XImage_filter *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XImage_filter_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XIMAGE_FILTER_CTRL_BUS_ADDR_AP_CTRL, 0);
}

void XImage_filter_Set_width(XImage_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XImage_filter_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XIMAGE_FILTER_CTRL_BUS_ADDR_WIDTH_DATA, Data);
}

u32 XImage_filter_Get_width(XImage_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XImage_filter_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XIMAGE_FILTER_CTRL_BUS_ADDR_WIDTH_DATA);
    return Data;
}

void XImage_filter_Set_height(XImage_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XImage_filter_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XIMAGE_FILTER_CTRL_BUS_ADDR_HEIGHT_DATA, Data);
}

u32 XImage_filter_Get_height(XImage_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XImage_filter_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XIMAGE_FILTER_CTRL_BUS_ADDR_HEIGHT_DATA);
    return Data;
}

void XImage_filter_InterruptGlobalEnable(XImage_filter *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XImage_filter_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XIMAGE_FILTER_CTRL_BUS_ADDR_GIE, 1);
}

void XImage_filter_InterruptGlobalDisable(XImage_filter *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XImage_filter_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XIMAGE_FILTER_CTRL_BUS_ADDR_GIE, 0);
}

void XImage_filter_InterruptEnable(XImage_filter *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XImage_filter_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XIMAGE_FILTER_CTRL_BUS_ADDR_IER);
    XImage_filter_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XIMAGE_FILTER_CTRL_BUS_ADDR_IER, Register | Mask);
}

void XImage_filter_InterruptDisable(XImage_filter *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XImage_filter_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XIMAGE_FILTER_CTRL_BUS_ADDR_IER);
    XImage_filter_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XIMAGE_FILTER_CTRL_BUS_ADDR_IER, Register & (~Mask));
}

void XImage_filter_InterruptClear(XImage_filter *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XImage_filter_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XIMAGE_FILTER_CTRL_BUS_ADDR_ISR, Mask);
}

u32 XImage_filter_InterruptGetEnabled(XImage_filter *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XImage_filter_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XIMAGE_FILTER_CTRL_BUS_ADDR_IER);
}

u32 XImage_filter_InterruptGetStatus(XImage_filter *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XImage_filter_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XIMAGE_FILTER_CTRL_BUS_ADDR_ISR);
}

