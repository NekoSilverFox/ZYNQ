// ==============================================================
// File generated on Sun Oct 24 17:05:39 +0300 2021
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XDOCORNER_H
#define XDOCORNER_H

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
#include "xdocorner_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Ctrl_bus_BaseAddress;
} XDocorner_Config;
#endif

typedef struct {
    u32 Ctrl_bus_BaseAddress;
    u32 IsReady;
} XDocorner;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XDocorner_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XDocorner_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XDocorner_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XDocorner_ReadReg(BaseAddress, RegOffset) \
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
int XDocorner_Initialize(XDocorner *InstancePtr, u16 DeviceId);
XDocorner_Config* XDocorner_LookupConfig(u16 DeviceId);
int XDocorner_CfgInitialize(XDocorner *InstancePtr, XDocorner_Config *ConfigPtr);
#else
int XDocorner_Initialize(XDocorner *InstancePtr, const char* InstanceName);
int XDocorner_Release(XDocorner *InstancePtr);
#endif

void XDocorner_Start(XDocorner *InstancePtr);
u32 XDocorner_IsDone(XDocorner *InstancePtr);
u32 XDocorner_IsIdle(XDocorner *InstancePtr);
u32 XDocorner_IsReady(XDocorner *InstancePtr);
void XDocorner_EnableAutoRestart(XDocorner *InstancePtr);
void XDocorner_DisableAutoRestart(XDocorner *InstancePtr);


void XDocorner_InterruptGlobalEnable(XDocorner *InstancePtr);
void XDocorner_InterruptGlobalDisable(XDocorner *InstancePtr);
void XDocorner_InterruptEnable(XDocorner *InstancePtr, u32 Mask);
void XDocorner_InterruptDisable(XDocorner *InstancePtr, u32 Mask);
void XDocorner_InterruptClear(XDocorner *InstancePtr, u32 Mask);
u32 XDocorner_InterruptGetEnabled(XDocorner *InstancePtr);
u32 XDocorner_InterruptGetStatus(XDocorner *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
