/*
  * main.c
 *
 *  Created on: 2021年9月14日
 *      Author: NekoSilverfox
 */


// ---------------------------------------------
#include <stdio.h>
#include "xparameters.h" //器件参数信息
#include "xgpiops.h"     //包含PS gpiops_inst的函数
#include "sleep.h"       //包含sleep()函数
// ---------------------------------------------



// ---------------------------------------------
#define GPIOPS_ID			XPAR_XGPIOPS_0_DEVICE_ID

//连接到MIO的LED
#define MIO_LED1 			50							/* 核心板PS端LED */
#define MIO_LED2 			51

//连接到MIO的KEY
#define MIO_KEY1			0							/* 核心板PS端KEY */

//连接到EIO的KEY
#define EMIO_KEY1			54							/* 核心板PL端KEY */
// ---------------------------------------------


// ---------------------------------------------
int main() {
	printf("gpiops_inst EMIO TEST!\n\r");

	// 查找器件的ID，查找器件的配置信息
	XGpioPs_Config* gpiops_cfg_ptr = XGpioPs_LookupConfig(GPIOPS_ID);	/* PS端 GPIO 配置信息 */

	// 初始化GPIO驱动
	XGpioPs gpiops_inst;	/* PS端 GPIO 驱动实例 The driver instance for gpiops_inst Device. */
	int Status = XGpioPs_CfgInitialize(&gpiops_inst, gpiops_cfg_ptr, gpiops_cfg_ptr->BaseAddr);
    if (Status != XST_SUCCESS){
        return XST_FAILURE;
    }

	// 设置LED为输出，GPIO方向设置为输出（0 - 输入；1 - 输出）
    XGpioPs_SetDirectionPin(&gpiops_inst, MIO_LED1, 1);
    XGpioPs_SetDirectionPin(&gpiops_inst, MIO_LED2, 1);
	// 设置LED输出使能（0 - 关闭输出使能；1 - 打开输出使能）
    XGpioPs_SetOutputEnablePin(&gpiops_inst, MIO_LED1, 1);
    XGpioPs_SetOutputEnablePin(&gpiops_inst, MIO_LED2, 1);

	// GPIO方向设置为输入（0 - 输入；1 - 输出）
    XGpioPs_SetDirectionPin(&gpiops_inst, MIO_KEY1, 0);
    XGpioPs_SetDirectionPin(&gpiops_inst, EMIO_KEY1, 0);

	printf("Before while loop!!\n\r");

	// 实现LED按键点亮
	u32 key_value;
	while(1) {

		// 读取按键状态
		key_value = XGpioPs_ReadPin(&gpiops_inst, MIO_KEY1);
		printf("value MIO_KEY1 == %d\r", key_value);
		// 将按键状态写入LED（写数据到GPIO的输出引脚）
		XGpioPs_WritePin(&gpiops_inst, MIO_LED1, key_value);

		key_value = XGpioPs_ReadPin(&gpiops_inst, EMIO_KEY1);
		printf("value EMIO_KEY1 == %d\n\r", key_value);
		XGpioPs_WritePin(&gpiops_inst, MIO_LED2, key_value);
	}

	return 0;
}
