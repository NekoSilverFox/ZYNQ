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



module  cmos_cfg(
    input   wire            clk         ,//输入时钟
    input   wire            rst         ,//系统复位  
    output  wire            scl         ,//i2c时钟
    output  reg             cfg_done    ,//配置完成信号
    inout   wire            sda          //i2c数据
);


//==================================================
//parameter define
//==================================================
parameter   IDLE    =   3'b001;
parameter   WR_CHECK=   3'b010;
parameter   WRITE   =   3'b100;

parameter   SYS_CYCLE   =   20;//系统时钟50M
parameter   WAIT_TIME   =   20000000;//两次传输数据的等待时间
parameter   MAX_WAIT    =   WAIT_TIME/SYS_CYCLE - 1; 

parameter   DEV_ADDR    =   8'h78;

//==================================================
//internal signals
//==================================================

reg             wr_req      ;//i2c写请求
wire            wr_done     ;//i2c写响应
wire    [7:0]   wr_data     ;//i2c写入的数据
wire    [7:0]   dev_addr    ;//i2c从设备地址
wire    [15:0]  mem_addr    ;//i2c从设备寄存器地址

reg     [24:0]  cnt_wait    ;
reg             ready       ;//准备好信号

reg     [3:0]   state       ;//state register
reg     [8:0]   wr_index    ;//配置寄存器索引  
reg     [8:0]   rd_index    ;//读取寄存器索引
reg     [31:0]  lut_data    ;//配置寄存器值
reg             start       ;//读写起始信号        


