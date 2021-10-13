#include "stdio.h"
#include "xparameters.h"
#include "xil_printf.h"
#include "pwm_ip.h"
#include "xil_io.h"
#include "sleep.h"

#define  PWM_IP_BASEADDR   XPAR_PWM_IP_0_S00_AXI_BASEADDR  //PWM IP����ַ
#define  PWM_IP_REG0       PWM_IP_S00_AXI_SLV_REG0_OFFSET  //PWM IP�Ĵ�����ַ0
#define  PWM_IP_REG1       PWM_IP_S00_AXI_SLV_REG1_OFFSET  //PWM IP�Ĵ�����ַ1

//main����
int main()
{


 xil_printf("PWM IP Test!\n");

 PWM_IP_mWriteReg(PWM_IP_BASEADDR,PWM_IP_REG1,0x0000001f);

}
