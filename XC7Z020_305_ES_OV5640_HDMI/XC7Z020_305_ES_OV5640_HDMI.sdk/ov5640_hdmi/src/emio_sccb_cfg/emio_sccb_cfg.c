// --------------------------------------------------------------------
// Copyright (c) 2019 by MicroPhase Technologies Inc.
// --------------------------------------------------------------------
//
// Permission:
//
//   MicroPhase grants permission to use and modify this code for use
//   in synthesis for all MicroPhase Development Boards.
//   Other use of this code, including the selling
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  MicroPhase provides no warranty regarding the use
//   or functionality of this code.
//
// --------------------------------------------------------------------
//
//                     MicroPhase Technologies Inc
//                     Shanghai, China
//
//                     web: http://www.microphase.cn/
//                     email: support@microphase.cn
//
// --------------------------------------------------------------------
// --------------------------------------------------------------------
//
// Major Functions:
//
// --------------------------------------------------------------------
// --------------------------------------------------------------------
//
//  Revision History:
//  Date          By            Revision    Change	 Description
//---------------------------------------------------------------------
//2020-03-17      Wang 			1.0          		Original
//2020-                         1.1
// --------------------------------------------------------------------
// --------------------------------------------------------------------

#include"emio_sccb_cfg.h"

#define  GPIOPS_ID  XPAR_XGPIOPS_0_DEVICE_ID  //PS �� GPIO ���� ID

static  XGpioPs  gpiops_inst; //PS �� GPIO ����ʵ��

//EMIO��ʼ��
void emio_init(void)
{

	XGpioPs_Config *gpiops_cfg_ptr; //PS �� GPIO ������Ϣ

	//�������� ID ����������Ϣ
	gpiops_cfg_ptr = XGpioPs_LookupConfig(GPIOPS_ID);
	//��ʼ����������
	XGpioPs_CfgInitialize(&gpiops_inst, gpiops_cfg_ptr, gpiops_cfg_ptr->BaseAddr);

	//���� sccb�˿� Ϊ���
	XGpioPs_SetDirectionPin(&gpiops_inst, EMIO_SCL_NUM, 1);
	XGpioPs_SetDirectionPin(&gpiops_inst, EMIO_SDA_NUM, 1);

	//ʹ��sccb�˿� ���
	XGpioPs_SetOutputEnablePin(&gpiops_inst, EMIO_SCL_NUM, 1);
	XGpioPs_SetOutputEnablePin(&gpiops_inst, EMIO_SDA_NUM, 1);

	//��sccb��SCLK��SDA������
	XGpioPs_WritePin(&gpiops_inst, EMIO_SCL_NUM, 1);
	XGpioPs_WritePin(&gpiops_inst, EMIO_SDA_NUM, 1);
}

//����sccb��ʼ�ź�
void sccb_start(void)
{
	XGpioPs_WritePin(&gpiops_inst, EMIO_SCL_NUM, 1);
	XGpioPs_WritePin(&gpiops_inst, EMIO_SDA_NUM, 1);

	usleep(4);

 	XGpioPs_WritePin(&gpiops_inst, EMIO_SDA_NUM, 0);  //START:when CLK is high,DATA change form high to low

 	usleep(4);

 	XGpioPs_WritePin(&gpiops_inst, EMIO_SCL_NUM, 0);  //ǯסI2C���ߣ�׼�����ͻ��������

}

//����sccbֹͣ�ź�
void sccb_stop(void)
{

	XGpioPs_WritePin(&gpiops_inst, EMIO_SCL_NUM, 0);

	XGpioPs_WritePin(&gpiops_inst,EMIO_SDA_NUM, 0);  //STOP:when CLK is high DATA change form low to high

 	usleep(4);

	XGpioPs_WritePin(&gpiops_inst, EMIO_SCL_NUM, 1);

	usleep(4);

	XGpioPs_WritePin(&gpiops_inst, EMIO_SDA_NUM, 1);  //����I2C���߽����ź�

}

//sccb����һ���ֽ�
void sccb_send_byte(u8 txd)
{
    u8 t;

    XGpioPs_WritePin(&gpiops_inst, EMIO_SCL_NUM, 0);  //����ʱ�ӿ�ʼ���ݴ���

    for(t=0; t<8; t++)
    {
        XGpioPs_WritePin(&gpiops_inst, EMIO_SDA_NUM, (txd&0x80)>>7);

        txd<<=1;

        usleep(4);

        XGpioPs_WritePin(&gpiops_inst, EMIO_SCL_NUM, 1);

        usleep(4);

        XGpioPs_WritePin(&gpiops_inst, EMIO_SCL_NUM, 0);

        usleep(4);
    }
}

//SCCB����һ���ֽ�
u8  sccb_rece_byte(void)
{
	unsigned char i=0 , rxd=0;

	XGpioPs_SetOutputEnablePin(&gpiops_inst, EMIO_SDA_NUM, 0);
	XGpioPs_SetDirectionPin(&gpiops_inst, EMIO_SDA_NUM, 0);

	XGpioPs_WritePin(&gpiops_inst, EMIO_SCL_NUM, 0);
	usleep(4);

	for(i=0;i<8;i++ )
	{
        XGpioPs_WritePin(&gpiops_inst, EMIO_SCL_NUM, 1);
        usleep(2);

        rxd <<= 1;
        if( XGpioPs_ReadPin(&gpiops_inst, EMIO_SDA_NUM) ) {
        	rxd = rxd | 0x01;
        }
		usleep(2);

		XGpioPs_WritePin(&gpiops_inst, EMIO_SCL_NUM, 0);
		usleep(4);
    }

	XGpioPs_SetDirectionPin(&gpiops_inst, EMIO_SDA_NUM, 1);  //SDA����Ϊ���
	XGpioPs_SetOutputEnablePin(&gpiops_inst, EMIO_SDA_NUM, 1);

    return rxd;

}

//����ACKӦ��
void sccb_ack(void)
{
	XGpioPs_WritePin(&gpiops_inst, EMIO_SCL_NUM, 0);
	XGpioPs_WritePin(&gpiops_inst, EMIO_SDA_NUM, 0);

	usleep(4);

	XGpioPs_WritePin(&gpiops_inst, EMIO_SCL_NUM, 1);

	usleep(4);

	XGpioPs_WritePin(&gpiops_inst, EMIO_SCL_NUM, 0);

	usleep(4);
}

