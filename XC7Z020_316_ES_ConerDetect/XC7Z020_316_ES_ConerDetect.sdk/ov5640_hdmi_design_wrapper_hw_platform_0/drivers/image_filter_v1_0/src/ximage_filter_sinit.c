// ==============================================================
// File generated on Tue Mar 10 09:24:31 +0800 2020
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "ximage_filter.h"

extern XImage_filter_Config XImage_filter_ConfigTable[];

XImage_filter_Config *XImage_filter_LookupConfig(u16 DeviceId) {
	XImage_filter_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XIMAGE_FILTER_NUM_INSTANCES; Index++) {
		if (XImage_filter_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XImage_filter_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XImage_filter_Initialize(XImage_filter *InstancePtr, u16 DeviceId) {
	XImage_filter_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XImage_filter_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XImage_filter_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

