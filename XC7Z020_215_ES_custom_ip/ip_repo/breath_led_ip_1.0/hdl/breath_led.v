
module breath_led(
    input          sys_clk        , //时钟信号
    input          sys_rst_n      , //复位信号
    input          sw_ctrl        , //呼吸灯开关控制信号 1：亮 0:灭
    input          set_en         , //设置呼吸灯频率设置使能信号
    input   [9:0]  set_freq_step  , //设置呼吸灯频率变化步长
    
    output         led              //LED
);

//*****************************************************
//**                  main code
//*****************************************************

//parameter define
parameter  START_FREQ_STEP = 10'd100; //设置频率步长初始值

//reg define
reg  [15:0]  period_cnt  ;      //周期计数器
reg  [9:0]   freq_step   ;      //呼吸灯频率间隔步长
reg  [15:0]  duty_cycle  ;      //设置高电平占空比的计数点
reg          inc_dec_flag;      //用于表示高电平占空比的计数值,是递增还是递减
                                //为1时表示占空比递减,为0时表示占空比递增
//wire define
wire         led_t       ;

//将周期信号计数值与占空比计数值进行比较，以输出驱动led的PWM信号
assign led_t = ( period_cnt <= duty_cycle ) ? 1'b1 : 1'b0 ;
assign led = led_t & sw_ctrl;

//周期信号计数器在0-50_000之间计数
always @ (posedge sys_clk) begin
    if (!sys_rst_n)
        period_cnt <= 16'd0;
    else if(!sw_ctrl)
        period_cnt <= 16'd0;
    else if( period_cnt == 16'd50_000 )
        period_cnt <= 16'd0;
    else
        period_cnt <= period_cnt + 16'd1;
end

//设置频率间隔
always @(posedge sys_clk) begin
    if(!sys_rst_n)
        freq_step <= START_FREQ_STEP;
    else if(set_en) begin
        if(set_freq_step == 0)
            freq_step <= 10'd1;
        else if(set_freq_step >= 10'd1_000)
            freq_step <= 10'd1_000;
        else    
            freq_step <= set_freq_step;
    end        
end

//设定高电平占空比的计数值
always @(posedge sys_clk) begin
    if (sys_rst_n == 1'b0) begin
        duty_cycle <= 16'd0;
        inc_dec_flag <= 1'b0;
    end     
    else if(!sw_ctrl) begin          //呼吸灯开关关闭时，信号清零
        duty_cycle <= 16'd0;
        inc_dec_flag <= 1'b0;
    end    
    //每次计数完了一个周期，就调节占空比计数值
    else if( period_cnt == 16'd50_000 ) begin
        if( inc_dec_flag ) begin  //占空比递减
            if( duty_cycle == 16'd0 )     
                inc_dec_flag <= 1'b0;
            else if(duty_cycle < freq_step)
                duty_cycle <= 16'd0;
            else    
                duty_cycle <= duty_cycle - freq_step;
        end
        else begin  //占空比递增
            if( duty_cycle >= 16'd50_000 )  
                inc_dec_flag <= 1'b1;
            else
                duty_cycle <= duty_cycle + freq_step;
        end 
    end 
    else  //未计数完一个周期时，占空比保持不变
        duty_cycle <= duty_cycle ;
end
  
endmodule
