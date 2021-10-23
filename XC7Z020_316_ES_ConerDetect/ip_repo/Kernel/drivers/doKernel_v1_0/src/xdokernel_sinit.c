// ==============================================================
// File generated on Thu Mar 12 10:39:21 +0800 2020
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xdokernel.h"

extern XDokernel_Config XDokernel_ConfigTable[];

XDokernel_Config *XDokernel_LookupConfig(u16 DeviceId) {
	XDokernel_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XDOKERNEL_NUM_INSTANCES; Index++) {
		if (XDokernel_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XDokernel_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XDokernel_Initialize(XDokernel *InstancePtr, u16 DeviceId) {
	XDokernel_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XDokernel_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XDokernel_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

