/*
  * main.c
 *
 *  Created on: 2021��9��14��
 *      Author: NekoSilverfox
 */


// ---------------------------------------------
#include <stdio.h>
#include "xparameters.h" //����������Ϣ
#include "xgpiops.h"     //����PS gpiops_inst�ĺ���
#include "sleep.h"       //����sleep()����
// ---------------------------------------------



// ---------------------------------------------
#define GPIOPS_ID			XPAR_XGPIOPS_0_DEVICE_ID

//���ӵ�MIO��LED
#define MIO_LED1 			50							/* ���İ�PS��LED */
#define MIO_LED2 			51

//���ӵ�MIO��KEY
#define MIO_KEY1			0							/* ���İ�PS��KEY */

//���ӵ�EIO��KEY
#define EMIO_KEY1			54							/* ���İ�PL��KEY */
// ---------------------------------------------


// ---------------------------------------------
int main() {
	printf("gpiops_inst EMIO TEST!\n\r");

	// ����������ID������������������Ϣ
	XGpioPs_Config* gpiops_cfg_ptr = XGpioPs_LookupConfig(GPIOPS_ID);	/* PS�� GPIO ������Ϣ */

	// ��ʼ��GPIO����
	XGpioPs gpiops_inst;	/* PS�� GPIO ����ʵ�� The driver instance for gpiops_inst Device. */
	int Status = XGpioPs_CfgInitialize(&gpiops_inst, gpiops_cfg_ptr, gpiops_cfg_ptr->BaseAddr);
    if (Status != XST_SUCCESS){
        return XST_FAILURE;
    }

	// ����LEDΪ�����GPIO��������Ϊ�����0 - ���룻1 - �����
    XGpioPs_SetDirectionPin(&gpiops_inst, MIO_LED1, 1);
    XGpioPs_SetDirectionPin(&gpiops_inst, MIO_LED2, 1);
	// ����LED���ʹ�ܣ�0 - �ر����ʹ�ܣ�1 - �����ʹ�ܣ�
    XGpioPs_SetOutputEnablePin(&gpiops_inst, MIO_LED1, 1);
    XGpioPs_SetOutputEnablePin(&gpiops_inst, MIO_LED2, 1);

	// GPIO��������Ϊ���루0 - ���룻1 - �����
    XGpioPs_SetDirectionPin(&gpiops_inst, MIO_KEY1, 0);
    XGpioPs_SetDirectionPin(&gpiops_inst, EMIO_KEY1, 0);

	printf("Before while loop!!\n\r");

	// ʵ��LED��������
	u32 key_value;
	while(1) {

		// ��ȡ����״̬
		key_value = XGpioPs_ReadPin(&gpiops_inst, MIO_KEY1);
		printf("value MIO_KEY1 == %d\r", key_value);
		// ������״̬д��LED��д���ݵ�GPIO��������ţ�
		XGpioPs_WritePin(&gpiops_inst, MIO_LED1, key_value);

		key_value = XGpioPs_ReadPin(&gpiops_inst, EMIO_KEY1);
		printf("value EMIO_KEY1 == %d\n\r", key_value);
		XGpioPs_WritePin(&gpiops_inst, MIO_LED2, key_value);
	}

	return 0;
}