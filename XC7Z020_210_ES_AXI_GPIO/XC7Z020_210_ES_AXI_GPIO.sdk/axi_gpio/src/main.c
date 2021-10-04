/*
 * main.c
 *
 *  Created on: 2021年9月17日
 *      Author: NekoSilverfox
 */

#include <stdio.h>
#include "xparameters.h"	// 器件参数信息
#include "xgpiops.h"		// 包含PS GPIO的函数
#include "xgpio.h"			// 包含AXI GPIO的函数
#include "xscugic.h"		// Intc
#include "sleep.h"			// 包含sleep()函数


// ---------------------- define ----------------------
#define PS_GPIO_DEVICE_ID  	XPAR_XGPIOPS_0_DEVICE_ID	/* PS GPIO 器件ID */
#define INTC_DEVICE_ID		XPAR_SCUGIC_SINGLE_DEVICE_ID/* 中断控制器（SCU GIC） 器件ID */
#define AXI_GPIO_DEVICE_ID	XPAR_GPIO_0_DEVICE_ID		/* AXI GPIO 器件ID */

#define PS_GPIO_INTERRUPT_ID	XPAR_XGPIOPS_0_INTR		/* PS GPIO 中断号(52) */
#define AXI_GPIO_INTERRUPT_ID	61						/* AXI GPIO 中断号(61) */

// LED
#define MIO50_LED1 			50							/* 核心板PS端LED1 */
#define MIO51_LED2 			51							/* 核心板PS端LED2 */

// KEY
#define MIO_KEY1			0							/* 连接到 PS-MIO 的KEY1 */
#define GPIO_CHANNEL_1		1
#define KEY_ON				0							/* 按键按下（低电平） */
#define KEY_OFF				1							/* 按键关闭（高电平） */

#define true				1
#define false				0
// -----------------------------------------------------



// -------------------- 实例及全局变量 --------------------
XGpioPs_Config* pConfigPtr = NULL;
XScuGic_Config* pIntcConfig; 							/* Instance of the interrupt controller */

XGpioPs PsGpio;										/* The driver instance for GPIO Device. */
XScuGic Intc; 											/* The Instance of the Interrupt Controller Driver */

XGpio AxiGpio;											/* The Instance of the GPIO Driver */

u32 key_press = 1;
// -----------------------------------------------------



// ---------------------- 函数声明 -----------------------
void IntrHandler();
void SetupPsInterruptSystem(XScuGic *GicInstancePtr, XGpioPs *PsGpio,u16 GpioIntrId);
void SetupAxiInterruptSystem(XScuGic *GicInstancePtr, XGpio *AxiGpio, u16 AxiGpioIntrId);
// -----------------------------------------------------



// -----------------------------------------------------
void SetupPsInterruptSystem(XScuGic *GicInstancePtr, XGpioPs *PsGpio, u16 GpioIntrId)
{
	// 查找GIC期间配置信息，并进行初始化
	pIntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	XScuGic_CfgInitialize(GicInstancePtr, pIntcConfig,pIntcConfig->CpuBaseAddress);


	// 初始化ARM处理器异常句柄
	Xil_ExceptionInit();
	// 给IRQ注册异常处理程序
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
				(Xil_ExceptionHandler)XScuGic_InterruptHandler,
				GicInstancePtr);
	// 使能处理器中断
	Xil_ExceptionEnableMask(XIL_EXCEPTION_IRQ);


	// 关联中断处理函数
	XScuGic_Connect(GicInstancePtr, GpioIntrId,		/* 中断ID */
				(Xil_ExceptionHandler)IntrHandler,	/* 中断处理函数 */
				(void *)PsGpio);


	// 为 GPIO 器件使能中断，打开 GPIO 外设
	XScuGic_Enable(GicInstancePtr, GpioIntrId);
	// 设置MIO引脚中断触发类型：										下降沿
	XGpioPs_SetIntrTypePin(PsGpio, MIO_KEY1, XGPIOPS_IRQ_TYPE_EDGE_FALLING);
	// 打开 MIO 引脚中断使能信号
	XGpioPs_IntrEnablePin(PsGpio, MIO_KEY1);
}

