/*
 * StandaloneCDMA_Xilinx.h
 *
 *  Created on: 2021��10��1��
 *      Author: mi
 */

#ifndef SRC_STANDALONECDMA_XILINX_H_
#define SRC_STANDALONECDMA_XILINX_H_

/*
 * Copyright (c) 2015 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 */

#include <stdio.h>
#include "xaxicdma.h"
#include "xdebug.h"
#include "xil_exception.h"
#include "xil_cache.h"
#include "xparameters.h"
#include "xscugic.h"

#define NUMBER_OF_TRANSFERS	2	/* Number of simple transfers to do */
#define DMA_CTRL_DEVICE_ID	XPAR_AXICDMA_0_DEVICE_ID
#define INTC_DEVICE_ID		XPAR_SCUGIC_SINGLE_DEVICE_ID
#define DMA_CTRL_IRPT_INTR	XPAR_FABRIC_AXI_CDMA_0_CDMA_INTROUT_INTR

static int Done;	/* Dma transfer is done */
static int Error;	/* Dma Bus Error occurs */

static u32 SourceAddr = 0x20000000;
static u32 DestAddr	= 0x30000000;

static XAxiCdma AxiCdmaInstance;	/* Instance of the XAxiCdma */
static XScuGic IntcController;	/* Instance of the Interrupt Controller */


//Array and 3 and 4 store data to be sent to DDR memory
static int Array_3[32][16];
static int Array_4[32][16];

//interemdiate stored data
static int Array_1[32][16];
static int Array_2[32][16];

//input seeds for psuedo random data
int const input[16] = {0xb504f33, 0xabeb4a0, 0xa267994, 0x987fbfc, 0x8e39d9c,
		0x839c3cc, 0x78ad74c, 0x6d743f4, 0x61f78a8, 0x563e6a8,
		0x4a5018c, 0x3e33f2c, 0x31f1704, 0x259020c, 0x1917a64,
		0xc8fb2c};
/* Length of the buffers for DMA transfer */
static u32 BUFFER_BYTESIZE	= (XPAR_AXI_CDMA_0_M_AXI_DATA_WIDTH
			* XPAR_AXI_CDMA_0_M_AXI_MAX_BURST_LEN);


static int CDMATransfer(XAxiCdma *InstancePtr, int Length, int Retries);

static void DisableIntrSystem(XScuGic *IntcInstancePtr, u32 IntrId)
{
		XScuGic_Disable(IntcInstancePtr, IntrId);
		XScuGic_Disconnect(IntcInstancePtr, IntrId);
}

//Multiply and Shift
int MUL_SHIFT_30(int x, int y)
{
	return ((int) (((long long) (x) * (y)) >> 30));
}


void MULT_SHIFT_LOOP(int Value)
{
	int i, j;

	for (i = 0; i < 32; i++) {
		for (j = 0; j < 16; j++) {
			Array_3[i][j] = (int)((MUL_SHIFT_30(input[j],
						Array_1[j][i])) + Value);
			Array_4[i][j] = (int)((MUL_SHIFT_30(input[j],
						Array_2[j][i])) + Value);
		}
	}
}

void TestPattern_Initialization(void)
{
	int i, j;

	for (i = 0; i < 32; i++) {
		for (j = 0; j < 16; j++) {
			Array_1[i][j] =  (int) ((0xA5A5A5A5 >> 1) * i);
			Array_2[i][j] =  (int) ((0xA5A5A5A5 << 1) * i);
		}
	}
}

/******************************************************************************
 *
 * Callback function for the simple transfer. It is called by the driver's
 * interrupt handler.
 *
 * @param	CallBackRef is the reference pointer registered through
 *		transfer submission. In this case, it is the pointer to the
 *		driver instance
 * @param	IrqMask is the interrupt mask the driver interrupt handler
 *		passes to the callback function.
 * @param	IgnorePtr is a pointer that is ignored by simple callback
 *		function
 *
 * @return	None
 *
 * @note		None
 *
 *****************************************************************************/
