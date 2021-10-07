/*
  * main.c
 *
 *  Created on: 2021��9��14��
 *      Author: NekoSilverfox
 */


// ---------------------------------------------
#include <stdio.h>
#include "xparameters.h" //����������Ϣ
#include "xgpiops.h"     //����PS GPIO�ĺ���
#include "sleep.h"       //����sleep()����
// ---------------------------------------------



// ---------------------------------------------
#define GPIO_DEVICE_ID  	XPAR_XGPIOPS_0_DEVICE_ID
//���ӵ�MIO��LED
#define MIO_LED1 			50							/* ���İ�PS��LED */
#define MIO_LED2 			51
//���ӵ�MIO��KEY
#define MIO_KEY1			0
// ---------------------------------------------



// ---------------------------------------------
XGpioPs_Config* ConfigPtr = NULL;
XGpioPs Gpio;	/* ָ��GPIO��ָ�� The driver instance for GPIO Device. */

// ��˸һ��LED
void shift_one_led() {
	// 1. GPIO��������Ϊ�����0 - ���룻1 - �����
	XGpioPs_SetDirectionPin(&Gpio, MIO_LED1, 1);


	// 2. �������ʹ�ܣ�0 - �ر����ʹ�ܣ�1 - �����ʹ�ܣ�
	XGpioPs_SetOutputEnablePin(&Gpio, MIO_LED1, 1);

	// ʵ��LED��˸����������ʱ��Ϩ���Դ��ظ���
	while(1) {
		// 3. д���ݵ�GPIO��������ţ�������
		XGpioPs_WritePin(&Gpio, MIO_LED1, 0x0);

		// ��ʱ
		//sleep(1);  ��Ϊ��λ
		usleep(500000);  /* ΢��Ϊ��λ  0.5sec */


		// 3. д���ݵ�GPIO��������ţ�Ϩ��
		XGpioPs_WritePin(&Gpio, MIO_LED1, 0x1);

		// ��ʱ
		usleep(500000);  /* ΢��Ϊ��λ  0.5sec */
	}
}

// ��˸����LED
void shift_two_led() {
	// 1. GPIO ���ŷ�������Ϊ�����0 - ���룻1 - �����
	XGpioPs_SetDirectionPin(&Gpio, MIO_LED1, 1);
	XGpioPs_SetDirectionPin(&Gpio, MIO_LED2, 1);

	// 2. �����������ʹ�ܣ�0 - �ر����ʹ�ܣ�1 - �����ʹ�ܣ�
	XGpioPs_SetOutputEnablePin(&Gpio, MIO_LED1, 1);
	XGpioPs_SetOutputEnablePin(&Gpio, MIO_LED2, 1);


	int shift_time = 250000;

	// ʵ��LED��˸����������ʱ��Ϩ���Դ��ظ���
	while(1) {
		// 3. д���ݵ�GPIO��������ţ�������
		XGpioPs_WritePin(&Gpio, MIO_LED1, 0x0);
		XGpioPs_WritePin(&Gpio, MIO_LED2, 0x0);
		// ��ʱ
		//sleep(1);  ��Ϊ��λ
		usleep(shift_time);  /* ΢��Ϊ��λ  0.25sec */


		// 3. д���ݵ�GPIO��������ţ�Ϩ��
		XGpioPs_WritePin(&Gpio, MIO_LED1, 0x1);
		XGpioPs_WritePin(&Gpio, MIO_LED2, 0x1);
		// ��ʱ
		usleep(shift_time);  /* ΢��Ϊ��λ  0.5sec */
	}
}

int main() {
	printf("GPIO MIO TEST!\n\r");

	// ����������ID������������������Ϣ
	ConfigPtr = XGpioPs_LookupConfig(GPIO_DEVICE_ID);

	// ��ʼ��GPIO����
	int Status = XGpioPs_CfgInitialize(&Gpio, ConfigPtr, ConfigPtr->BaseAddr);
    if (Status != XST_SUCCESS){
        return XST_FAILURE;
    }

	// GPIO��������Ϊ�����0 - ���룻1 - �����
	XGpioPs_SetDirectionPin(&Gpio, MIO_LED1, 1);
	// GPIO��������Ϊ���루0 - ���룻1 - �����
	XGpioPs_SetDirectionPin(&Gpio, MIO_KEY1, 0);


	// �������ʹ�ܣ�0 - �ر����ʹ�ܣ�1 - �����ʹ�ܣ�
	XGpioPs_SetOutputEnablePin(&Gpio, MIO_LED1, 1);

	// ʵ��LED��������
	u32 key_value = 0;
	while(1) {
		// ��ȡ����״̬
		key_value = XGpioPs_Read(&Gpio, MIO_KEY1);

		// ������״̬д��LED��д���ݵ�GPIO��������ţ�
		XGpioPs_WritePin(&Gpio, MIO_LED1, key_value);

		// д���ݵ�GPIO��������ţ�������
		XGpioPs_WritePin(&Gpio, MIO_LED1, key_value);
	}

	return 0;
}