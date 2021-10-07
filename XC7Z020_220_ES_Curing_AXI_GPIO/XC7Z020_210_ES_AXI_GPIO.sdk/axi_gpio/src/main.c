/*
 * main.c
 *
 *  Created on: 2021��9��17��
 *      Author: NekoSilverfox
 */

#include <stdio.h>
#include "xparameters.h"	// ����������Ϣ
#include "xgpiops.h"		// ����PS GPIO�ĺ���
#include "xgpio.h"			// ����AXI GPIO�ĺ���
#include "xscugic.h"		// Intc
#include "sleep.h"			// ����sleep()����


// ---------------------- define ----------------------
#define PS_GPIO_DEVICE_ID  	XPAR_XGPIOPS_0_DEVICE_ID	/* PS GPIO ����ID */
#define INTC_DEVICE_ID		XPAR_SCUGIC_SINGLE_DEVICE_ID/* �жϿ�������SCU GIC�� ����ID */
#define AXI_GPIO_DEVICE_ID	XPAR_GPIO_0_DEVICE_ID		/* AXI GPIO ����ID */

#define PS_GPIO_INTERRUPT_ID	XPAR_XGPIOPS_0_INTR		/* PS GPIO �жϺ�(52) */
#define AXI_GPIO_INTERRUPT_ID	61						/* AXI GPIO �жϺ�(61) */

// LED
#define MIO50_LED1 			50							/* ���İ�PS��LED1 */
#define MIO51_LED2 			51							/* ���İ�PS��LED2 */

// KEY
#define MIO_KEY1			0							/* ���ӵ� PS-MIO ��KEY1 */
#define GPIO_CHANNEL_1		1
#define KEY_ON				0							/* �������£��͵�ƽ�� */
#define KEY_OFF				1							/* �����رգ��ߵ�ƽ�� */

#define true				1
#define false				0
// -----------------------------------------------------



// -------------------- ʵ����ȫ�ֱ��� --------------------
XGpioPs_Config* pConfigPtr = NULL;
XScuGic_Config* pIntcConfig; 							/* Instance of the interrupt controller */

XGpioPs PsGpio;										/* The driver instance for GPIO Device. */
XScuGic Intc; 											/* The Instance of the Interrupt Controller Driver */

XGpio AxiGpio;											/* The Instance of the GPIO Driver */

u32 key_press = 1;
// -----------------------------------------------------



// ---------------------- �������� -----------------------
void IntrHandler();
void SetupPsInterruptSystem(XScuGic *GicInstancePtr, XGpioPs *PsGpio,u16 GpioIntrId);
void SetupAxiInterruptSystem(XScuGic *GicInstancePtr, XGpio *AxiGpio, u16 AxiGpioIntrId);
// -----------------------------------------------------



// -----------------------------------------------------
void SetupPsInterruptSystem(XScuGic *GicInstancePtr, XGpioPs *PsGpio, u16 GpioIntrId)
{
	// ����GIC�ڼ�������Ϣ�������г�ʼ��
	pIntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	XScuGic_CfgInitialize(GicInstancePtr, pIntcConfig,pIntcConfig->CpuBaseAddress);


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
				(void *)PsGpio);


	// Ϊ GPIO ����ʹ���жϣ��� GPIO ����
	XScuGic_Enable(GicInstancePtr, GpioIntrId);
	// ����MIO�����жϴ������ͣ�										�½���
	XGpioPs_SetIntrTypePin(PsGpio, MIO_KEY1, XGPIOPS_IRQ_TYPE_EDGE_FALLING);
	// �� MIO �����ж�ʹ���ź�
	XGpioPs_IntrEnablePin(PsGpio, MIO_KEY1);
}

void SetupAxiInterruptSystem(XScuGic *GicInstancePtr, XGpio *AxiGpio,
				u16 AxiGpioIntrId)
{
	// ��GIC������GIC���жϿ��������ڼ�������Ϣ�������г�ʼ��
	pIntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	XScuGic_CfgInitialize(GicInstancePtr, pIntcConfig,pIntcConfig->CpuBaseAddress);


	// ��IRQ������IRQ���ж����󣩣�
	Xil_ExceptionInit();								/* ��ʼ��ARM�������쳣��� */
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,	/* ��IRQע���쳣�������� */
				(Xil_ExceptionHandler)XScuGic_InterruptHandler,
				GicInstancePtr);
	Xil_ExceptionEnableMask(XIL_EXCEPTION_IRQ);			/* ʹ�ܴ������ж� */


	// �����������������жϴ�������
	XScuGic_Connect(GicInstancePtr, AxiGpioIntrId,		/* �ж�ID */
				(Xil_ExceptionHandler)IntrHandler,		/* �жϴ������� */
				(void *)AxiGpio);


	// ������ʹ�ܡ�Ϊ AXI GPIO ����ʹ���жϣ��� GPIO ����
	XScuGic_Enable(GicInstancePtr, AxiGpioIntrId);

	// �����ж����ͼ����ȼ�				�жϿ�����		�ж�ID	�ж����ȼ� ��	�� �ж�����(����Ч����ƽ��������)
	XScuGic_SetPriorityTriggerType(GicInstancePtr, AxiGpioIntrId, 0xA0, 0x1);

	// ��IP�ڲ��� AXI GPIO �ж�ʹ��
	XGpio_InterruptGlobalEnable(AxiGpio);						/* ��ȫ���ж�ʹ�� */
	XGpio_InterruptEnable(AxiGpio, 0x00000001);					/* ��ͨ���źŶ�Ӧ���ж�ʹ�� */
}