static void Cdma_CallBack(void *CallBackRef, u32 IrqMask, int *IgnorePtr)
{

	if (IrqMask & XAXICDMA_XR_IRQ_ERROR_MASK) {
		Error = TRUE;
		printf("--- Transfer Error --- \r\n");
	}

	if (IrqMask & XAXICDMA_XR_IRQ_IOC_MASK) {
		printf("--- Transfer Done --- \r\n");
		Done = TRUE;
	}

}

static int SetupIntrSystem(XScuGic *IntcInstancePtr, XAxiCdma *InstancePtr,
		u32 IntrId)
{
	int Status;


	/*
	 * Initialize the interrupt controller driver
	 */
	XScuGic_Config *IntcConfig;


	/*
	 * Initialize the interrupt controller driver so that it is ready to
	 * use.
	 */
	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	if (IntcConfig == NULL)
		return XST_FAILURE;

	Status = XScuGic_CfgInitialize(IntcInstancePtr, IntcConfig,
					IntcConfig->CpuBaseAddress);
	if (Status != XST_SUCCESS)
		return XST_FAILURE;

	XScuGic_SetPriorityTriggerType(IntcInstancePtr, IntrId, 0xA0, 0x3);

	/*
	 * Connect the device driver handler that will be called when an
	 * interrupt for the device occurs, the handler defined above performs
	 * the specific interrupt processing for the device.
	 */
	Status = XScuGic_Connect(IntcInstancePtr, IntrId,
				(Xil_InterruptHandler)XAxiCdma_IntrHandler,
				InstancePtr);

	if (Status != XST_SUCCESS)
		return Status;

	/*
	 * Enable the interrupt for the DMA device.
	 */
	XScuGic_Enable(IntcInstancePtr, IntrId);




	Xil_ExceptionInit();

	/*
	 * Connect the interrupt controller interrupt handler to the hardware
	 * interrupt handling logic in the processor.
	 */
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_IRQ_INT,
				(Xil_ExceptionHandler)XScuGic_InterruptHandler,
				IntcInstancePtr);


	/*
	 * Enable interrupts in the Processor.
	 */
	Xil_ExceptionEnable();


	return XST_SUCCESS;
}


int XAxiCdma_Interrupt(XScuGic *IntcInstancePtr, XAxiCdma *InstancePtr,
		u16 DeviceId, u32 IntrId)
{
	XAxiCdma_Config *CfgPtr;
	int Status;
	int SubmitTries = 1;		/* Retry to submit */
	int Tries = NUMBER_OF_TRANSFERS;
	int Index;

	/* Initialize the XAxiCdma device. */
	CfgPtr = XAxiCdma_LookupConfig(DeviceId);
	if (!CfgPtr)
		return XST_FAILURE;

	Status = XAxiCdma_CfgInitialize(InstancePtr,
			CfgPtr,
			CfgPtr->BaseAddress);
	if (Status != XST_SUCCESS)
		return XST_FAILURE;

	/* Setup the interrupt system */
	Status = SetupIntrSystem(IntcInstancePtr, InstancePtr, IntrId);
	if (Status != XST_SUCCESS)
		return XST_FAILURE;

	/* Enable all (completion/error/delay) interrupts */
	XAxiCdma_IntrEnable(InstancePtr, XAXICDMA_XR_IRQ_ALL_MASK);

	for (Index = 0; Index < Tries; Index++) {
		Status = CDMATransfer(InstancePtr,
			   BUFFER_BYTESIZE, SubmitTries);

		if (Status != XST_SUCCESS) {
			DisableIntrSystem(IntcInstancePtr, IntrId);
			return XST_FAILURE;
		}
	}

	/* Test finishes successfully, clean up and return */
	DisableIntrSystem(IntcInstancePtr, IntrId);

	return XST_SUCCESS;
}

