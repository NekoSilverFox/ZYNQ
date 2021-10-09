/*
 * main.c
 *
 *  Created on: 2021��9��14��
 *      Author: NekoSilverfox
 */

#include <stdio.h>
#include "xparameters.h" // ����������Ϣ
#include "xgpiops.h"     // ����PS GPIO�ĺ���
#include "xscugic.h"	// Intc
#include "sleep.h"       // ����sleep()����

#define GPIO_DEVICE_ID  	XPAR_XGPIOPS_0_DEVICE_ID	/* GPIO �նϺ� */
#define INTC_DEVICE_ID		XPAR_SCUGIC_SINGLE_DEVICE_ID/* SCU GIC ID */
#define GPIO_INTERRUPT_ID	XPAR_XGPIOPS_0_INTR

//���ӵ�MIO��LED
#define MIO50_LED1 			50							/* ���İ�PS��LED */
#define MIO51_LED2 			51

//���ӵ�MIO��KEY
#define MIO_KEY1			0

XGpioPs_Config* ConfigPtr = NULL;
XScuGic_Config *IntcConfig; /* Instance of the interrupt controller */
XGpioPs Gpio;	/* The driver instance for GPIO Device. */
XScuGic Intc; /* The Instance of the Interrupt Controller Driver */
u32 key_press = 1;

void IntrHandler();
void SetupInterruptSystem(XScuGic *GicInstancePtr, XGpioPs *Gpio,u16 GpioIntrId);

/*****************************************************************************/
/**
*
* This function sets up the interrupt system for the example. It enables falling
* edge interrupts for all the pins of bank 0 in the GPIO device.
*
* @param	GicInstancePtr is a pointer to the XScuGic driver Instance.
* @param	GpioInstancePtr contains a pointer to the instance of the GPIO
*		component which is going to be connected to the interrupt
*		controller.
* @param	GpioIntrId is the interrupt Id and is typically
*		XPAR_<GICPS>_<GPIOPS_instance>_VEC_ID value from
*		xparameters.h.
*
* @return	XST_SUCCESS if successful, otherwise XST_FAILURE.
*
* @note		None.
*
****************************************************************************/
void SetupInterruptSystem(XScuGic *GicInstancePtr, XGpioPs *Gpio,
				u16 GpioIntrId)
{
	// ����GIC�ڼ�������Ϣ�������г�ʼ��
	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	XScuGic_CfgInitialize(GicInstancePtr, IntcConfig,IntcConfig->CpuBaseAddress);


	// ��ʼ��ARM�������쳣���
	Xil_ExceptionInit();
	// ��IRQע���쳣��������
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
				(Xil_ExceptionHandler)XScuGic_InterruptHandler,
				GicInstancePtr);
	// ʹ�ܴ������ж�
	Xil_ExceptionEnableMask(XIL_EXCEPTION_IRQ);


	// �����жϴ�������
	XScuGic_Connect(GicInstancePtr, GpioIntrId,		/* �ж�ID */
				(Xil_ExceptionHandler)IntrHandler,	/* �жϴ������� */
				(void *)Gpio);


	// Ϊ GPIO ����ʹ���жϣ��� GPIO ����
	XScuGic_Enable(GicInstancePtr, GpioIntrId);
	// ����MIO�����жϴ������ͣ�										�½���
	XGpioPs_SetIntrTypePin(Gpio, MIO_KEY1, XGPIOPS_IRQ_TYPE_EDGE_FALLING);
	// �� MIO �����ж�ʹ���ź�
	XGpioPs_IntrEnablePin(Gpio, MIO_KEY1);
}

void IntrHandler() {
	printf("Interrupt detected!\n\r");

	key_press = 0;

	// ���Σ��رգ��ж�
	XGpioPs_IntrDisablePin(&Gpio, MIO_KEY1);
}

int main() {
	printf("GPIO INTERRUPT TEST!\n\r");

	// 0. ��ʼ��GPIO����
	// ����������ID������������������Ϣ
	ConfigPtr = XGpioPs_LookupConfig(GPIO_DEVICE_ID);

	// ��ʼ��GPIO����
	int Status = XGpioPs_CfgInitialize(&Gpio, ConfigPtr, ConfigPtr->BaseAddr);
    if (Status != XST_SUCCESS){
        return XST_FAILURE;
    }


	// 1. GPIO��������Ϊ�����0 - ���룻1 - �����
	XGpioPs_SetDirectionPin(&Gpio, MIO50_LED1, 1);

	// 2. �������ʹ�ܣ�0 - �ر����ʹ�ܣ�1 - �����ʹ�ܣ�
	XGpioPs_SetOutputEnablePin(&Gpio, MIO50_LED1, 1);

	// �����ж�ϵͳ
	SetupInterruptSystem(&Intc, &Gpio, GPIO_INTERRUPT_ID);

	int led_value = 0;
	while(1) {
		if (key_press == 0) {
			key_press = 1;			/* ���ð��� */
			led_value = ~led_value;	/* ֱ��ȡ���Ϳ���  */

			// ���֮ǰ���ж�״̬��INT State��
			XGpioPs_IntrClearPin(&Gpio, MIO_KEY1);

			// �� led_value ��ֵд�����
			XGpioPs_WritePin(&Gpio, MIO50_LED1, led_value);

			// ��ʱ��������Ϊ�е�ʱ����Ӱ�һ�»ᴥ������жϣ�����������Щ�������е��ݵĻ��Ͳ���Ҫ���������������
			usleep(250000);

			// ʹ�ܰ����ж�
			XGpioPs_IntrEnablePin(&Gpio, MIO_KEY1);
		}
	}

	return 0;
}
