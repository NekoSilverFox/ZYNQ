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

#include "../emio_sccb_cfg/emio_sccb_cfg.h"

#define  SCCB_ID    0x78   //OV5640��ID


void sccb_write_reg16(u16 addr , u8 data)
{
	sccb_start();

	sccb_send_byte(SCCB_ID);
	sccb_ack();

	sccb_send_byte(addr >> 8);
	sccb_ack();
	
	sccb_send_byte(addr & 0x00FF);
	sccb_ack();

	sccb_send_byte(data);
	sccb_ack();

  	sccb_stop();
}


u8 sccb_read_reg16(u16 addr )
{
	u8 rxd;

	sccb_start();

	sccb_send_byte(SCCB_ID);
	sccb_ack();

	sccb_send_byte(addr >> 8);
	sccb_ack();
	
	sccb_send_byte(addr & 0x00FF);
	sccb_ack();

  	sccb_stop();

  	sccb_start();

	sccb_send_byte(SCCB_ID | 0x01);
	sccb_ack();

	rxd = sccb_rece_byte();
	sccb_ack();

  	sccb_stop();

  	return  rxd ;
}

u8 ov5640_init( u16 cmos_h_pixel,  u16 cmos_v_pixel,  u16 total_h_pixel,  u16 total_v_pixel )
{
	u16 cam_id = 0;
	
	usleep(20000);  //OV5640�ϵ����ٵȴ�20ms��ʼ������ز���

    //��ȡ����ͷID
    cam_id  = sccb_read_reg16(0x300b);       //LSB  0x40
    cam_id |= sccb_read_reg16(0x300a) << 8;  //MSB  0x56

    if(cam_id != 0x5640)  //��ȡ����ȷ��ID
        return 1;
    else{
		//�ȶԼĴ������������λ��ʹ�Ĵ����ָ���ʼֵ
		//�Ĵ��������λ����Ҫ��ʱ1ms�������������Ĵ���
		sccb_write_reg16(0x3008,0x82); //Bit[7]:��λ Bit[6]:��Դ����

		//��ʱ1ms
		usleep(10000);

		sccb_write_reg16(0x3008,0x02); //��������ģʽ
		sccb_write_reg16(0x3103,0x02); //Bit[1]:1 PLL Clock
		//��������/������� FREX/VSYNC/HREF/PCLK/D[9:6]
		sccb_write_reg16(0x3017,0xff);
		//��������/������� D[5:0]/GPIO1/GPIO0
		sccb_write_reg16(0x3018,0xff);
		sccb_write_reg16(0x3037,0x13); //PLL��Ƶ����
		sccb_write_reg16(0x3108,0x01); //ϵͳ����Ƶ��
		sccb_write_reg16(0x3630,0x36);
		sccb_write_reg16(0x3631,0x0e);
		sccb_write_reg16(0x3632,0xe2);
		sccb_write_reg16(0x3633,0x12);
		sccb_write_reg16(0x3621,0xe0);
		sccb_write_reg16(0x3704,0xa0);
		sccb_write_reg16(0x3703,0x5a);
		sccb_write_reg16(0x3715,0x78);
		sccb_write_reg16(0x3717,0x01);
		sccb_write_reg16(0x370b,0x60);
		sccb_write_reg16(0x3705,0x1a);
		sccb_write_reg16(0x3905,0x02);
		sccb_write_reg16(0x3906,0x10);
		sccb_write_reg16(0x3901,0x0a);
		sccb_write_reg16(0x3731,0x12);
		sccb_write_reg16(0x3600,0x08); //VCM����,�����Զ��۽�
		sccb_write_reg16(0x3601,0x33); //VCM����,�����Զ��۽�
		sccb_write_reg16(0x302d,0x60); //ϵͳ����
		sccb_write_reg16(0x3620,0x52);
		sccb_write_reg16(0x371b,0x20);
		sccb_write_reg16(0x471c,0x50);
		sccb_write_reg16(0x3a13,0x43); //AEC(�Զ��ع����)
		sccb_write_reg16(0x3a18,0x00); //AEC ��������
		sccb_write_reg16(0x3a19,0xf8); //AEC ��������
		sccb_write_reg16(0x3635,0x13);
		sccb_write_reg16(0x3636,0x03);
		sccb_write_reg16(0x3634,0x40);
		sccb_write_reg16(0x3622,0x01);
		sccb_write_reg16(0x3c01,0x34);
		sccb_write_reg16(0x3c04,0x28);
		sccb_write_reg16(0x3c05,0x98);
		sccb_write_reg16(0x3c06,0x00); //light meter 1 ��ֵ[15:8]
		sccb_write_reg16(0x3c07,0x08); //light meter 1 ��ֵ[7:0]
		sccb_write_reg16(0x3c08,0x00); //light meter 2 ��ֵ[15:8]
		sccb_write_reg16(0x3c09,0x1c); //light meter 2 ��ֵ[7:0]
		sccb_write_reg16(0x3c0a,0x9c); //sample number[15:8]
		sccb_write_reg16(0x3c0b,0x40); //sample number[7:0]
		sccb_write_reg16(0x3810,0x00); //Timing Hoffset[11:8]
		sccb_write_reg16(0x3811,0x10); //Timing Hoffset[7:0]
		sccb_write_reg16(0x3812,0x00); //Timing Voffset[10:8]
		sccb_write_reg16(0x3708,0x64);
		sccb_write_reg16(0x4001,0x02); //BLC(�ڵ�ƽУ׼)������ʼ�к�
		sccb_write_reg16(0x4005,0x1a); //BLC(�ڵ�ƽУ׼)����ʼ�ո���
		sccb_write_reg16(0x3000,0x00); //ϵͳ�鸴λ����
		sccb_write_reg16(0x3004,0xff); //ʱ��ʹ�ܿ���
		sccb_write_reg16(0x4300,0x61); //��ʽ���� RGB565
		sccb_write_reg16(0x501f,0x01); //ISP RGB
		sccb_write_reg16(0x440e,0x00);
		sccb_write_reg16(0x5000,0xa7); //ISP����
		sccb_write_reg16(0x3a0f,0x30); //AEC����;stable range in high
		sccb_write_reg16(0x3a10,0x28); //AEC����;stable range in low
		sccb_write_reg16(0x3a1b,0x30); //AEC����;stable range out high
		sccb_write_reg16(0x3a1e,0x26); //AEC����;stable range out low
		sccb_write_reg16(0x3a11,0x60); //AEC����; fast zone high
		sccb_write_reg16(0x3a1f,0x14); //AEC����; fast zone low
		//LENC(��ͷУ��)���� 0x5800~0x583d
		sccb_write_reg16(0x5800,0x23);
		sccb_write_reg16(0x5801,0x14);
		sccb_write_reg16(0x5802,0x0f);
		sccb_write_reg16(0x5803,0x0f);
		sccb_write_reg16(0x5804,0x12);
		sccb_write_reg16(0x5805,0x26);
		sccb_write_reg16(0x5806,0x0c);
		sccb_write_reg16(0x5807,0x08);
		sccb_write_reg16(0x5808,0x05);
		sccb_write_reg16(0x5809,0x05);
		sccb_write_reg16(0x580a,0x08);
		sccb_write_reg16(0x580b,0x0d);
		sccb_write_reg16(0x580c,0x08);
		sccb_write_reg16(0x580d,0x03);
		sccb_write_reg16(0x580e,0x00);
		sccb_write_reg16(0x580f,0x00);
		sccb_write_reg16(0x5810,0x03);
		sccb_write_reg16(0x5811,0x09);
		sccb_write_reg16(0x5812,0x07);
		sccb_write_reg16(0x5813,0x03);
		sccb_write_reg16(0x5814,0x00);
		sccb_write_reg16(0x5815,0x01);
		sccb_write_reg16(0x5816,0x03);
		sccb_write_reg16(0x5817,0x08);
		sccb_write_reg16(0x5818,0x0d);
		sccb_write_reg16(0x5819,0x08);
		sccb_write_reg16(0x581a,0x05);
		sccb_write_reg16(0x581b,0x06);
		sccb_write_reg16(0x581c,0x08);
		sccb_write_reg16(0x581d,0x0e);
		sccb_write_reg16(0x581e,0x29);
		sccb_write_reg16(0x581f,0x17);
		sccb_write_reg16(0x5820,0x11);
		sccb_write_reg16(0x5821,0x11);
		sccb_write_reg16(0x5822,0x15);
		sccb_write_reg16(0x5823,0x28);
		sccb_write_reg16(0x5824,0x46);
		sccb_write_reg16(0x5825,0x26);
		sccb_write_reg16(0x5826,0x08);
		sccb_write_reg16(0x5827,0x26);
		sccb_write_reg16(0x5828,0x64);
		sccb_write_reg16(0x5829,0x26);
		sccb_write_reg16(0x582a,0x24);
		sccb_write_reg16(0x582b,0x22);
		sccb_write_reg16(0x582c,0x24);
		sccb_write_reg16(0x582d,0x24);
		sccb_write_reg16(0x582e,0x06);
		sccb_write_reg16(0x582f,0x22);
		sccb_write_reg16(0x5830,0x40);
		sccb_write_reg16(0x5831,0x42);
		sccb_write_reg16(0x5832,0x24);
		sccb_write_reg16(0x5833,0x26);
		sccb_write_reg16(0x5834,0x24);
		sccb_write_reg16(0x5835,0x22);
		sccb_write_reg16(0x5836,0x22);
		sccb_write_reg16(0x5837,0x26);
		sccb_write_reg16(0x5838,0x44);
		sccb_write_reg16(0x5839,0x24);
		sccb_write_reg16(0x583a,0x26);
		sccb_write_reg16(0x583b,0x28);
		sccb_write_reg16(0x583c,0x42);
		sccb_write_reg16(0x583d,0xce);
		//AWB(�Զ���ƽ�����) 0x5180~0x519e
		sccb_write_reg16(0x5180,0xff);
		sccb_write_reg16(0x5181,0xf2);
		sccb_write_reg16(0x5182,0x00);
		sccb_write_reg16(0x5183,0x14);
		sccb_write_reg16(0x5184,0x25);
		sccb_write_reg16(0x5185,0x24);
		sccb_write_reg16(0x5186,0x09);
		sccb_write_reg16(0x5187,0x09);
		sccb_write_reg16(0x5188,0x09);
		sccb_write_reg16(0x5189,0x75);
		sccb_write_reg16(0x518a,0x54);
		sccb_write_reg16(0x518b,0xe0);
		sccb_write_reg16(0x518c,0xb2);
		sccb_write_reg16(0x518d,0x42);
		sccb_write_reg16(0x518e,0x3d);
		sccb_write_reg16(0x518f,0x56);
		sccb_write_reg16(0x5190,0x46);
		sccb_write_reg16(0x5191,0xf8);
		sccb_write_reg16(0x5192,0x04);
		sccb_write_reg16(0x5193,0x70);
		sccb_write_reg16(0x5194,0xf0);
		sccb_write_reg16(0x5195,0xf0);
		sccb_write_reg16(0x5196,0x03);
		sccb_write_reg16(0x5197,0x01);
		sccb_write_reg16(0x5198,0x04);
		sccb_write_reg16(0x5199,0x12);
		sccb_write_reg16(0x519a,0x04);
		sccb_write_reg16(0x519b,0x00);
		sccb_write_reg16(0x519c,0x06);
		sccb_write_reg16(0x519d,0x82);
		sccb_write_reg16(0x519e,0x38);
		//Gamma(٤��)���� 0x5480~0x5490
		sccb_write_reg16(0x5480,0x01);
		sccb_write_reg16(0x5481,0x08);
		sccb_write_reg16(0x5482,0x14);
		sccb_write_reg16(0x5483,0x28);
		sccb_write_reg16(0x5484,0x51);
		sccb_write_reg16(0x5485,0x65);
		sccb_write_reg16(0x5486,0x71);
		sccb_write_reg16(0x5487,0x7d);
		sccb_write_reg16(0x5488,0x87);
		sccb_write_reg16(0x5489,0x91);
		sccb_write_reg16(0x548a,0x9a);
		sccb_write_reg16(0x548b,0xaa);
		sccb_write_reg16(0x548c,0xb8);
		sccb_write_reg16(0x548d,0xcd);
		sccb_write_reg16(0x548e,0xdd);
		sccb_write_reg16(0x548f,0xea);
		sccb_write_reg16(0x5490,0x1d);
		//CMX(��ɫ�������) 0x5381~0x538b
		sccb_write_reg16(0x5381,0x1e);
		sccb_write_reg16(0x5382,0x5b);
		sccb_write_reg16(0x5383,0x08);
		sccb_write_reg16(0x5384,0x0a);
		sccb_write_reg16(0x5385,0x7e);
		sccb_write_reg16(0x5386,0x88);
		sccb_write_reg16(0x5387,0x7c);
		sccb_write_reg16(0x5388,0x6c);
		sccb_write_reg16(0x5389,0x10);
		sccb_write_reg16(0x538a,0x01);
		sccb_write_reg16(0x538b,0x98);
		//SDE(��������Ч��)���� 0x5580~0x558b
		sccb_write_reg16(0x5580,0x06);
		sccb_write_reg16(0x5583,0x40);
		sccb_write_reg16(0x5584,0x10);
		sccb_write_reg16(0x5589,0x10);
		sccb_write_reg16(0x558a,0x00);
		sccb_write_reg16(0x558b,0xf8);
		sccb_write_reg16(0x501d,0x40); //ISP MISC
		//CIP(��ɫ��ֵ)���� (0x5300~0x530c)
		sccb_write_reg16(0x5300,0x08);
		sccb_write_reg16(0x5301,0x30);
		sccb_write_reg16(0x5302,0x10);
		sccb_write_reg16(0x5303,0x00);
		sccb_write_reg16(0x5304,0x08);
		sccb_write_reg16(0x5305,0x30);
		sccb_write_reg16(0x5306,0x08);
		sccb_write_reg16(0x5307,0x16);
		sccb_write_reg16(0x5309,0x08);
		sccb_write_reg16(0x530a,0x30);
		sccb_write_reg16(0x530b,0x04);
		sccb_write_reg16(0x530c,0x06);
		sccb_write_reg16(0x5025,0x00);
		//ϵͳʱ�ӷ�Ƶ Bit[7:4]:ϵͳʱ�ӷ�Ƶ input clock =24Mhz, PCLK = 72Mhz
		sccb_write_reg16(0x3035,0x11);
//		sccb_write_reg16(0x3036,0x3c); //PLL��Ƶ  //48M
		sccb_write_reg16(0x3036,0x5A); //PLL��Ƶ  //72M
		sccb_write_reg16(0x3c07,0x08);
		//ʱ����� 0x3800~0x3821
		sccb_write_reg16(0x3820,0x46);
		sccb_write_reg16(0x3821,0x01);
		sccb_write_reg16(0x3814,0x31);
		sccb_write_reg16(0x3815,0x31);
		sccb_write_reg16(0x3800,0x00);
		sccb_write_reg16(0x3801,0x00);
		sccb_write_reg16(0x3802,0x00);
		sccb_write_reg16(0x3803,0x04);
		sccb_write_reg16(0x3804,0x0a);
		sccb_write_reg16(0x3805,0x3f);
		sccb_write_reg16(0x3806,0x07);
		sccb_write_reg16(0x3807,0x9b);

		//����������ظ���
		sccb_write_reg16(0x3808, cmos_h_pixel >> 8     );  //DVP ���ˮƽ���ص�����4λ
		sccb_write_reg16(0x3809, cmos_h_pixel & 0x00FF );  //DVP ���ˮƽ���ص�����8λ
		sccb_write_reg16(0x380a, cmos_v_pixel >> 8     );  //DVP �����ֱ���ص�����3λ
		sccb_write_reg16(0x380b, cmos_v_pixel & 0x00FF );  //DVP �����ֱ���ص�����8λ
		sccb_write_reg16(0x380c, total_h_pixel >> 8    );  //ˮƽ�����ش�С��5λ
		sccb_write_reg16(0x380d, total_h_pixel & 0x00FF);  //ˮƽ�����ش�С��8λ
		sccb_write_reg16(0x380e, total_v_pixel >> 8    );  //��ֱ�����ش�С��5λ
		sccb_write_reg16(0x380f, total_v_pixel & 0x00FF);  //��ֱ�����ش�С��8λ
		
		sccb_write_reg16(0x3813,0x06);
		sccb_write_reg16(0x3618,0x00);
		sccb_write_reg16(0x3612,0x29);
		sccb_write_reg16(0x3709,0x52);
		sccb_write_reg16(0x370c,0x03);
		sccb_write_reg16(0x3a02,0x17); //60Hz max exposure
		sccb_write_reg16(0x3a03,0x10); //60Hz max exposure
		sccb_write_reg16(0x3a14,0x17); //50Hz max exposure
		sccb_write_reg16(0x3a15,0x10); //50Hz max exposure
		sccb_write_reg16(0x4004,0x02); //BLC(����) 2 lines
		sccb_write_reg16(0x4713,0x03); //JPEG mode 3
		sccb_write_reg16(0x4407,0x04); //�������
		sccb_write_reg16(0x460c,0x22);
		sccb_write_reg16(0x4837,0x22); //DVP CLK divider
		sccb_write_reg16(0x3824,0x02); //DVP CLK divider
		sccb_write_reg16(0x5001,0xa3); //ISP ����
		sccb_write_reg16(0x3b07,0x0a); //֡�ع�ģʽ
		//��������ʹ��
		sccb_write_reg16(0x503d,0x00); //0x00:����ģʽ 0x80:������ʾ
		//��������ƹ���
		sccb_write_reg16(0x3016,0x02);
		sccb_write_reg16(0x301c,0x02);
		sccb_write_reg16(0x3019,0x02); //�������
		sccb_write_reg16(0x3019,0x00); //�ر������
		return 0;
	}


}

