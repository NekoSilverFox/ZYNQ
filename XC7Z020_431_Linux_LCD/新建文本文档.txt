<p align="center">
 <img width="100px" src="README.assets/silverfox.svg" align="center" alt="ZYNQ" />
 <h1 align="center">ZYNQ</h2>
 <p align="center"><b>Based on XC7Z020clg400-2 Soc</b></p>
</p>

<div align=center>

[![License](https://img.shields.io/badge/license-Apache%202.0-brightgreen)](LICENSE)
![ZYNQ](https://img.shields.io/badge/ZYNQ-ZYNQ--7-orange)
![SoC](https://img.shields.io/badge/SoC-XC7Z020clg400--2-orange)

![Vivado](https://img.shields.io/badge/Vivado-v2016.3%20v2018.3-blue)
![SDK](https://img.shields.io/badge/SDK-v2016.3%20v2018.3-blue.svg)
![Kernel](https://img.shields.io/badge/Kernel-Linux%20v4.14-yellow)

<div align=left>

[toc]

### 用户自定义IP（LCD）屏幕上运行 Linux

任务说明：

本实验使用了用户自定义IP核（LCD屏幕），并在Vivado进行硬件设计之后通过 PetaLinux 工具编译、配置、打包以获得`BOOT.bin` 和 `image.ug` 文件，最终实现开发板运行定制的 Linux 操作系统并驱动LCD屏幕显示。

---

硬件平台：

- Board：Mizar Z7
- SoC：Zynq-7 XC7Z020clg400-2
- LCD：MLCD-43D_R10
- SD：SanDisk 8Gb TF

软件平台：

- Ubuntu 16.04 x64
- Vivado v2018.3
- SDK v2018.3
- PetaLinux v2018.3
- Kernel：Linux-4.14

---

分为以下三大部分：

- Vivado 硬件设计部分（获取 `system.hdf` 硬件描述文件）
- PetaLinux 配置（获取`BOOT.bin` 和 `image.ug` 镜像文件）
- 开发板验证

#### Vivado 设计部分（所需IP的导入及hdf硬件描述文件的获取）

1. 新建 Vivado 工程，这里不再赘述

2. 导入自定义IP核【具体创建的过程稍后补充】

   ![image-20211009225106386](Readme.assets/image-20211009225106386.png)

   可以看到Vivado自动识别了我们创建的IP核

   ![image-20211009225140489](Readme.assets/image-20211009225140489.png)

3. 导入 Zynq7 IP核并配置

   因为我们之后会使用 Flash、网络、USB、SD卡、串口通信；所以按照开发板的原理图，我们将各个端口做以下设置

   ![image-20211009225932217](Readme.assets/image-20211009225932217.png)

   使能 S_AXI_HP0 

   ![image-20211010145726095](Readme.assets/image-20211010145726095.png)

   为了适配 LCD 屏幕，我们将PL的输出频率设置为100

   ![image-20211009230209550](Readme.assets/image-20211009230209550.png)

   点击 Interrupt，使能 PL 到 PS 端的中断输入端口

   ![image-20211010123720693](Readme.assets/image-20211010123720693.png)

   配置完成后，得到如下所示

   ![image-20211010123747456](Readme.assets/image-20211010123747456.png)

4. 导入 VDMA IP

   > 使用 VDMA IP 核来实现对于 AXI4-Stream 类目标外设的高带宽直接存储器存取来读取 DDR 中的数据。VDMA 读取到数据之后通过 AXI4-Stream to Video Out IP 核将数据流转换成视频协议的数据流，之后在将该数据流转换为符合 RGB LCD 接口的时序就可以在 LCD 屏幕上显示了。

   `Frame Buffers` 选项可以选择 AXI VDMA 要处理的帧缓冲存储位置 的数量。由于本次显示实验只显示一张图片，数据只需要写入一次，因此不需要 设置多个帧缓存区域，这里设置为 1。因为本实验是从 DDR3 中读取数据输出给 LCD，所以只需要勾选 Enable Read Channel 就可以了，无需勾选 Enable Write Channel。

   `Memory Map Data Width` 选项可以为 MM2S 通道选择所需的 AXI4 数据宽度。此处保持默认 64 即可

   `Read Burst Size` 用于指定突发读的大小，此处选择 64

   `Stream Data Width` 选 项可以选择 MM2S 通道的 AXI4-Stream 数据宽度。 有效值是 8 的倍数，最大 到 1024。 必须注意的是该值必须小于或等于 Memory Map Data Width。**此处因输出数据格式为 RGB888，设置为 24**

   `Line Buffer Depth` 选项可以选择 MM2S 通道的行缓冲深度（行缓冲区宽度 为 stream data 的大小） ，此处设置 **2048**

   ![image-20211009231134235](Readme.assets/image-20211009231134235.png)

5. 导入 Timing IP核 （视频时序控制器）

   配置如下

   ![image-20211009231634423](Readme.assets/image-20211009231634423.png)

   

6. 导入 video out（视频输出控制器）

   这里我们使用了独立时钟作为输入，所以选择独立时钟

   ![image-20211009231913924](Readme.assets/image-20211009231913924.png)

7. **导入自定义LCD IP**

   `Reddepth`、` Greendepth` 和 `Buledepth` 用于 设置输出的 Red、Green 和 Blue 颜色的位数，这里我们使用 RGB888，所以分别设置为 8、8、8

   `Vid In Data Width` 用于指定输入的 RGB 总线宽度，为 24 位

   `Vid Out Data Width` 用于指定输出的 RGB 总线宽度，为 24 位

   ![image-20211009232019130](Readme.assets/image-20211009232019130.png)

8. 导入dynamic 动态时钟控制器 IP

   ![image-20211009232257512](Readme.assets/image-20211009232257512.png)

9. 因为 Vivado 自动连接会导致错误，所以我们这里手动分配时钟信号如下

   ![image-20211010110833860](Readme.assets/image-20211010110833860.png)

10. 使用 Vivado自动导出 Zynq7 PS IP核 的引脚

    ![image-20211009232953958](Readme.assets/image-20211009232953958.png)

11. 手动引出 自定义 IP 的相关引脚

     ![image-20211009233204932](Readme.assets/image-20211009233204932.png)

12. 让 Vivado 自动帮我们连接相关引脚

     ![image-20211009233302053](Readme.assets/image-20211009233302053.png)

13. 连接完成后部分信号无法自动连接，需手动连接

     ![image-20211009233949787](Readme.assets/image-20211009233949787.png)

14. 得到以下设计

     ![image-20211009235603921](Readme.assets/image-20211009235603921.png)

15. 导入 Concat IP核，以连接中断信号

     连接 VDMA 的 mm2s_introut 中断信号和 Video Timing Controller 的 irq 中断信号到 concat IP 的输入端，连接 Concat 的输出端到 ZYNQ7 Processing System 的中断信号输入端

     ![image-20211010123908833](Readme.assets/image-20211010123908833.png)

16. 最终得到以下设计

     ![image-20211010123953147](Readme.assets/image-20211010123953147.png)

17. 生成顶层 HDL 文件

     ![image-20211010124239589](Readme.assets/image-20211010124239589.png)

     ![image-20211010124415061](Readme.assets/image-20211010124415061.png)

18. 使用了GPIO0，所以我们根据开发板和LCD屏幕的原理图进行引脚约束

     ![image-20211010152529481](Readme.assets/image-20211010152529481.png)

     ```xdc
    set_property IOSTANDARD LVCMOS33 [get_ports lcd_lcd_hs]
    set_property IOSTANDARD LVCMOS33 [get_ports lcd_lcd_vs]
    set_property IOSTANDARD LVCMOS33 [get_ports lcd_lcd_de]
    set_property IOSTANDARD LVCMOS33 [get_ports lcd_lcd_pclk]
    set_property IOSTANDARD LVCMOS33 [get_ports lcd_bl0]
    set_property IOSTANDARD LVCMOS33 [get_ports {lcd_rgb_o[23]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {lcd_rgb_o[22]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {lcd_rgb_o[21]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {lcd_rgb_o[20]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {lcd_rgb_o[19]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {lcd_rgb_o[18]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {lcd_rgb_o[17]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {lcd_rgb_o[16]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {lcd_rgb_o[15]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {lcd_rgb_o[14]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {lcd_rgb_o[13]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {lcd_rgb_o[12]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {lcd_rgb_o[11]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {lcd_rgb_o[10]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {lcd_rgb_o[9]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {lcd_rgb_o[8]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {lcd_rgb_o[7]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {lcd_rgb_o[6]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {lcd_rgb_o[5]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {lcd_rgb_o[4]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {lcd_rgb_o[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {lcd_rgb_o[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {lcd_rgb_o[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {lcd_rgb_o[0]}]
    set_property PACKAGE_PIN V13 [get_ports lcd_lcd_de]
    set_property PACKAGE_PIN U15 [get_ports lcd_lcd_hs]
    set_property PACKAGE_PIN Y14 [get_ports lcd_lcd_pclk]
    set_property PACKAGE_PIN U14 [get_ports lcd_lcd_vs]
    set_property PACKAGE_PIN W14 [get_ports lcd_bl0]
    set_property PACKAGE_PIN W19 [get_ports {lcd_rgb_o[0]}]
    set_property PACKAGE_PIN W18 [get_ports {lcd_rgb_o[1]}]
    set_property PACKAGE_PIN U19 [get_ports {lcd_rgb_o[2]}]
    set_property PACKAGE_PIN U18 [get_ports {lcd_rgb_o[3]}]
    set_property PACKAGE_PIN W16 [get_ports {lcd_rgb_o[4]}]
    set_property PACKAGE_PIN V16 [get_ports {lcd_rgb_o[5]}]
    set_property PACKAGE_PIN W15 [get_ports {lcd_rgb_o[6]}]
    set_property PACKAGE_PIN V15 [get_ports {lcd_rgb_o[7]}]
    set_property PACKAGE_PIN P19 [get_ports {lcd_rgb_o[8]}]
    set_property PACKAGE_PIN W20 [get_ports {lcd_rgb_o[9]}]
    set_property PACKAGE_PIN V20 [get_ports {lcd_rgb_o[10]}]
    set_property PACKAGE_PIN Y19 [get_ports {lcd_rgb_o[11]}]
    set_property PACKAGE_PIN N18 [get_ports {lcd_rgb_o[12]}]
    set_property PACKAGE_PIN Y18 [get_ports {lcd_rgb_o[13]}]
    set_property PACKAGE_PIN Y17 [get_ports {lcd_rgb_o[14]}]
    set_property PACKAGE_PIN Y16 [get_ports {lcd_rgb_o[15]}]
    set_property PACKAGE_PIN U20 [get_ports {lcd_rgb_o[16]}]
    set_property PACKAGE_PIN T20 [get_ports {lcd_rgb_o[17]}]
    set_property PACKAGE_PIN R18 [get_ports {lcd_rgb_o[18]}]
    set_property PACKAGE_PIN T17 [get_ports {lcd_rgb_o[19]}]
    set_property PACKAGE_PIN P20 [get_ports {lcd_rgb_o[20]}]
    set_property PACKAGE_PIN N20 [get_ports {lcd_rgb_o[21]}]
    set_property PACKAGE_PIN P18 [get_ports {lcd_rgb_o[22]}]
    set_property PACKAGE_PIN N17 [get_ports {lcd_rgb_o[23]}]
     ```

     

19. 因为我们使用到了PL端的资源，所以我们需要生成比特流文件

     ![image-20211010124557434](Readme.assets/image-20211010124557434.png)

20. Vivado提示有错误无法生成比特流；经过查看，错误为我们自定义的LCD屏幕IP的端口名称与XDC文件中的不匹配，所以我们进行修改

     ![image-20211010153155356](Readme.assets/image-20211010153155356.png)

     重命名端口：

     ![image-20211010160230998](Readme.assets/image-20211010160230998.png)

21. 重新生成比特流，成功（MLGB，这破bug找了4天）

     ![image-20211010160707600](Readme.assets/image-20211010160707600.png)

22. 导出到硬件

     ![image-20211010160813265](Readme.assets/image-20211010160813265.png)

     ![image-20211010160829451](Readme.assets/image-20211010160829451.png)

23. 启动 SDK

24. 成功得到了我们需要用到的硬件描述文件 `system.hdf`

![image-20211010161042609](Readme.assets/image-20211010161042609.png)

#### 使用 PetaLinux 生成镜像文件

1. 启动 PetaLinux 工具

   ```shell
   source ./petalinux/settings.sh
   ```

   ![image-20211010164546678](Readme.assets/image-20211010164546678.png)

2. 创建工程

   ```shell
   petalinux-create --type project --template zynq --name petalinux_431_lab
   ```

   ![image-20211010165016952](Readme.assets/image-20211010165016952.png)

3. 进入工程，并使用 WinSCP 工具将我们获取的硬件描述文件导入当前工程目录

   ![image-20211010165407007](Readme.assets/image-20211010165407007.png)

4. 配置工程

   ```shell
   petalinux_config –get-hw-description=.
   ```

   ![image-20211010165737218](Readme.assets/image-20211010165737218.png)

5. 将内核修为本地内核

   <img src="Readme.assets/image-20211010165920849.png" alt="image-20211010165920849" style="zoom: 67%;" />

   <img src="Readme.assets/image-20211010165942933.png" alt="image-20211010165942933" style="zoom:67%;" />

   <img src="Readme.assets/image-20211010165959354.png" alt="image-20211010165959354" style="zoom: 67%;" />

   <img src="Readme.assets/image-20211010170015695.png" alt="image-20211010170015695" style="zoom:67%;" />

   <img src="Readme.assets/image-20211010170122684.png" alt="image-20211010170122684" style="zoom:67%;" />

   之后保存退出

   <img src="Readme.assets/image-20211010170541568.png" alt="image-20211010170541568" style="zoom:67%;" />

6. 配置内核

   ```shell
   petalinux-config –c kernel
   ```

   ![image-20211010170940753](Readme.assets/image-20211010170940753.png)

   ![image-20211010171010359](Readme.assets/image-20211010171010359.png)

   ![image-20211010171113245](Readme.assets/image-20211010171113245.png)

   保存退出

   ![image-20211010171450314](Readme.assets/image-20211010171450314.png)

7. 添加（修改）设备树

   ```shell
   vim project-spec/meta-user/recipes-bsp/device-tree/files/system-user.dtsi
   ```

   ```c
   /include/ "system-conf.dtsi"
   
   #define GPIO_ACTIVE_HIGH 0
   #define GPIO_ACTIVE_LOW  1
   
   / {  
       model = "Mizar Development Board"; 
       compatible = "microphase,zynq-7010","xlnx,zynq-7000"; 
   
   	usb_phy0:usb_phy@0{
   		compatible = "ulpi-phy";
   		#phy-cells = <0>;
   		reg = <0xe0002000 0x1000>;
   		view-port = <0x170>;
   		drv-vbus;
   	};
   
       video_timings {
               timing_4x3_480x272: timing0 {
                   clock-frequency = <9000000>;
                   hactive = <480>;
                   vactive = <272>;
       
                   hback-porch = <40>;
                   hsync-len = <20>;
                   hfront-porch = <5>;
                   vback-porch = <8>;
                   vsync-len = <3>;
                   vfront-porch = <8>;
       
                   hsync-active = <0>;
                   vsync-active = <0>;
                   de-active = <1>;
                   pixelclk-active = <0>;
               };
   
               timing_1920x1080: timing1 {
                       clock-frequency = <148500000>;
                       hactive = <1920>;
                       vactive = <1080>;
   
                       hback-porch = <148>;
                       hsync-len = <44>;
                       hfront-porch = <88>;
                       vback-porch = <36>;
                       vsync-len = <5>;
                       vfront-porch = <4>;
   
                       hsync-active = <0>;
                       vsync-active = <0>;
                       de-active = <1>;
                       pixelclk-active = <1>;
               };
       };       
   };
   
   &usb0{
   	dr_mode = "host";
   	usb-phy = <&usb_phy0>;
   };
   &axi_dynclk_0 {
       compatible = "digilent,axi-dynclk";
       clocks = <&clkc 15>;
       #clock-cells = <0>;
   };
   
   &v_tc_0 {
       compatible = "xlnx,v-tc-5.01.a";
   };
   
   &amba_pl {
       xlnx_vdma_lcd {
           compatible = "xilinx,vdmafb";
           status = "okay";
   
           xlnx,vtc = <&v_tc_0>;
           clocks = <&axi_dynclk_0>;
           clock-names = "lcd_pclk";
           dmas = <&axi_vdma_0 0>;
           dma-names = "lcd_vdma";
   
           is-hdmi = <0x0>;
   	
   	rst-gpios = <&gpio0 62 GPIO_ACTIVE_LOW>;
   	bl-gpios = <&gpio0 61 GPIO_ACTIVE_HIGH>;
   
   
           display-timings = <&timing_4x3_480x272>;
           xlnx,pixel-format = "rgb888";
       };
   };
   
   ```

8. 编译工程

   ```shell
   petalinux-build
   ```

   ![image-20211010173343823](Readme.assets/image-20211010173343823.png)

9. 打包工程，以生成 `BOOT.bin` 和 `image.ub`

   ```shell
   petalinux-package --boot --fsbl ./images/linux/zynq_fsbl.elf --fpga --u-boot --force
   ```

   ![image-20211010175359984](Readme.assets/image-20211010175359984.png)

10. 将时候生成的 `BOOT.bin` 和 `image.ub` 拷贝到 SD（TF）卡

    ```shell
    su -l
    fdisk -l
    mount /dev/sdb1 /mnt/zynq/boot
    cd /home/fox/ZYNQ/lab/petalinux_431_lab/images/linux
    cp BOOT.bin image.ub /mnt/zynq/boot/
    umount /mnt/zynq/boot
    ```

#### 开发板验证

1. 将含有镜像的SD卡插入卡槽

2. 将开发板通过 JTAG 和 UART 接口连接电脑

3. 将网线插入到开发板

4. 将拨码开关切换到SD卡启动

5. 将USB的跳线帽插入（供电）

6. 将LCD显示屏插入到开发板 GPIO1 接口

7. 连接电源

   ![image-20211010181248442](Readme.assets/image-20211010181248442.png)

8. 启动端口通信工具并连接开发板

9. 启动开发板电源

10. 可以看到Linux系统成功启动，并且通过串口打印出了启动信息

    ![image-20211010213315977](Readme.assets/image-20211010213315977.png)

    ![image-20211010213245666](Readme.assets/image-20211010213245666.png)

11. 屏幕也成功显示

    ![image-20211010221012328](Readme.assets/image-20211010221012328.png)

12. 此时我们把键盘插入 USB 口，可以看到终端上打印出了识别成功的信息

    <img src="Readme.assets/image-20211010221213083.png" alt="image-20211010221213083" style="zoom: 33%;" />

    ![image-20211010213800330](Readme.assets/image-20211010213800330.png)

13. 键盘可以通过 USB 正常输入内容，并且网络也可以正常连接

    ![image-20211010221244498](Readme.assets/image-20211010221244498.png)

实验结束，取得成功

