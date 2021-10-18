// ==============================================================
// File generated on Tue Mar 10 09:24:31 +0800 2020
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XIMAGE_FILTER_H
#define XIMAGE_FILTER_H

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
#include "ximage_filter_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Ctrl_bus_BaseAddress;
} XImage_filter_Config;
#endif

typedef struct {
    u32 Ctrl_bus_BaseAddress;
    u32 IsReady;
} XImage_filter;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XImage_filter_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XImage_filter_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XImage_filter_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XImage_filter_ReadReg(BaseAddress, RegOffset) \
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
int XImage_filter_Initialize(XImage_filter *InstancePtr, u16 DeviceId);
XImage_filter_Config* XImage_filter_LookupConfig(u16 DeviceId);
int XImage_filter_CfgInitialize(XImage_filter *InstancePtr, XImage_filter_Config *ConfigPtr);
#else
int XImage_filter_Initialize(XImage_filter *InstancePtr, const char* InstanceName);
int XImage_filter_Release(XImage_filter *InstancePtr);
#endif

void XImage_filter_Start(XImage_filter *InstancePtr);
u32 XImage_filter_IsDone(XImage_filter *InstancePtr);
u32 XImage_filter_IsIdle(XImage_filter *InstancePtr);
u32 XImage_filter_IsReady(XImage_filter *InstancePtr);
void XImage_filter_EnableAutoRestart(XImage_filter *InstancePtr);
void XImage_filter_DisableAutoRestart(XImage_filter *InstancePtr);

void XImage_filter_Set_width(XImage_filter *InstancePtr, u32 Data);
u32 XImage_filter_Get_width(XImage_filter *InstancePtr);
void XImage_filter_Set_height(XImage_filter *InstancePtr, u32 Data);
u32 XImage_filter_Get_height(XImage_filter *InstancePtr);

void XImage_filter_InterruptGlobalEnable(XImage_filter *InstancePtr);
void XImage_filter_InterruptGlobalDisable(XImage_filter *InstancePtr);
void XImage_filter_InterruptEnable(XImage_filter *InstancePtr, u32 Mask);
void XImage_filter_InterruptDisable(XImage_filter *InstancePtr, u32 Mask);
void XImage_filter_InterruptClear(XImage_filter *InstancePtr, u32 Mask);
u32 XImage_filter_InterruptGetEnabled(XImage_filter *InstancePtr);
u32 XImage_filter_InterruptGetStatus(XImage_filter *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