//--------------------state machine describe--------------------
always @(posedge clk)begin
    if(rst == 1'b1)begin
        state <= IDLE;
    end
    else begin
        case(state)
            IDLE:begin
                    state <= WR_CHECK;
            end

            WR_CHECK:begin  //判断当前是否已经配置完成寄存器，若是则等待读寄存器，若不是则进入WRITE状态，写寄存器
                if(cfg_done==1'b1)
                    state <= WR_CHECK;
                else if(cfg_done==1'b0 && ready)
                    state <= WRITE;
            end

            WRITE:begin//一个寄存器写完，回到WR_CHECK状态
                if(wr_done)
                    state <= WR_CHECK;
                else if(cfg_done==1'b1)
                    state <= WR_CHECK;
                else
                    state <= WRITE;
            end  

            default:begin
                state <= IDLE;
            end
        endcase
    end
end

//--------------------cnt_wait--------------------
always @(posedge clk)begin
    if(rst == 1'b1)begin
        cnt_wait <= 'd0;//复位
    end
    else if(state==WR_CHECK)begin//等待状态或者写判断是否配置完成状态
        if(cnt_wait==MAX_WAIT)
            cnt_wait <= 'd0;
        else
            cnt_wait <= cnt_wait + 1'b1;
    end  
    else begin
        cnt_wait <= 'd0;
    end
end

//--------------------ready--------------------
always @(posedge clk)begin
    if(rst == 1'b1)begin
        ready <= 1'b0;
    end
    else if(state==WR_CHECK)begin//读到最后一个寄存器，索引值保持不变
        if(cnt_wait==MAX_WAIT)
            ready <= 1'b1;
        else
            ready <= ready;
    end
    else if(start)begin
        ready <= 1'b0; 
    end
end

always @(posedge clk)begin
    if(rst == 1'b1)begin
        lut_data <= 'h78a00100;
    end
    else if(cfg_done==1'b0)begin
        case(wr_index)//配置寄存器列表
             //先对寄存器进行软件复位，使寄存器恢复初始值
            9'd0  : lut_data <= {DEV_ADDR,16'h3008,8'h82}; //Bit[7]:复位 Bit[6]:电源休眠
            9'd1  : lut_data <= {DEV_ADDR,16'h3008,8'h02}; //正常工作模式
            9'd2  : lut_data <= {DEV_ADDR,16'h3103,8'h02}; //Bit[1]:1 PLL Clock
            //引脚输入/输出控制 FREX/VSYNC/HREF/PCLK/D[9:6]
            9'd3  : lut_data <= {DEV_ADDR,8'h30,8'h17,8'hff};
            //引脚输入/输出控制 D[5:0]/GPIO1/GPIO0 
            9'd4  : lut_data <= {DEV_ADDR,16'h3018,8'hff};
            9'd5  : lut_data <= {DEV_ADDR,16'h3037,8'h13}; //PLL分频控制
            9'd6  : lut_data <= {DEV_ADDR,16'h3108,8'h01}; //系统根分频器
            9'd7  : lut_data <= {DEV_ADDR,16'h3630,8'h36};
            9'd8  : lut_data <= {DEV_ADDR,16'h3631,8'h0e};
            9'd9  : lut_data <= {DEV_ADDR,16'h3632,8'he2};
            9'd10 : lut_data <= {DEV_ADDR,16'h3633,8'h12};
            9'd11 : lut_data <= {DEV_ADDR,16'h3621,8'he0};
            9'd12 : lut_data <= {DEV_ADDR,16'h3704,8'ha0};
            9'd13 : lut_data <= {DEV_ADDR,16'h3703,8'h5a};
            9'd14 : lut_data <= {DEV_ADDR,16'h3715,8'h78};
            9'd15 : lut_data <= {DEV_ADDR,16'h3717,8'h01};
            9'd16 : lut_data <= {DEV_ADDR,16'h370b,8'h60};
            9'd17 : lut_data <= {DEV_ADDR,16'h3705,8'h1a};
            9'd18 : lut_data <= {DEV_ADDR,16'h3905,8'h02};
            9'd19 : lut_data <= {DEV_ADDR,16'h3906,8'h10};
            9'd20 : lut_data <= {DEV_ADDR,16'h3901,8'h0a};
            9'd21 : lut_data <= {DEV_ADDR,16'h3731,8'h12};
            9'd22 : lut_data <= {DEV_ADDR,16'h3600,8'h08}; //VCM控制,用于自动聚焦
            9'd23 : lut_data <= {DEV_ADDR,16'h3601,8'h33}; //VCM控制,用于自动聚焦
            9'd24 : lut_data <= {DEV_ADDR,16'h302d,8'h60}; //系统控制
            9'd25 : lut_data <= {DEV_ADDR,16'h3620,8'h52};
            9'd26 : lut_data <= {DEV_ADDR,16'h371b,8'h20};
            9'd27 : lut_data <= {DEV_ADDR,16'h471c,8'h50};
            9'd28 : lut_data <= {DEV_ADDR,16'h3a13,8'h43}; //AEC(自动曝光控制)
            9'd29 : lut_data <= {DEV_ADDR,16'h3a18,8'h00}; //AEC 增益上限
            9'd30 : lut_data <= {DEV_ADDR,16'h3a19,8'hf8}; //AEC 增益上限
            9'd31 : lut_data <= {DEV_ADDR,16'h3635,8'h13};
            9'd32 : lut_data <= {DEV_ADDR,16'h3636,8'h03};
            9'd33 : lut_data <= {DEV_ADDR,16'h3634,8'h40};
            9'd34 : lut_data <= {DEV_ADDR,16'h3622,8'h01};
            9'd35 : lut_data <= {DEV_ADDR,16'h3c01,8'h34};
            9'd36 : lut_data <= {DEV_ADDR,16'h3c04,8'h28};
            9'd37 : lut_data <= {DEV_ADDR,16'h3c05,8'h98};
            9'd38 : lut_data <= {DEV_ADDR,16'h3c06,8'h00}; //light meter 1 阈值[15:8]
            9'd39 : lut_data <= {DEV_ADDR,16'h3c07,8'h08}; //light meter 1 阈值[7:0]
            9'd40 : lut_data <= {DEV_ADDR,16'h3c08,8'h00}; //light meter 2 阈值[15:8]
            9'd41 : lut_data <= {DEV_ADDR,16'h3c09,8'h1c}; //light meter 2 阈值[7:0]
            9'd42 : lut_data <= {DEV_ADDR,16'h3c0a,8'h9c}; //sample number[15:8]
            9'd43 : lut_data <= {DEV_ADDR,16'h3c0b,8'h40}; //sample number[7:0]
            9'd44 : lut_data <= {DEV_ADDR,16'h3810,8'h00}; //Timing Hoffset[11:8]
            9'd45 : lut_data <= {DEV_ADDR,16'h3811,8'h10}; //Timing Hoffset[7:0]
            9'd46 : lut_data <= {DEV_ADDR,16'h3812,8'h00}; //Timing Voffset[10:8]
            9'd47 : lut_data <= {DEV_ADDR,16'h3708,8'h64};
            9'd48 : lut_data <= {DEV_ADDR,16'h4001,8'h02}; //BLC(黑电平校准)补偿起始行号
            9'd49 : lut_data <= {DEV_ADDR,16'h4005,8'h1a}; //BLC(黑电平校准)补偿始终更新
            9'd50 : lut_data <= {DEV_ADDR,16'h3000,8'h00}; //系统块复位控制
            9'd51 : lut_data <= {DEV_ADDR,16'h3004,8'hff}; //时钟使能控制
            9'd52 : lut_data <= {DEV_ADDR,16'h4300,8'h61}; //格式控制 RGB565
            9'd53 : lut_data <= {DEV_ADDR,16'h501f,8'h01}; //ISP RGB
            9'd54 : lut_data <= {DEV_ADDR,16'h440e,8'h00};
            9'd55 : lut_data <= {DEV_ADDR,16'h5000,8'ha7}; //ISP控制
            9'd56 : lut_data <= {DEV_ADDR,16'h3a0f,8'h30}; //AEC控制;stable range in high
            9'd57 : lut_data <= {DEV_ADDR,16'h3a10,8'h28}; //AEC控制;stable range in low
            9'd58 : lut_data <= {DEV_ADDR,16'h3a1b,8'h30}; //AEC控制;stable range out high
            9'd59 : lut_data <= {DEV_ADDR,16'h3a1e,8'h26}; //AEC控制;stable range out low
            9'd60 : lut_data <= {DEV_ADDR,16'h3a11,8'h60}; //AEC控制; fast zone high
            9'd61 : lut_data <= {DEV_ADDR,16'h3a1f,8'h14}; //AEC控制; fast zone low
            //LENC(镜头校正)控制 16'h5800~16'h583d
            9'd62 : lut_data <= {DEV_ADDR,16'h5800,8'h23}; 
            9'd63 : lut_data <= {DEV_ADDR,16'h5801,8'h14};
            9'd64 : lut_data <= {DEV_ADDR,16'h5802,8'h0f};
            9'd65 : lut_data <= {DEV_ADDR,16'h5803,8'h0f};
            9'd66 : lut_data <= {DEV_ADDR,16'h5804,8'h12};
            9'd67 : lut_data <= {DEV_ADDR,16'h5805,8'h26};
            9'd68 : lut_data <= {DEV_ADDR,16'h5806,8'h0c};
            9'd69 : lut_data <= {DEV_ADDR,16'h5807,8'h08};
            9'd70 : lut_data <= {DEV_ADDR,16'h5808,8'h05};
            9'd71 : lut_data <= {DEV_ADDR,16'h5809,8'h05};
            9'd72 : lut_data <= {DEV_ADDR,16'h580a,8'h08};
            9'd73 : lut_data <= {DEV_ADDR,16'h580b,8'h0d};
            9'd74 : lut_data <= {DEV_ADDR,16'h580c,8'h08};
            9'd75 : lut_data <= {DEV_ADDR,16'h580d,8'h03};
            9'd76 : lut_data <= {DEV_ADDR,16'h580e,8'h00};
            9'd77 : lut_data <= {DEV_ADDR,16'h580f,8'h00};
            9'd78 : lut_data <= {DEV_ADDR,16'h5810,8'h03};
            9'd79 : lut_data <= {DEV_ADDR,16'h5811,8'h09};
            9'd80 : lut_data <= {DEV_ADDR,16'h5812,8'h07};
            9'd81 : lut_data <= {DEV_ADDR,16'h5813,8'h03};
            9'd82 : lut_data <= {DEV_ADDR,16'h5814,8'h00};
            9'd83 : lut_data <= {DEV_ADDR,16'h5815,8'h01};
            9'd84 : lut_data <= {DEV_ADDR,16'h5816,8'h03};
            9'd85 : lut_data <= {DEV_ADDR,16'h5817,8'h08};
            9'd86 : lut_data <= {DEV_ADDR,16'h5818,8'h0d};
            9'd87 : lut_data <= {DEV_ADDR,16'h5819,8'h08};
            9'd88 : lut_data <= {DEV_ADDR,16'h581a,8'h05};
            9'd89 : lut_data <= {DEV_ADDR,16'h581b,8'h06};
            9'd90 : lut_data <= {DEV_ADDR,16'h581c,8'h08};
            9'd91 : lut_data <= {DEV_ADDR,16'h581d,8'h0e};
            9'd92 : lut_data <= {DEV_ADDR,16'h581e,8'h29};
            9'd93 : lut_data <= {DEV_ADDR,16'h581f,8'h17};
            9'd94 : lut_data <= {DEV_ADDR,16'h5820,8'h11};
            9'd95 : lut_data <= {DEV_ADDR,16'h5821,8'h11};
            9'd96 : lut_data <= {DEV_ADDR,16'h5822,8'h15};
            9'd97 : lut_data <= {DEV_ADDR,16'h5823,8'h28};
            9'd98 : lut_data <= {DEV_ADDR,16'h5824,8'h46};
            9'd99 : lut_data <= {DEV_ADDR,16'h5825,8'h26};
            9'd100: lut_data <= {DEV_ADDR,16'h5826,8'h08};
            9'd101: lut_data <= {DEV_ADDR,16'h5827,8'h26};
            9'd102: lut_data <= {DEV_ADDR,16'h5828,8'h64};
            9'd103: lut_data <= {DEV_ADDR,16'h5829,8'h26};
            9'd104: lut_data <= {DEV_ADDR,16'h582a,8'h24};
            9'd105: lut_data <= {DEV_ADDR,16'h582b,8'h22};
            9'd106: lut_data <= {DEV_ADDR,16'h582c,8'h24};
            9'd107: lut_data <= {DEV_ADDR,16'h582d,8'h24};
            9'd108: lut_data <= {DEV_ADDR,16'h582e,8'h06};
            9'd109: lut_data <= {DEV_ADDR,16'h582f,8'h22};
            9'd110: lut_data <= {DEV_ADDR,16'h5830,8'h40};
            9'd111: lut_data <= {DEV_ADDR,16'h5831,8'h42};
            9'd112: lut_data <= {DEV_ADDR,16'h5832,8'h24};
            9'd113: lut_data <= {DEV_ADDR,16'h5833,8'h26};
            9'd114: lut_data <= {DEV_ADDR,16'h5834,8'h24};
            9'd115: lut_data <= {DEV_ADDR,16'h5835,8'h22};
            9'd116: lut_data <= {DEV_ADDR,16'h5836,8'h22};
            9'd117: lut_data <= {DEV_ADDR,16'h5837,8'h26};
            9'd118: lut_data <= {DEV_ADDR,16'h5838,8'h44};
            9'd119: lut_data <= {DEV_ADDR,16'h5839,8'h24};
            9'd120: lut_data <= {DEV_ADDR,16'h583a,8'h26};
            9'd121: lut_data <= {DEV_ADDR,16'h583b,8'h28};
            9'd122: lut_data <= {DEV_ADDR,16'h583c,8'h42};
            9'd123: lut_data <= {DEV_ADDR,16'h583d,8'hce};
            //AWB(自动白平衡控制) 16'h5180~16'h519e
            9'd124: lut_data <= {DEV_ADDR,16'h5180,8'hff};
            9'd125: lut_data <= {DEV_ADDR,16'h5181,8'hf2};
            9'd126: lut_data <= {DEV_ADDR,16'h5182,8'h00};
            9'd127: lut_data <= {DEV_ADDR,16'h5183,8'h14};
            9'd128: lut_data <= {DEV_ADDR,16'h5184,8'h25};
            9'd129: lut_data <= {DEV_ADDR,16'h5185,8'h24};
            9'd130: lut_data <= {DEV_ADDR,16'h5186,8'h09};
            9'd131: lut_data <= {DEV_ADDR,16'h5187,8'h09};
            9'd132: lut_data <= {DEV_ADDR,16'h5188,8'h09};
            9'd133: lut_data <= {DEV_ADDR,16'h5189,8'h75};
            9'd134: lut_data <= {DEV_ADDR,16'h518a,8'h54};
            9'd135: lut_data <= {DEV_ADDR,16'h518b,8'he0};
            9'd136: lut_data <= {DEV_ADDR,16'h518c,8'hb2};
            9'd137: lut_data <= {DEV_ADDR,16'h518d,8'h42};
            9'd138: lut_data <= {DEV_ADDR,16'h518e,8'h3d};
            9'd139: lut_data <= {DEV_ADDR,16'h518f,8'h56};
            9'd140: lut_data <= {DEV_ADDR,16'h5190,8'h46};
            9'd141: lut_data <= {DEV_ADDR,16'h5191,8'hf8};
            9'd142: lut_data <= {DEV_ADDR,16'h5192,8'h04};
            9'd143: lut_data <= {DEV_ADDR,16'h5193,8'h70};
            9'd144: lut_data <= {DEV_ADDR,16'h5194,8'hf0};
            9'd145: lut_data <= {DEV_ADDR,16'h5195,8'hf0};
            9'd146: lut_data <= {DEV_ADDR,16'h5196,8'h03};
            9'd147: lut_data <= {DEV_ADDR,16'h5197,8'h01};
            9'd148: lut_data <= {DEV_ADDR,16'h5198,8'h04};
            9'd149: lut_data <= {DEV_ADDR,16'h5199,8'h12};
            9'd150: lut_data <= {DEV_ADDR,16'h519a,8'h04};
            9'd151: lut_data <= {DEV_ADDR,16'h519b,8'h00};
            9'd152: lut_data <= {DEV_ADDR,16'h519c,8'h06};
            9'd153: lut_data <= {DEV_ADDR,16'h519d,8'h82};
            9'd154: lut_data <= {DEV_ADDR,16'h519e,8'h38};
            //Gamma(伽马)控制 16'h5480~16'h5490
            9'd155: lut_data <= {DEV_ADDR,16'h5480,8'h01}; 
            9'd156: lut_data <= {DEV_ADDR,16'h5481,8'h08};
            9'd157: lut_data <= {DEV_ADDR,16'h5482,8'h14};
            9'd158: lut_data <= {DEV_ADDR,16'h5483,8'h28};
            9'd159: lut_data <= {DEV_ADDR,16'h5484,8'h51};
            9'd160: lut_data <= {DEV_ADDR,16'h5485,8'h65};
            9'd161: lut_data <= {DEV_ADDR,16'h5486,8'h71};
            9'd162: lut_data <= {DEV_ADDR,16'h5487,8'h7d};
            9'd163: lut_data <= {DEV_ADDR,16'h5488,8'h87};
            9'd164: lut_data <= {DEV_ADDR,16'h5489,8'h91};
            9'd165: lut_data <= {DEV_ADDR,16'h548a,8'h9a};
            9'd166: lut_data <= {DEV_ADDR,16'h548b,8'haa};
            9'd167: lut_data <= {DEV_ADDR,16'h548c,8'hb8};
            9'd168: lut_data <= {DEV_ADDR,16'h548d,8'hcd};
            9'd169: lut_data <= {DEV_ADDR,16'h548e,8'hdd};
            9'd170: lut_data <= {DEV_ADDR,16'h548f,8'hea};
            9'd171: lut_data <= {DEV_ADDR,16'h5490,8'h1d};
            //CMX(彩色矩阵控制) 16'h5381~16'h538b
            9'd172: lut_data <= {DEV_ADDR,16'h5381,8'h1e};
            9'd173: lut_data <= {DEV_ADDR,16'h5382,8'h5b};
            9'd174: lut_data <= {DEV_ADDR,16'h5383,8'h08};
            9'd175: lut_data <= {DEV_ADDR,16'h5384,8'h0a};
            9'd176: lut_data <= {DEV_ADDR,16'h5385,8'h7e};
            9'd177: lut_data <= {DEV_ADDR,16'h5386,8'h88};
            9'd178: lut_data <= {DEV_ADDR,16'h5387,8'h7c};
            9'd179: lut_data <= {DEV_ADDR,16'h5388,8'h6c};
            9'd180: lut_data <= {DEV_ADDR,16'h5389,8'h10};
            9'd181: lut_data <= {DEV_ADDR,16'h538a,8'h01};
            9'd182: lut_data <= {DEV_ADDR,16'h538b,8'h98};
            //SDE(特殊数码效果)控制 16'h5580~16'h558b
            9'd183: lut_data <= {DEV_ADDR,16'h5580,8'h06};
            9'd184: lut_data <= {DEV_ADDR,16'h5583,8'h40};
            9'd185: lut_data <= {DEV_ADDR,16'h5584,8'h10};
            9'd186: lut_data <= {DEV_ADDR,16'h5589,8'h10};
            9'd187: lut_data <= {DEV_ADDR,16'h558a,8'h00};
            9'd188: lut_data <= {DEV_ADDR,16'h558b,8'hf8};
            9'd189: lut_data <= {DEV_ADDR,16'h501d,8'h40}; //ISP MISC
            //CIP(颜色插值)控制 (16'h5300~16'h530c)
            9'd190: lut_data <= {DEV_ADDR,16'h5300,8'h08};
            9'd191: lut_data <= {DEV_ADDR,16'h5301,8'h30};
            9'd192: lut_data <= {DEV_ADDR,16'h5302,8'h10};
            9'd193: lut_data <= {DEV_ADDR,16'h5303,8'h00};
            9'd194: lut_data <= {DEV_ADDR,16'h5304,8'h08};
            9'd195: lut_data <= {DEV_ADDR,16'h5305,8'h30};
            9'd196: lut_data <= {DEV_ADDR,16'h5306,8'h08};
            9'd197: lut_data <= {DEV_ADDR,16'h5307,8'h16};
            9'd198: lut_data <= {DEV_ADDR,16'h5309,8'h08};
            9'd199: lut_data <= {DEV_ADDR,16'h530a,8'h30};
            9'd200: lut_data <= {DEV_ADDR,16'h530b,8'h04};
            9'd201: lut_data <= {DEV_ADDR,16'h530c,8'h06};
            9'd202: lut_data <= {DEV_ADDR,16'h5025,8'h00};
            //系统时钟分频 Bit[7:4]:系统时钟分频 input clock =24Mhz, PCLK = 48Mhz
            9'd203: lut_data <= {DEV_ADDR,16'h3035,8'h11}; 
            9'd204: lut_data <= {DEV_ADDR,16'h3036,8'h3c}; //PLL倍频
            9'd205: lut_data <= {DEV_ADDR,16'h3c07,8'h08};
            //时序控制 16'h3800~16'h3821
            9'd206: lut_data <= {DEV_ADDR,16'h3820,8'h46};
            9'd207: lut_data <= {DEV_ADDR,16'h3821,8'h01};
            9'd208: lut_data <= {DEV_ADDR,16'h3814,8'h31};
            9'd209: lut_data <= {DEV_ADDR,16'h3815,8'h31};
            9'd210: lut_data <= {DEV_ADDR,16'h3800,8'h00};
            9'd211: lut_data <= {DEV_ADDR,16'h3801,8'h00};
            9'd212: lut_data <= {DEV_ADDR,16'h3802,8'h00};
            9'd213: lut_data <= {DEV_ADDR,16'h3803,8'h04};
            9'd214: lut_data <= {DEV_ADDR,16'h3804,8'h0a};
            9'd215: lut_data <= {DEV_ADDR,16'h3805,8'h3f};
            9'd216: lut_data <= {DEV_ADDR,16'h3806,8'h07};
            9'd217: lut_data <= {DEV_ADDR,16'h3807,8'h9b};

            //设置输出像素个数
            //DVP 输出水平像素点数高4位
            9'd218: lut_data <= {DEV_ADDR,16'h3808,8'h04};
            //DVP 输出水平像素点数低8位
            9'd219: lut_data <= {DEV_ADDR,16'h3809,8'h00};
            //DVP 输出垂直像素点数高3位
            9'd220: lut_data <= {DEV_ADDR,16'h380a,8'h03};
            //DVP 输出垂直像素点数低8位
            9'd221: lut_data <= {DEV_ADDR,16'h380b,8'h00};
            //水平总像素大小高5位
            9'd222: lut_data <= {DEV_ADDR,16'h380c,8'h08};
            //水平总像素大小低8位 
            9'd223: lut_data <= {DEV_ADDR,16'h380d,8'hC0};
            //垂直总像素大小高5位 
            9'd224: lut_data <= {DEV_ADDR,16'h380e,8'h04};
            //垂直总像素大小低8位     
            9'd225: lut_data <= {DEV_ADDR,16'h380f,8'hF8};

            9'd226: lut_data <= {DEV_ADDR,16'h3813,8'h06};
            9'd227: lut_data <= {DEV_ADDR,16'h3618,8'h00};
            9'd228: lut_data <= {DEV_ADDR,16'h3612,8'h29};
            9'd229: lut_data <= {DEV_ADDR,16'h3709,8'h52};
            9'd230: lut_data <= {DEV_ADDR,16'h370c,8'h03};
            9'd231: lut_data <= {DEV_ADDR,16'h3a02,8'h17}; //60Hz max exposure
            9'd232: lut_data <= {DEV_ADDR,16'h3a03,8'h10}; //60Hz max exposure
            9'd233: lut_data <= {DEV_ADDR,16'h3a14,8'h17}; //50Hz max exposure
            9'd234: lut_data <= {DEV_ADDR,16'h3a15,8'h10}; //50Hz max exposure
            9'd235: lut_data <= {DEV_ADDR,16'h4004,8'h02}; //BLC(背光) 2 lines
            9'd236: lut_data <= {DEV_ADDR,16'h4713,8'h03}; //JPEG mode 3
            9'd237: lut_data <= {DEV_ADDR,16'h4407,8'h04}; //量化标度
            9'd238: lut_data <= {DEV_ADDR,16'h460c,8'h22};     
            9'd239: lut_data <= {DEV_ADDR,16'h4837,8'h22}; //DVP CLK divider
            9'd240: lut_data <= {DEV_ADDR,16'h3824,8'h02}; //DVP CLK divider
            9'd241: lut_data <= {DEV_ADDR,16'h5001,8'ha3}; //ISP 控制
            9'd242: lut_data <= {DEV_ADDR,16'h3b07,8'h0a}; //帧曝光模式  
            //彩条测试使能 
            9'd243: lut_data <= {DEV_ADDR,16'h503d,8'h00}; //8'h00:正常模式 8'h80:彩条显示
            //测试闪光灯功能
            9'd244: lut_data <= {DEV_ADDR,16'h3016,8'h02};
            9'd245: lut_data <= {DEV_ADDR,16'h301c,8'h02};
            9'd246: lut_data <= {DEV_ADDR,16'h3019,8'h02}; //打开闪光灯
            9'd247: lut_data <= {DEV_ADDR,16'h3019,8'h00}; //关闭闪光灯
            default:begin
                lut_data  <=  'hFFFFFFFF ; //Nbr of times to search for good phase
            end
        endcase
    end
end

//按照设备地址，寄存器地址和写入的数据的顺序，赋值
assign {dev_addr,mem_addr,wr_data} = lut_data;

//--------------------wr_index--------------------
always @(posedge clk)begin
    if(rst == 1'b1)begin
        wr_index <= 'd0;//写寄存器索引
    end
    else if(dev_addr==8'hFF)begin//配置寄存器全部完成后保持位0
        wr_index <= wr_index;
    end
    else if(wr_done && cfg_done==1'b0) begin//配置寄存器未完成，并且接收到写响应
        wr_index <= wr_index + 1'b1;
    end
    else begin
        wr_index <= wr_index;
    end
end


//--------------------wr_req--------------------
always @(posedge clk)begin
    if(rst == 1'b1)begin
        wr_req <= 1'b0;
    end
    else if(cfg_done==1'b1)begin//接收到写响应时，写请求变低
        wr_req <= 1'b0;
    end
    else if(wr_done)begin//接收到写响应时，写请求变低
        wr_req <= 1'b0;
    end
    else if(state==WR_CHECK && cfg_done==1'b0 && ready && dev_addr!=8'hff)begin//配置寄存器还没有全部完成，在WR_CHECK状态下产生写请求
        wr_req <= 1'b1;
    end
    else begin
        wr_req <= wr_req;
    end
end

//--------------------cfg_done--------------------
always @(posedge clk)begin
    if(rst == 1'b1)begin
        cfg_done <= 1'b0;//配置寄存器结束标志
    end
    else if(dev_addr ==8'hff)begin
        cfg_done <= 1'b1;
    end
end

//--------------------start--------------------
always @(posedge clk)begin
    if(rst == 1'b1)begin
        start <= 1'b0;//配置寄存器结束标志
    end
    else if(state==WR_CHECK && cfg_done==1'b0 && ready && dev_addr!=8'hff)begin//写开始
        start <= 1'b1;
    end
    else begin
        start <= 1'b0;
    end
end

    sccb_driver inst_sccb_driver (
            .clk      (clk),
            .rst      (rst),
            .wr_req   (wr_req),
            .rd_req   (),
            .start    (start),
            .dev_addr (dev_addr),
            .mem_addr (mem_addr),
            .wr_data  (wr_data),
            .rd_data  (),
            .rd_done  (),
            .wr_done  (wr_done),
            .err_flag (err_flag),
            .scl      (scl),
            .sda      (sda)
        );

endmodule

