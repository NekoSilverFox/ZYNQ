// ==============================================================
// File generated on Wed May 13 10:16:54 +0800 2020
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xdocorner.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XDocorner_CfgInitialize(XDocorner *InstancePtr, XDocorner_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Ctrl_bus_BaseAddress = ConfigPtr->Ctrl_bus_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XDocorner_Start(XDocorner *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDocorner_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XDOCORNER_CTRL_BUS_ADDR_AP_CTRL) & 0x80;
    XDocorner_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XDOCORNER_CTRL_BUS_ADDR_AP_CTRL, Data | 0x01);
}

u32 XDocorner_IsDone(XDocorner *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDocorner_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XDOCORNER_CTRL_BUS_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XDocorner_IsIdle(XDocorner *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDocorner_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XDOCORNER_CTRL_BUS_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XDocorner_IsReady(XDocorner *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDocorner_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XDOCORNER_CTRL_BUS_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XDocorner_EnableAutoRestart(XDocorner *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDocorner_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XDOCORNER_CTRL_BUS_ADDR_AP_CTRL, 0x80);
}

void XDocorner_DisableAutoRestart(XDocorner *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDocorner_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XDOCORNER_CTRL_BUS_ADDR_AP_CTRL, 0);
}

void XDocorner_InterruptGlobalEnable(XDocorner *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDocorner_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XDOCORNER_CTRL_BUS_ADDR_GIE, 1);
}

void XDocorner_InterruptGlobalDisable(XDocorner *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDocorner_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XDOCORNER_CTRL_BUS_ADDR_GIE, 0);
}

void XDocorner_InterruptEnable(XDocorner *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XDocorner_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XDOCORNER_CTRL_BUS_ADDR_IER);
    XDocorner_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XDOCORNER_CTRL_BUS_ADDR_IER, Register | Mask);
}

void XDocorner_InterruptDisable(XDocorner *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XDocorner_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XDOCORNER_CTRL_BUS_ADDR_IER);
    XDocorner_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XDOCORNER_CTRL_BUS_ADDR_IER, Register & (~Mask));
}

void XDocorner_InterruptClear(XDocorner *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDocorner_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XDOCORNER_CTRL_BUS_ADDR_ISR, Mask);
}

u32 XDocorner_InterruptGetEnabled(XDocorner *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDocorner_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XDOCORNER_CTRL_BUS_ADDR_IER);
}

u32 XDocorner_InterruptGetStatus(XDocorner *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDocorner_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XDOCORNER_CTRL_BUS_ADDR_ISR);
}

