/*
 * main.c
 *
 *  Created on: 2021��10��1��
 *      Author: mi
 *
 *      �ο���ַ��
 *      https://www.cnblogs.com/ifpga/p/9092016.html
 *      https://www.centennialsoftwaresolutions.com/post/zynq-7000-axi-slave-cdma-controller-on-a-zc702
 *
 */

#include "StandaloneCDMA.h"
#include "StandaloneCDMA_Xilinx.h"
#include "StandaloneCDMA_Linux.h"

int main() {
//	RunStandaloneCDMA();

	testcdmaexample();


	/**
	 * 1. ʹ�� connect ���� PS
	 * 2. targets �鿴�������б�
	 * 3. targets 2 ѡ��CPU1
	 * 4. cd C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_240_ES_AXI_CDMA/XC7Z020_240_ES_AXI_CDMA.sdk/design_axi_cdma_wrapper_hw_platform_0/ ����Ŀ¼
	 * 5. pwd ȷ��·����ȷ
	 * 6. ls �鿴�ļ���ȷ��Ŀ¼��ӵ��ps7_init�ļ�
	 * 7. ps7_init ��ʼ�� PS
	 * 8. ps7_post_config ������PS��PL֮��ĵ�ƽת�����������fabric�˿ڸ�λ
	 * 9. dow <tutorial_download_path>/u-boot.elf ���� PetaLinux U-Boot.elf��
	 */
//	RunStandaloneCDMA_Linux();
}