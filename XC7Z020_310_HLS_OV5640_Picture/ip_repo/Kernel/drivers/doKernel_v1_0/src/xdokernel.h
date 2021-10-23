// ==============================================================
// File generated on Wed May 13 09:29:52 +0800 2020
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XDOKERNEL_H
#define XDOKERNEL_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xdokernel_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Ctrl_bus_BaseAddress;
    u32 Kernel_bus_BaseAddress;
} XDokernel_Config;
#endif

typedef struct {
    u32 Ctrl_bus_BaseAddress;
    u32 Kernel_bus_BaseAddress;
    u32 IsReady;
} XDokernel;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XDokernel_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XDokernel_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XDokernel_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XDokernel_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XDokernel_Initialize(XDokernel *InstancePtr, u16 DeviceId);
XDokernel_Config* XDokernel_LookupConfig(u16 DeviceId);
int XDokernel_CfgInitialize(XDokernel *InstancePtr, XDokernel_Config *ConfigPtr);
#else
int XDokernel_Initialize(XDokernel *InstancePtr, const char* InstanceName);
int XDokernel_Release(XDokernel *InstancePtr);
#endif

void XDokernel_Start(XDokernel *InstancePtr);
u32 XDokernel_IsDone(XDokernel *InstancePtr);
u32 XDokernel_IsIdle(XDokernel *InstancePtr);
u32 XDokernel_IsReady(XDokernel *InstancePtr);
void XDokernel_EnableAutoRestart(XDokernel *InstancePtr);
void XDokernel_DisableAutoRestart(XDokernel *InstancePtr);

void XDokernel_Set_operation(XDokernel *InstancePtr, u32 Data);
u32 XDokernel_Get_operation(XDokernel *InstancePtr);
u32 XDokernel_Get_kernel_BaseAddress(XDokernel *InstancePtr);
u32 XDokernel_Get_kernel_HighAddress(XDokernel *InstancePtr);
u32 XDokernel_Get_kernel_TotalBytes(XDokernel *InstancePtr);
u32 XDokernel_Get_kernel_BitWidth(XDokernel *InstancePtr);
u32 XDokernel_Get_kernel_Depth(XDokernel *InstancePtr);
u32 XDokernel_Write_kernel_Words(XDokernel *InstancePtr, int offset, int *data, int length);
u32 XDokernel_Read_kernel_Words(XDokernel *InstancePtr, int offset, int *data, int length);
u32 XDokernel_Write_kernel_Bytes(XDokernel *InstancePtr, int offset, char *data, int length);
u32 XDokernel_Read_kernel_Bytes(XDokernel *InstancePtr, int offset, char *data, int length);

void XDokernel_InterruptGlobalEnable(XDokernel *InstancePtr);
void XDokernel_InterruptGlobalDisable(XDokernel *InstancePtr);
void XDokernel_InterruptEnable(XDokernel *InstancePtr, u32 Mask);
void XDokernel_InterruptDisable(XDokernel *InstancePtr, u32 Mask);
void XDokernel_InterruptClear(XDokernel *InstancePtr, u32 Mask);
u32 XDokernel_InterruptGetEnabled(XDokernel *InstancePtr);
u32 XDokernel_InterruptGetStatus(XDokernel *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