void SetupAxiInterruptSystem(XScuGic *GicInstancePtr, XGpio *AxiGpio,
				u16 AxiGpioIntrId)
{
	// 【GIC】查找GIC（中断控制器）期间配置信息，并进行初始化
	pIntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	XScuGic_CfgInitialize(GicInstancePtr, pIntcConfig,pIntcConfig->CpuBaseAddress);


	// 【IRQ】配置IRQ（中断请求）？
	Xil_ExceptionInit();								/* 初始化ARM处理器异常句柄 */
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,	/* 给IRQ注册异常处理程序 */
				(Xil_ExceptionHandler)XScuGic_InterruptHandler,
				GicInstancePtr);
	Xil_ExceptionEnableMask(XIL_EXCEPTION_IRQ);			/* 使能处理器中断 */


	// 【处理函数】关联中断处理函数
	XScuGic_Connect(GicInstancePtr, AxiGpioIntrId,		/* 中断ID */
				(Xil_ExceptionHandler)IntrHandler,		/* 中断处理函数 */
				(void *)AxiGpio);


	// 【器件使能】为 AXI GPIO 器件使能中断，打开 GPIO 外设
	XScuGic_Enable(GicInstancePtr, AxiGpioIntrId);

	// 设置中断类型及优先级				中断控制器		中断ID	中断优先级 ↓	↓ 中断类型(高有效，电平敏感类型)
	XScuGic_SetPriorityTriggerType(GicInstancePtr, AxiGpioIntrId, 0xA0, 0x1);

	// 打开IP内部， AXI GPIO 中断使能
	XGpio_InterruptGlobalEnable(AxiGpio);						/* 打开全局中断使能 */
	XGpio_InterruptEnable(AxiGpio, 0x00000001);					/* 打开通断信号对应的中断使能 */
}

// 中断服务函数
void IntrHandler() {
	printf("Interrupt detected!\n\r");

	key_press = 0;

	// 屏蔽（关闭）PS 中断
	// XGpioPs_IntrDisablePin(&PsGpio, MIO_KEY1);

	// 屏蔽（关闭）AXI GPIO 通道1 中断使能信号
	XGpio_InterruptDisable(&AxiGpio, 0x00000001);
}

int main() {
	printf("AXI-GPIO INTERRUPT TEST!\n\r");

	// 【初始化】查找 PS端 GPIO 配置并初始化
	pConfigPtr = XGpioPs_LookupConfig(PS_GPIO_DEVICE_ID);			/* 查找器件的ID，查找器件的配置信息 */
	int Status = XGpioPs_CfgInitialize(&PsGpio, pConfigPtr, pConfigPtr->BaseAddr);	/* 初始化PS端GPIO驱动 */
    if (Status != XST_SUCCESS){
        return XST_FAILURE;
    }

    // 【初始化】AXI 端 GPIO 配置并初始化，不需要查找，直接调用现成的函数，在xgpio.h 中定义。当然也可以和上面一样
    XGpio_Initialize(&AxiGpio, AXI_GPIO_DEVICE_ID);


    // 【LED1】PS 端 GPIO 设置为输出并打开输出使能
	XGpioPs_SetDirectionPin(&PsGpio, MIO50_LED1, 1);				/* 1. PS GPIO方向设置为输出（0 - 输入；1 - 输出） */
	XGpioPs_SetOutputEnablePin(&PsGpio, MIO50_LED1, 1);				/* 2. 设置输出使能（0 - 关闭输出使能；1 - 打开输出使能） */

	// 【】AXI 端 GPIO 设置为输出并打开输出使能
	XGpio_SetDataDirection(&AxiGpio, GPIO_CHANNEL_1, 0x00000001);	/* 0 - 输出；1 - 输入。把最低位IO设为输入。1个代表4位！ */


	// 【中断】
	// SetupPsInterruptSystem(&Intc, &PsGpio, PS_GPIO_INTERRUPT_ID);	/*设置中断系统*/
	SetupAxiInterruptSystem(&Intc, &AxiGpio, AXI_GPIO_INTERRUPT_ID);	/*设置中断系统*/

	int led_value = 0;
	while(true) {
		if (key_press == 0) {
			key_press = 1;			/* 重置按键 */

			// 判断按键的状态，如果按键被按下（低电平）并弹起，就改变LED的状态
			if (XGpio_DiscreteRead(&AxiGpio, GPIO_CHANNEL_1) == KEY_OFF) {	/*如果是KEY_OFF，则按键弹起时改变LED；如果是KEY_ON，则按下的瞬间就改变LED*/
				led_value = ~led_value;			/* 直接取反就可以  */
			}

			// 清除之前的中断状态（INT State）
			// XGpioPs_IntrClearPin(&PsGpio, MIO_KEY1);
			XGpio_InterruptClear(&AxiGpio, 0x00000001);

			// 将 led_value 的值写入变量
			XGpioPs_WritePin(&PsGpio, MIO50_LED1, led_value);

			// 延时消抖（因为有的时候板子按一下会触发多个中断，按键质量好些，或者有电容的话就不需要，视情况而定，）
			usleep(250000);

			// 使能按键中断
			// XGpioPs_IntrEnablePin(&PsGpio, MIO_KEY1);
			XGpio_InterruptEnable(&AxiGpio, 0x00000001);					/* 重新打开通道1对应的中断使能 */
		}
	}

	return 0;
}

