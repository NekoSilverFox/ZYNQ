/*
 * main.c
 *
 *  Created on: 2021年10月1日
 *      Author: mi
 *
 *      参考地址：
 *      https://www.cnblogs.com/ifpga/p/9092016.html
 *      https://www.centennialsoftwaresolutions.com/post/zynq-7000-axi-slave-cdma-controller-on-a-zc702
 *
 */

#include "StandaloneCDMA.h"
#include "StandaloneCDMA_Xilinx.h"
#include "StandaloneCDMA_Linux.h"

int main() {
	RunStandaloneCDMA();

//	testcdmaexample();


	/**
	 * 1. 使用 connect 连接 PS
	 * 2. targets 查看处理器列表
	 * 3. targets 2 选择CPU1
	 * 4. cd C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_240_ES_AXI_CDMA/XC7Z020_240_ES_AXI_CDMA.sdk/design_axi_cdma_wrapper_hw_platform_0/ 进入目录
	 * 5. pwd 确保路径正确
	 * 6. ls 查看文件，确保目录下拥有ps7_init文件
	 * 7. ps7_init 初始化 PS
	 * 8. ps7_post_config 来启用PS和PL之间的电平转换器，并清除fabric端口复位
	 * 9. dow <tutorial_download_path>/u-boot.elf 下载 PetaLinux U-Boot.elf。
	 */
//	RunStandaloneCDMA_Linux();

	while(1);
}
