/*
  * main.c
 *
 *  Created on: 2021年9月14日
 *      Author: NekoSilverfox
 */


// ---------------------------------------------
#include <stdio.h>
#include "xparameters.h" //器件参数信息
#include "xgpiops.h"     //包含PS GPIO的函数
#include "sleep.h"       //包含sleep()函数
// ---------------------------------------------



// ---------------------------------------------
#define GPIO_DEVICE_ID  	XPAR_XGPIOPS_0_DEVICE_ID
//连接到MIO的LED
#define MIO_LED1 			50							/* 核心板PS端LED */
#define MIO_LED2 			51
//连接到MIO的KEY
#define MIO_KEY1			0
// ---------------------------------------------



// ---------------------------------------------
XGpioPs_Config* ConfigPtr = NULL;
XGpioPs Gpio;	/* 指向GPIO的指针 The driver instance for GPIO Device. */

// 闪烁一个LED
void shift_one_led() {
	// 1. GPIO方向设置为输出（0 - 输入；1 - 输出）
	XGpioPs_SetDirectionPin(&Gpio, MIO_LED1, 1);


	// 2. 设置输出使能（0 - 关闭输出使能；1 - 打开输出使能）
	XGpioPs_SetOutputEnablePin(&Gpio, MIO_LED1, 1);

	// 实现LED闪烁（点亮、延时、熄灭，以此重复）
	while(1) {
		// 3. 写数据到GPIO的输出引脚（点亮）
		XGpioPs_WritePin(&Gpio, MIO_LED1, 0x0);

		// 延时
		//sleep(1);  秒为单位
		usleep(500000);  /* 微秒为单位  0.5sec */


		// 3. 写数据到GPIO的输出引脚（熄灭）
		XGpioPs_WritePin(&Gpio, MIO_LED1, 0x1);

		// 延时
		usleep(500000);  /* 微秒为单位  0.5sec */
	}
}

// 闪烁两个LED
void shift_two_led() {
	// 1. GPIO 引脚方向设置为输出（0 - 输入；1 - 输出）
	XGpioPs_SetDirectionPin(&Gpio, MIO_LED1, 1);
	XGpioPs_SetDirectionPin(&Gpio, MIO_LED2, 1);

	// 2. 设置引脚输出使能（0 - 关闭输出使能；1 - 打开输出使能）
	XGpioPs_SetOutputEnablePin(&Gpio, MIO_LED1, 1);
	XGpioPs_SetOutputEnablePin(&Gpio, MIO_LED2, 1);


	int shift_time = 250000;

	// 实现LED闪烁（点亮、延时、熄灭，以此重复）
	while(1) {
		// 3. 写数据到GPIO的输出引脚（点亮）
		XGpioPs_WritePin(&Gpio, MIO_LED1, 0x0);
		XGpioPs_WritePin(&Gpio, MIO_LED2, 0x0);
		// 延时
		//sleep(1);  秒为单位
		usleep(shift_time);  /* 微秒为单位  0.25sec */


		// 3. 写数据到GPIO的输出引脚（熄灭）
		XGpioPs_WritePin(&Gpio, MIO_LED1, 0x1);
		XGpioPs_WritePin(&Gpio, MIO_LED2, 0x1);
		// 延时
		usleep(shift_time);  /* 微秒为单位  0.5sec */
	}
}

int main() {
	printf("GPIO MIO TEST!\n\r");

	// 查找器件的ID，查找器件的配置信息
	ConfigPtr = XGpioPs_LookupConfig(GPIO_DEVICE_ID);

	// 初始化GPIO驱动
	int Status = XGpioPs_CfgInitialize(&Gpio, ConfigPtr, ConfigPtr->BaseAddr);
    if (Status != XST_SUCCESS){
        return XST_FAILURE;
    }

	// GPIO方向设置为输出（0 - 输入；1 - 输出）
	XGpioPs_SetDirectionPin(&Gpio, MIO_LED1, 1);
	// GPIO方向设置为输入（0 - 输入；1 - 输出）
	XGpioPs_SetDirectionPin(&Gpio, MIO_KEY1, 0);


	// 设置输出使能（0 - 关闭输出使能；1 - 打开输出使能）
	XGpioPs_SetOutputEnablePin(&Gpio, MIO_LED1, 1);

	// 实现LED按键点亮
	u32 key_value = 0;
	while(1) {
		// 读取按键状态
		key_value = XGpioPs_Read(&Gpio, MIO_KEY1);

		// 将按键状态写入LED（写数据到GPIO的输出引脚）
		XGpioPs_WritePin(&Gpio, MIO_LED1, key_value);

		// 写数据到GPIO的输出引脚（点亮）
		XGpioPs_WritePin(&Gpio, MIO_LED1, key_value);
	}

	return 0;
}
