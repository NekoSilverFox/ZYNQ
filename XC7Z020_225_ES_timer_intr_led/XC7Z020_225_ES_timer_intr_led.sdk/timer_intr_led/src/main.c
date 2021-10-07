/*
 * main.c
 *
 *  Created on: 2021��9��14��
 *      Author: NekoSilverfox
 */


#include <stdio.h>
#include "xparameters.h"			//����������Ϣ
#include "xgpiops.h"				//����PS GPIO�ĺ���
#include "sleep.h"					//����sleep()����
#include "xscutimer.h"				// ��ʱ��
#include "xscugic.h"

#define GPIO_DEVICE_ID  	XPAR_XGPIOPS_0_DEVICE_ID
#define TIMER_DEVICE_ID		XPAR_XSCUTIMER_0_DEVICE_ID
#define INTC_DEVICE_ID		XPAR_SCUGIC_SINGLE_DEVICE_ID
#define TIMER_IRPT_INTR		XPAR_SCUTIMER_INTR			/* ˽�ж�ʱ��ID */
//���ӵ�MIO��LED
#define MIO50_LED1 			50							/* ���İ�PS��LED */
#define MIO51_LED2 			51
#define TIMER_LOAD_VALUE	0x3F940A9					/* ��ʱʱ����Ҫ200ms ʱ��Ƶ�ʣ�333.333Mhz
													���㣺(1s = 1000ms = 100 0000ns)
														1. ���ڣ� 1000ms �� 333.333 �� 3ns
														2. ����ʱ�䣺200 000000 / 3ns =  66,666,666.66666
														3. ת16���ƣ� */

XGpioPs_Config* ConfigPtr = NULL;
XGpioPs Gpio;											/* The driver instance for GPIO Device. */
XScuTimer TimerInstance;								/* Cortex A9 Scu Private Timer Instance */
XScuGic IntcInstance;		/* Interrupt Controller Instance */


long init_mio_gpio() {
	// 0. ��ʼ��GPIO����
	// ����������ID������������������Ϣ
	ConfigPtr = XGpioPs_LookupConfig(GPIO_DEVICE_ID);

	// ��ʼ��GPIO����
	int Status = XGpioPs_CfgInitialize(&Gpio, ConfigPtr, ConfigPtr->BaseAddr);
    if (Status != XST_SUCCESS){
        return XST_FAILURE;
    }
}


// ��ʱ����ʼ��
void init_timer(XScuTimer* TimerInstancePtr, u16 TimerDeviceId) {
	// ��ʼ��˽�ж�ʱ�� Initialize the Scu Private Timer driver.
	XScuTimer_Config* ConfigPtr = XScuTimer_LookupConfig(TimerDeviceId);
	int Status = XScuTimer_CfgInitialize(TimerInstancePtr, ConfigPtr,
					ConfigPtr->BaseAddr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	// ��ʹ���Զ�װ��ģʽ
	XScuTimer_EnableAutoReload(TimerInstancePtr);

	// ���ü�������ʼֵ
	XScuTimer_LoadTimer(TimerInstancePtr, TIMER_LOAD_VALUE);

}


// ��ʱ���жϴ�������
void timer_intr_hander(void *CallBackRef) {
	static int led_state = 0;
	XScuTimer *TimerInstancePtr = (XScuTimer *) CallBackRef;

	/*
	 * Check if the timer counter has expired, checking is not necessary
	 * since that's the reason this function is executed, this just shows
	 * how the callback reference can be used as a pointer to the instance
	 * of the timer counter that expired, increment a shared variable so
	 * the main thread of execution can see the timer expired.
	 */
	if (XScuTimer_IsExpired(TimerInstancePtr)) {
		XScuTimer_ClearInterruptStatus(TimerInstancePtr);	// ���������ж�ǰ������ж�

		XGpioPs_WritePin(&Gpio, MIO50_LED1, led_state);
		led_state = ~led_state;
	}
}

// ��ʱ���жϳ�ʼ��
void init_intr_timer(XScuGic* IntcInstancePtr,XScuTimer *TimerInstancePtr, u16 TimerIntrId) {
	XScuGic_Config *IntcConfig;
	// ��ʼ���жϿ�����
	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	int Status = XScuGic_CfgInitialize(IntcInstancePtr, IntcConfig,
					IntcConfig->CpuBaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	// �ж��쳣����
	Xil_ExceptionInit();
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_IRQ_INT,
				(Xil_ExceptionHandler)XScuGic_InterruptHandler,
				IntcInstancePtr);

	// ���ö�ʱ���Ĵ�������
	Status = XScuGic_Connect(IntcInstancePtr, TimerIntrId,
				(Xil_ExceptionHandler)timer_intr_hander,
				(void *)TimerInstancePtr);
	if (Status != XST_SUCCESS) {
		return Status;
	}

	// ʹ���жϿ�����
	XScuGic_Enable(IntcInstancePtr, TimerIntrId);

	// ʹ�ܶ�ʱ���ж�
	XScuTimer_EnableInterrupt(TimerInstancePtr);

	// ʹ���쳣
	Xil_ExceptionEnable();
}

int main() {
	printf("SCU Timer Interrupt TEST!\n\r");

	init_mio_gpio();

	XGpioPs_SetDirectionPin(&Gpio, MIO50_LED1, 1);
	XGpioPs_SetOutputEnablePin(&Gpio, MIO50_LED1, 1);

	init_timer(&TimerInstance, TIMER_DEVICE_ID);
	init_intr_timer(&IntcInstance, &TimerInstance, TIMER_IRPT_INTR);

	XScuTimer_Start(&TimerInstance);

//	while (1);	// �����˳�main
	return 0;
}