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
//  Date          By            Revision    Change Description
//---------------------------------------------------------------------
//2019-12-07      Chaochen Wei  1.0          Original
//2019/                         1.1          
// --------------------------------------------------------------------
// --------------------------------------------------------------------

`timescale 1ns / 1ps
module sccb_driver(
    input   wire            clk     ,//系统时钟
    input   wire            rst     ,//系统复位
    input   wire            wr_req  ,//写请求信号
    input   wire            rd_req  ,//读请求信号
    input   wire            start   ,//一次读写开始信号
    input   wire    [7:0]   dev_addr,//设备地址
    input   wire    [15:0]  mem_addr,//寄存器地址
    input   wire    [7:0]   wr_data ,//写入寄存器的数据

    output  reg     [7:0]   rd_data ,//从寄存器读出的数据
    output  reg             rd_done ,//一次读操作结束
    output  reg             wr_done ,//一次写操作结束
    output  reg             err_flag,//发生错误信号
    output  reg             scl     ,//i2c时钟
    inout   wire            sda      //i2c数据总线   
    );

//==================================================
//parameter define
//==================================================
parameter   IDLE    = 10'b00_0000_0001;//空闲状态
parameter   WR_START= 10'b00_0000_0010;//写起始
parameter   WR_DEV  = 10'b00_0000_0100;//确认设备地址
parameter   WR_MEM  = 10'b00_0000_1000;//确认寄存器地址
parameter   WR_DATA = 10'b00_0001_0000;//写数据
parameter   RD_START= 10'b00_0010_0000;//读开始
parameter   RD_DEV  = 10'b00_0100_0000;//设备地址读操作
parameter   RD_DATA = 10'b00_1000_0000;//读数据
parameter   STOP    = 10'b01_0000_0000;//停止
parameter   ERROR   = 10'b10_0000_0000;//错误


parameter   SYS_CYCLE = 20;//系统时钟50M
parameter   IIC_CYCLE = 5000;//IIC 工作频率200K
parameter   MAX      = (IIC_CYCLE/SYS_CYCLE) -1;//驱动时钟的计数最大值
parameter   T_HIGH   = 2000 ;//I2C时钟高电平
parameter   T_LOW    = 3000 ;//I2C时钟低电平

parameter   FLAG0 = ((T_HIGH/SYS_CYCLE)>>1) - 1;//SCL高电平中点
parameter   FLAG1 = (T_HIGH/SYS_CYCLE) - 1;//SCL下降沿
parameter   FLAG2  = (T_HIGH/SYS_CYCLE) + ((T_LOW/SYS_CYCLE)>>1) -1;//SCL低电平中点
parameter   FLAG3  = (T_HIGH/SYS_CYCLE) + (T_LOW/SYS_CYCLE) - 1;//SCL上升沿
//==================================================
//internal signals
//==================================================
reg     [2:0]   cnt_freq    ;//计数drive_flag 产生I2C时钟
wire            add_cnt_freq;
wire            end_cnt_freq;


reg     [5:0]   cnt_flag    ;//计数当前状态有多少个drive_flag
wire            add_cnt_flag;
wire            end_cnt_flag;
reg     [5:0]   x           ;//可变计数器的最大值

reg     [9:0]   cnt         ;//用来产生驱动信号drive_flag
wire            add_cnt     ;
wire            end_cnt     ;

reg             drive_flag  ;//用于驱动本模块工作的信号
reg     [8:0]   state       ;//state register
reg             work_flag   ;//work flag
reg             wr_en       ;//三态数据线写使能
reg     [7:0]   data_shift  ;//移位寄存器
reg             ack_flag    ;//响应信号

reg             cnt_byte    ;

reg             wr_sda      ;
wire            rec_sda     ;

//三态端口声明
assign  sda = wr_en?wr_sda:1'bz;//当主机向数据向数据总线上写数据时，wr_en=1，给出用户数据，当接收数据时，置为高阻
assign  rec_sda = sda;
//--------------------state machine define--------------------
always @(posedge clk)begin
    if(rst == 1'b1)begin
        state <= IDLE;
    end
    else begin
        case(state)
            IDLE:begin
                if(start==1'b1 && (wr_req==1'b1 || rd_req==1'b1))
                    state <= WR_START;//接收到开始信号，进入起始状态
                else
                    state <= IDLE;
            end

            WR_START:begin
                if(cnt_flag=='d6 && drive_flag)
                    state <= WR_DEV;//起始状态结束，进入确认设备地址状态
                else
                    state <= WR_START;
            end

            WR_DEV:begin
                if(cnt_flag=='d35 && drive_flag && ack_flag==1'b1)//发送完设备地址，并且正确接收到响应
                    state <= WR_MEM;//确认地址状态结束，进入确认寄存器地址状态
                else if(cnt_flag=='d35 && drive_flag && ack_flag==1'b0)//发送完设备地址，并且没有接收到响应
                    state <= ERROR;//确认地址状态结束，进入确认寄存器地址状态
                else
                    state <= WR_DEV;
            end

            WR_MEM:begin
                if(cnt_flag=='d35 && drive_flag && ack_flag==1'b1 && cnt_byte=='d1)begin//已经给出写入的寄存器，并且正确接收到响应
                    if(wr_req==1'b1)
                        state <= WR_DATA;//确认寄存器地址状态结束，进入写数据状态
                    else if(wr_req==1'b0 && rd_req==1'b1)
                        state <= RD_START;//确认寄存器地址状态结束，进入写开始状态
                end
                else if(cnt_flag=='d35 && drive_flag && ack_flag==1'b0)//发送完设备地址，并且没有接收到响应
                    state <= ERROR;//确认地址状态结束，进入确认寄存器地址状态
                else 
                    state <= WR_MEM;
            end

            WR_DATA:begin
                if(cnt_flag=='d35 && drive_flag && ack_flag==1'b1)//已经给出写入数据并正确接收到响应
                    state <= STOP;//数据写入完成进入停止状态
                else if(cnt_flag=='d35 && drive_flag && ack_flag==1'b0)//发送完设备地址，并且没有接收到响应
                    state <= ERROR;//确认地址状态结束，进入确认寄存器地址状态
                else
                    state <= WR_DATA;
            end

            RD_START:begin
                if(cnt_flag=='d3 && drive_flag && rd_req)
                    state <= RD_DEV;//进入设备地址读操作
                else
                    state <= RD_START;
            end

            RD_DEV:begin
                if(cnt_flag=='d35 && drive_flag && ack_flag==1'b1)
                    state <= RD_DATA;//进入读数据状态
                else if(cnt_flag=='d35 && drive_flag && ack_flag==1'b0)//发送完设备地址，并且没有接收到响应
                    state <= ERROR;//确认地址状态结束，进入确认寄存器地址状态
                else
                    state <= RD_DEV;
            end

            RD_DATA:begin
                if(cnt_flag=='d35 && drive_flag && ack_flag==1'b1)
                    state <= STOP;
                else if(cnt_flag=='d35 && drive_flag && ack_flag==1'b0)//发送完设备地址，并且没有接收到响应
                    state <= ERROR;//确认地址状态结束，进入确认寄存器地址状态
                else
                    state <= RD_DATA;
            end

            STOP:begin
                if(cnt_flag=='d3 && drive_flag)
                    state <= IDLE;
                else
                    state <= STOP;
            end

            ERROR:begin
                state <= IDLE;
            end

            default:begin
                state <= IDLE;
            end
        endcase
    end
end

//-------------------work_flag---------------------
always @(posedge clk)begin
    if(rst == 1'b1)begin
        work_flag <= 1'b0;
    end
    else if(state==WR_START)begin//接收到开始信号
        work_flag <= 1'b1;
    end
    else if(wr_done==1'b1 || rd_done==1'b1)begin//一次读写完成
        work_flag <= 1'b0;
    end
end

//--------------------cnt--------------------
always @(posedge clk)begin
    if(rst==1'b1)begin
        cnt <= 0;
    end
    else if(add_cnt)begin
        if(end_cnt)
            cnt <= 0;
        else
            cnt <= cnt + 1'b1;
    end
    else begin
        cnt <= 'd0;
    end
end

assign add_cnt = work_flag;//处于工作状态时一直计数       
assign end_cnt = add_cnt && cnt== MAX;//计数到最大值清零

//--------------------drive_flag--------------------
always @(posedge clk)begin
    if(rst == 1'b1)begin
        drive_flag <= 1'b0;
    end
    else if(cnt==FLAG0 || cnt==FLAG1 || cnt==FLAG2 || cnt==FLAG3)begin//产生一个驱动信号
        drive_flag <= 1'b1;
    end
    else begin
        drive_flag <= 1'b0;
    end
end

//--------------------cnt_freq--------------------
//对驱动信号进行计数，以此来产生I2C时钟
always @(posedge clk)begin
    if(rst==1'b1)begin
        cnt_freq <= 0;
    end
    else if(work_flag == 1'b0)begin
        cnt_freq <= 'd0;
    end
    else if(add_cnt_freq)begin
        if(end_cnt_freq)
            cnt_freq <= 0;
        else
            cnt_freq <= cnt_freq + 1'b1;
    end
    else begin
        cnt_freq <= cnt_freq;
    end
end

assign add_cnt_freq = drive_flag;       
assign end_cnt_freq = add_cnt_freq && cnt_freq== 4-1; 

//--------------------scl--------------------
always @(posedge clk)begin
    if(rst == 1'b1)begin
        scl <= 1'b1;
    end
    else if(work_flag==1'b1)begin
        if(cnt_freq=='d1 && drive_flag &&state==STOP)begin
            scl <= 1'b1;
        end
        else if(cnt_freq=='d1 && drive_flag && state!= STOP)begin
            scl <= 1'b0;
        end
        else if(cnt_freq=='d3 && drive_flag)begin
            scl <= 1'b1;
        end
    end
    else begin
        scl <= 1'b1;
    end
end

//--------------------cnt_flag--------------------
//计数当前状态下有多少个drive_flag
always @(posedge clk)begin
    if(rst==1'b1)begin
        cnt_flag <= 0;
    end
    else if(work_flag==1'b0)begin
        cnt_flag <= 'd0;
    end
    else if(add_cnt_flag)begin
        if(end_cnt_flag)
            cnt_flag <= 0;
        else
            cnt_flag <= cnt_flag + 1'b1;
    end
    else begin
        cnt_flag <= cnt_flag;
    end
end

assign add_cnt_flag = drive_flag;       
assign end_cnt_flag = add_cnt_flag && cnt_flag== x ; 

//--------------------x--------------------
//x为不同状态下，计数器的计数最大值
always  @(*)begin
    case(state)
        IDLE: x=0;
        WR_START: x= 7 - 1;
        WR_DEV,WR_MEM,WR_DATA,RD_DEV,RD_DATA: x=36 - 1;
        RD_START: x= 4 - 1;
        STOP: x = 4 - 1;
        default: x = 0;          
    endcase
end

//------------------cnt_byte----------------------
always @(posedge clk)begin
    if(rst == 1'b1)begin
        cnt_byte <= 'd0;
    end
    else if(state==WR_MEM && end_cnt_flag)begin
        cnt_byte <= cnt_byte + 1'b1;
    end
end
//------------------wr_en----------------------
always @(posedge clk)begin
    if(rst == 1'b1)begin
        wr_en <= 1'b0;
    end
    else if(state==WR_START || state==RD_START || state==STOP)begin
        wr_en <= 1'b1;//在写开始，读开始，和结束状态，由用户操纵数据总线，产生开始或者停止信号，所以写数据使能有效
    end
    else if(state==WR_DEV || state==WR_MEM ||state==WR_DATA || state==RD_DEV)begin
        if(cnt_flag < 'd32)begin//给出用户数据时，写数据使能有效
            wr_en <= 1'b1;
        end
        else begin
            wr_en <= 1'b0;//等待从设备响应时，写数据使能无效
        end
    end
    else if(state==RD_DATA)begin
        if(cnt_flag < 'd32)begin
            wr_en <= 1'b0;//接收数据状态，此时由从机发送数据给主机，写数据使能无效
        end
        else begin
            wr_en <= 1'b1;//接收数据完成，主机需要对从机做出应答，写数据使能有效
        end
    end
    else begin
        wr_en <= 1'b0;
    end
end

//--------------------data_shift--------------------
always @(posedge clk)begin
    if(rst == 1'b1)begin
        data_shift <= 'd0;
    end
    else begin
        case(state)
            IDLE:begin
                data_shift <= 'd0;//空闲状态，让移位寄存器保持为0
            end

            WR_START:begin
                data_shift <= {dev_addr[7:1],1'b0};//写开始状态，给出设备写指令
            end

            WR_DEV:begin
                if(end_cnt_flag && ack_flag==1'b1)
                    data_shift <= mem_addr[15:8];//确认设备状态结束时，给出寄存器地址
                else if(cnt_flag<'d32 && cnt_flag[1:0]==2'd3 && drive_flag)
                    data_shift <= {data_shift[6:0],1'b0};
            end

            WR_MEM:begin
                if(end_cnt_flag && ack_flag==1'b1 && wr_req==1'b1 && cnt_byte==1'b0)//即将进入写数据状态
                    data_shift <= mem_addr[7:0];//确认寄存器地址状态结束后给出要写入的数据
                else if(end_cnt_flag && ack_flag==1'b1 && wr_req==1'b1 && cnt_byte==1'b1)//即将进入写数据状态
                    data_shift <= wr_data;//确认寄存器地址状态结束后给出要写入的数据
                else if(cnt_flag<'d32 && cnt_flag[1:0]==2'd3 && drive_flag)
                    data_shift <= {data_shift[6:0],1'b0};
            end

            WR_DATA:begin
                if(cnt_flag<'d32 && cnt_flag[1:0]==2'd3 && drive_flag)
                    data_shift <= {data_shift[6:0],1'b0};//将数据写入到寄存器中
                else
                   data_shift <= data_shift; 
            end

            RD_START:begin
                data_shift <=  {dev_addr[7:1],1'b1};//读开始时，将读命令填充入移位寄存器
            end


            RD_DEV:begin
                if(end_cnt_flag && ack_flag==1'b1)
                    data_shift <= 'd0;
                else if(cnt_flag<'d32 && cnt_flag[1:0]==2'd3 && drive_flag)
                    data_shift <= {data_shift[6:0],1'b0};
            end

            RD_DATA:begin
                if(cnt_flag<'d32 && cnt_flag[1:0]==2'd1 && drive_flag)
                    data_shift <= {data_shift[6:0],rec_sda};//将从寄存器中读出的数据填充入移位寄存器
                else
                    data_shift <= data_shift;
            end

            default:begin
                data_shift <= data_shift;
            end
        endcase
    end
end



//--------------------wr_sda--------------------
always @(posedge clk)begin
    if(rst == 1'b1)begin
        wr_sda = 1'b1;
    end
    else begin
        case(state)
            WR_START:begin
                if(cnt_flag=='d4 && drive_flag)
                    wr_sda <= 1'b0;//产生起始位
                else
                    wr_sda <= wr_sda;
            end

            WR_DEV,WR_MEM,WR_DATA,RD_DEV:begin
                wr_sda <= data_shift[7];//将数据发送至数据总线上
            end

            RD_START:begin
                if(cnt_flag=='d0)
                    wr_sda <= 1'b1;//产生读起始位
                else if(cnt_flag=='d1 && drive_flag)
                    wr_sda <= 1'b0;
            end

            RD_DATA:begin
                if(cnt_flag>='d32)
                    wr_sda <= 1'b1;//产生NACK
                else
                    wr_sda <= wr_sda;
            end

            STOP:begin
                    if(cnt_flag=='d0 && wr_en)
                        wr_sda <= 1'b0;
                    else if(cnt_flag=='d1 && drive_flag)
                        wr_sda <= 1'b1;
            end
            
            default:wr_sda <= 1'b1;
        endcase
    end
end

//--------------------wr_done,rd_done--------------------
always @(posedge clk)begin
    if(rst == 1'b1)begin
        wr_done <= 1'b0;
        rd_done <= 1'b0;
    end
    else if(state==STOP && end_cnt_flag)begin//即将结束本次读写操作的时候，产生完成信号
        if(wr_req==1'b1)
            wr_done <= 1'b1;
        else if(wr_req==1'b0 && rd_req==1'b1)
            rd_done <= 1'b1;
    end
    else begin
        wr_done <= 1'b0;
        rd_done <= 1'b0;
    end
end

//--------------------ack_flag--------------------
//是否接收到ACK或者产生NACK
always @(posedge clk)begin
    if(rst == 1'b1)begin
        ack_flag <= 1'b0;
    end
    else begin
        case(state)
            WR_DEV:begin
                if(cnt_flag>='d32 && cnt_flag[1:0]=='d1 && drive_flag && sda==1'b0)
                    ack_flag <= 1'b1;//写完设备地址，并且接收到响应
                else if(end_cnt_flag)
                    ack_flag <= 1'b0;
            end

            WR_MEM:begin
                if(cnt_flag>='d32 && cnt_flag[1:0]=='d1 && drive_flag && sda==1'b0)
                    ack_flag <= 1'b1;//写完寄存器地址，接收到响应
                else if(end_cnt_flag)
                    ack_flag <= 1'b0;
            end

            WR_DATA:begin
                if(cnt_flag>='d32 && cnt_flag[1:0]=='d1 && drive_flag && sda==1'b0)
                    ack_flag <= 1'b1;//写完数据，并且接收到响应
                else if(end_cnt_flag)
                    ack_flag <= 1'b0;
            end

            RD_DEV:begin
                if(cnt_flag>='d32 && cnt_flag[1:0]=='d1 && drive_flag && sda==1'b0)
                    ack_flag <= 1'b1;//读指令发送完毕，接收到响应
                else if(end_cnt_flag)
                    ack_flag <= 1'b0;
            end

            RD_DATA:begin
                if(cnt_flag>='d32 && cnt_flag[1:0]=='d1 && drive_flag && sda==1'b1)
                    ack_flag <= 1'b1;//数据全部读完，主机给出NACK
                else if(end_cnt_flag)
                    ack_flag <= 1'b0;
            end

            default: ack_flag <= 1'b0;
        endcase
    end
end

//--------------------rd_data--------------------
always @(posedge clk)begin
    if(rst == 1'b1)begin
        rd_data <= 1'b0;
    end
    else if(rd_done)begin//即将结束本次读写操作的时候，产生完成信号
        rd_data <= data_shift;
    end
    else begin
        rd_data <= rd_data;
    end
end

always @(posedge clk)begin
    if(rst == 1'b1)begin
        err_flag <= 1'b0;
    end
    else if(state==ERROR)begin//即将结束本次读写操作的时候，产生完成信号
        err_flag <= 1'b1;
    end
    else begin
        err_flag <= 1'b0;
    end
end
endmodule
