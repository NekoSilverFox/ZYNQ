// ==============================================================
// File generated on Wed May 13 10:16:54 +0800 2020
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xdocorner.h"

extern XDocorner_Config XDocorner_ConfigTable[];

XDocorner_Config *XDocorner_LookupConfig(u16 DeviceId) {
	XDocorner_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XDOCORNER_NUM_INSTANCES; Index++) {
		if (XDocorner_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XDocorner_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XDocorner_Initialize(XDocorner *InstancePtr, u16 DeviceId) {
	XDocorner_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XDocorner_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XDocorner_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

