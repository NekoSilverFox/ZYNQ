module rgb2lcd #(
    //parameter define
    parameter    VID_IN_DATA_WIDTH = 24,
    parameter    REDDEPTH   = 8,
    parameter    GREENDEPTH = 8,
    parameter    BULEDEPTH  = 8,
    parameter    VID_OUT_DATA_WIDTH = REDDEPTH + GREENDEPTH + BULEDEPTH
)(
    //VID_OUT
    input [VID_IN_DATA_WIDTH-1:0]     rgb_data ,
    input                             rgb_vde  ,
    input                             rgb_hsync,
    input                             rgb_vsync,

    input                             pixel_clk,
    input                             vid_rst  ,
    
    //RGB LCD
    output                            lcd_pclk ,
    output                            lcd_rst  ,
    output    reg                     lcd_hs   ,
    output    reg                     lcd_vs   ,
    output    reg                     lcd_de   ,
    output                            lcd_bl   ,
    
    output [VID_OUT_DATA_WIDTH-1:0]   lcd_rgb_o
);

//reg define
reg    [VID_IN_DATA_WIDTH-1:0]   int_pData ;
reg                              rd_id_flag=1'b0;

//wire define
wire   [REDDEPTH-1:0]            lcd_red   ;
wire   [GREENDEPTH-1:0]          lcd_green ;
wire   [BULEDEPTH-1:0]           lcd_blue  ;

//*****************************************************
//**                  main code
//*****************************************************

//LCD 数据赋值
always @(posedge pixel_clk or negedge vid_rst) begin
    if(!vid_rst)
        int_pData <= 0;
    else if (rgb_vde == 1'b1)
       int_pData <= rgb_data;                        
    else
       int_pData <= {VID_IN_DATA_WIDTH{1'b0}};
end

//LCD控制信号赋值
always @(posedge pixel_clk or negedge vid_rst) begin
    if(!vid_rst) begin
        lcd_de <= 1'b0  ;
        lcd_hs <= 1'b0;
        lcd_vs <= 1'b0;    
    end
    else begin                                       
        lcd_de <= rgb_vde  ;
        lcd_hs <= rgb_hsync;
        lcd_vs <= rgb_vsync;
    end
end



assign lcd_pclk = pixel_clk;
assign lcd_rst  = vid_rst;
assign lcd_bl   = 1'b1;
assign lcd_red = int_pData[VID_IN_DATA_WIDTH - 1:VID_IN_DATA_WIDTH - REDDEPTH];
assign lcd_green = int_pData[VID_IN_DATA_WIDTH/3 * 2 - 1:
           VID_IN_DATA_WIDTH/3 * 2 - GREENDEPTH];
assign lcd_blue = int_pData[VID_IN_DATA_WIDTH/3 - 1:VID_IN_DATA_WIDTH/3 - BULEDEPTH];
assign lcd_rgb_o =  {lcd_red,lcd_green,lcd_blue} ;

endmodule