// �жϷ�����
void IntrHandler() {
	printf("Interrupt detected!\n\r");

	key_press = 0;

	// ���Σ��رգ�PS �ж�
	// XGpioPs_IntrDisablePin(&PsGpio, MIO_KEY1);

	// ���Σ��رգ�AXI GPIO ͨ��1 �ж�ʹ���ź�
	XGpio_InterruptDisable(&AxiGpio, 0x00000001);
}

int main() {
	printf("AXI-GPIO INTERRUPT TEST!\n\r");

	// ����ʼ�������� PS�� GPIO ���ò���ʼ��
	pConfigPtr = XGpioPs_LookupConfig(PS_GPIO_DEVICE_ID);			/* ����������ID������������������Ϣ */
	int Status = XGpioPs_CfgInitialize(&PsGpio, pConfigPtr, pConfigPtr->BaseAddr);	/* ��ʼ��PS��GPIO���� */
    if (Status != XST_SUCCESS){
        return XST_FAILURE;
    }

    // ����ʼ����AXI �� GPIO ���ò���ʼ��������Ҫ���ң�ֱ�ӵ����ֳɵĺ�������xgpio.h �ж��塣��ȻҲ���Ժ�����һ��
    XGpio_Initialize(&AxiGpio, AXI_GPIO_DEVICE_ID);


    // ��LED1��PS �� GPIO ����Ϊ����������ʹ��
	XGpioPs_SetDirectionPin(&PsGpio, MIO50_LED1, 1);				/* 1. PS GPIO��������Ϊ�����0 - ���룻1 - ����� */
	XGpioPs_SetOutputEnablePin(&PsGpio, MIO50_LED1, 1);				/* 2. �������ʹ�ܣ�0 - �ر����ʹ�ܣ�1 - �����ʹ�ܣ� */

	// ����AXI �� GPIO ����Ϊ����������ʹ��
	XGpio_SetDataDirection(&AxiGpio, GPIO_CHANNEL_1, 0x00000001);	/* 0 - �����1 - ���롣�����λIO��Ϊ���롣1������4λ�� */


	// ���жϡ�
	// SetupPsInterruptSystem(&Intc, &PsGpio, PS_GPIO_INTERRUPT_ID);	/*�����ж�ϵͳ*/
	SetupAxiInterruptSystem(&Intc, &AxiGpio, AXI_GPIO_INTERRUPT_ID);	/*�����ж�ϵͳ*/

	int led_value = 0;
	while(true) {
		if (key_press == 0) {
			key_press = 1;			/* ���ð��� */

			// �жϰ�����״̬��������������£��͵�ƽ�������𣬾͸ı�LED��״̬
			if (XGpio_DiscreteRead(&AxiGpio, GPIO_CHANNEL_1) == KEY_OFF) {	/*�����KEY_OFF���򰴼�����ʱ�ı�LED�������KEY_ON�����µ�˲��͸ı�LED*/
				led_value = ~led_value;			/* ֱ��ȡ���Ϳ���  */
			}

			// ���֮ǰ���ж�״̬��INT State��
			// XGpioPs_IntrClearPin(&PsGpio, MIO_KEY1);
			XGpio_InterruptClear(&AxiGpio, 0x00000001);

			// �� led_value ��ֵд�����
			XGpioPs_WritePin(&PsGpio, MIO50_LED1, led_value);

			// ��ʱ��������Ϊ�е�ʱ����Ӱ�һ�»ᴥ������жϣ�����������Щ�������е��ݵĻ��Ͳ���Ҫ���������������
			usleep(250000);

			// ʹ�ܰ����ж�
			// XGpioPs_IntrEnablePin(&PsGpio, MIO_KEY1);
			XGpio_InterruptEnable(&AxiGpio, 0x00000001);					/* ���´�ͨ��1��Ӧ���ж�ʹ�� */
		}
	}

	return 0;
}
