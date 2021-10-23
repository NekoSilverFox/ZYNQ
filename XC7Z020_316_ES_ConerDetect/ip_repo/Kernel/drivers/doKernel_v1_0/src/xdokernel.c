// ==============================================================
// File generated on Thu Mar 12 10:39:21 +0800 2020
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xdokernel.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XDokernel_CfgInitialize(XDokernel *InstancePtr, XDokernel_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Ctrl_bus_BaseAddress = ConfigPtr->Ctrl_bus_BaseAddress;
    InstancePtr->Kernel_bus_BaseAddress = ConfigPtr->Kernel_bus_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XDokernel_Start(XDokernel *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDokernel_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XDOKERNEL_CTRL_BUS_ADDR_AP_CTRL) & 0x80;
    XDokernel_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XDOKERNEL_CTRL_BUS_ADDR_AP_CTRL, Data | 0x01);
}

u32 XDokernel_IsDone(XDokernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDokernel_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XDOKERNEL_CTRL_BUS_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XDokernel_IsIdle(XDokernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDokernel_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XDOKERNEL_CTRL_BUS_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XDokernel_IsReady(XDokernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDokernel_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XDOKERNEL_CTRL_BUS_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XDokernel_EnableAutoRestart(XDokernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDokernel_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XDOKERNEL_CTRL_BUS_ADDR_AP_CTRL, 0x80);
}

void XDokernel_DisableAutoRestart(XDokernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDokernel_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XDOKERNEL_CTRL_BUS_ADDR_AP_CTRL, 0);
}

void XDokernel_Set_operation(XDokernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDokernel_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XDOKERNEL_CTRL_BUS_ADDR_OPERATION_DATA, Data);
}

u32 XDokernel_Get_operation(XDokernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDokernel_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XDOKERNEL_CTRL_BUS_ADDR_OPERATION_DATA);
    return Data;
}

u32 XDokernel_Get_kernel_BaseAddress(XDokernel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Kernel_bus_BaseAddress + XDOKERNEL_KERNEL_BUS_ADDR_KERNEL_BASE);
}

u32 XDokernel_Get_kernel_HighAddress(XDokernel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Kernel_bus_BaseAddress + XDOKERNEL_KERNEL_BUS_ADDR_KERNEL_HIGH);
}

u32 XDokernel_Get_kernel_TotalBytes(XDokernel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDOKERNEL_KERNEL_BUS_ADDR_KERNEL_HIGH - XDOKERNEL_KERNEL_BUS_ADDR_KERNEL_BASE + 1);
}

u32 XDokernel_Get_kernel_BitWidth(XDokernel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDOKERNEL_KERNEL_BUS_WIDTH_KERNEL;
}

u32 XDokernel_Get_kernel_Depth(XDokernel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDOKERNEL_KERNEL_BUS_DEPTH_KERNEL;
}

u32 XDokernel_Write_kernel_Words(XDokernel *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDOKERNEL_KERNEL_BUS_ADDR_KERNEL_HIGH - XDOKERNEL_KERNEL_BUS_ADDR_KERNEL_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Kernel_bus_BaseAddress + XDOKERNEL_KERNEL_BUS_ADDR_KERNEL_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDokernel_Read_kernel_Words(XDokernel *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDOKERNEL_KERNEL_BUS_ADDR_KERNEL_HIGH - XDOKERNEL_KERNEL_BUS_ADDR_KERNEL_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Kernel_bus_BaseAddress + XDOKERNEL_KERNEL_BUS_ADDR_KERNEL_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDokernel_Write_kernel_Bytes(XDokernel *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDOKERNEL_KERNEL_BUS_ADDR_KERNEL_HIGH - XDOKERNEL_KERNEL_BUS_ADDR_KERNEL_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Kernel_bus_BaseAddress + XDOKERNEL_KERNEL_BUS_ADDR_KERNEL_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDokernel_Read_kernel_Bytes(XDokernel *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDOKERNEL_KERNEL_BUS_ADDR_KERNEL_HIGH - XDOKERNEL_KERNEL_BUS_ADDR_KERNEL_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Kernel_bus_BaseAddress + XDOKERNEL_KERNEL_BUS_ADDR_KERNEL_BASE + offset + i);
    }
    return length;
}

void XDokernel_InterruptGlobalEnable(XDokernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDokernel_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XDOKERNEL_CTRL_BUS_ADDR_GIE, 1);
}

void XDokernel_InterruptGlobalDisable(XDokernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDokernel_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XDOKERNEL_CTRL_BUS_ADDR_GIE, 0);
}

void XDokernel_InterruptEnable(XDokernel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XDokernel_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XDOKERNEL_CTRL_BUS_ADDR_IER);
    XDokernel_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XDOKERNEL_CTRL_BUS_ADDR_IER, Register | Mask);
}

void XDokernel_InterruptDisable(XDokernel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XDokernel_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XDOKERNEL_CTRL_BUS_ADDR_IER);
    XDokernel_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XDOKERNEL_CTRL_BUS_ADDR_IER, Register & (~Mask));
}

void XDokernel_InterruptClear(XDokernel *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDokernel_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XDOKERNEL_CTRL_BUS_ADDR_ISR, Mask);
}

u32 XDokernel_InterruptGetEnabled(XDokernel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDokernel_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XDOKERNEL_CTRL_BUS_ADDR_IER);
}

u32 XDokernel_InterruptGetStatus(XDokernel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDokernel_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XDOKERNEL_CTRL_BUS_ADDR_ISR);
}