/******************************************************************************
 *
 *
 * This function does CDMA transfer
 *
 * @param	InstancePtr is a pointer to the XAxiCdma instance
 * @param	Length is the transfer length
 * @param	Retries is how many times to retry on submission
 *
 * @return
 *		- XST_SUCCESS if transfer is successful
 *		- XST_FAILURE if either the transfer fails or the data has
 *		  error
 *
 * @note	None
 *
 *****************************************************************************/
static int CDMATransfer(XAxiCdma *InstancePtr, int Length, int Retries)
{
	int Status;

	printf("Start Transfer \r\n");

	/* Try to start the DMA transfer */
	Done = FALSE;
	Error = FALSE;

	/* Flush the SrcBuffer before the DMA transfer, in case the Data Cache
	 *	is enabled
	 */
	Xil_DCacheFlushRange((u32)SourceAddr, Length);

	Status = XAxiCdma_SimpleTransfer(InstancePtr,
				(u32)(u8 *) (SourceAddr),
				(u32)(DestAddr),
				Length,
				Cdma_CallBack,
				(void *)InstancePtr);

	if (Status == XST_FAILURE) {
		printf("Error in Transfer  \r\n");
		return 1;
	}

	/* Wait until the DMA transfer is done */
	while (!Done && !Error)
		;

	if (Error) {
		return XST_FAILURE;
		return 1;
	}


	/* Invalidate the DestBuffer before receiving the data, in case the
	 * Data Cache is enabled
	 */
	Xil_DCacheInvalidateRange((u32)DestAddr, Length);

	return XST_SUCCESS;
}


int testcdmaexample(void)
{
	int Status;
	u32 *SrcPtr;
	u32 *DestPtr;
	unsigned int  Index;
	int i, j;

	printf("--- Entering %s --- \r\n", __func__);

	/**********************************************************************
	 * Step : 1 :	Initialization of the Source Memory with the Specified
	 *			test pattern
	 *		Clear Destination memory
	 *********************************************************************/
	TestPattern_Initialization();

	/* Initialize the source buffer bytes with a pattern and the
	 * destination buffer bytes to zero
	 */
	SrcPtr = (u32 *)SourceAddr;
	DestPtr = (u32 *)DestAddr;
	for (Index = 0; Index < (BUFFER_BYTESIZE/1024); Index++) {
		MULT_SHIFT_LOOP((Index*100));
		for (i = 0; i < 32; i++) {
			for (j = 0; j < 16; j++) {
				SrcPtr[((i+j))*(Index+1)]	= Array_3[i][j];
				SrcPtr[((i+j)*(Index+1)) + 1]	= Array_4[i][j];
				DestPtr[(i+j)*(Index+1)]	= 0;
				DestPtr[((i+j)*(Index+1)) + 1]	= 0;
			}
		}
	}

	/**********************************************************************
	 * Step : 2 :	AXI CDMA Initialization
	 *		Association of the CDMA ISR with the Interrupt
	 *		Enable the CDMA Interrupt
	 *		Provide Source and destination location to CDMA
	 *		Specified Number of byte to be transfer to CDMA
	 *			register
	 *		Start the CDMA
	 *		Wait for the Interrupt and return the status
	 *********************************************************************/

	Status = XAxiCdma_Interrupt(&IntcController,
					&AxiCdmaInstance,
					DMA_CTRL_DEVICE_ID,
					DMA_CTRL_IRPT_INTR);

	if (Status != XST_SUCCESS) {
		printf("XAxiCdma_Interrupt: Failed\r\n");
		return XST_FAILURE;
	}

	xil_printf("XAxiCdma_Interrupt: Passed\r\n");


	/**********************************************************************
	 * Step : 3 :	Compare Source memory with Destination memory
	 *		Return the Status
	 *********************************************************************/
	for (Index = 0; Index < (BUFFER_BYTESIZE/4); Index++) {
		if (DestPtr[Index] != SrcPtr[Index]) {
			printf("Error in Comparison : Index : %x \r\n", Index);
			return XST_FAILURE;
		}
	}

	printf("DMA Transfer is Successful \r\n");
	return XST_SUCCESS;
}

#endif /* SRC_STANDALONECDMA_XILINX_H_ */
