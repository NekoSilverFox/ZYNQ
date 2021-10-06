# ZYNQ

[toc]



## FPGA

---待补充---

## 嵌入式设计SDK

---待补充---

## PetaLinux

### 从SD启动Linux

实验说明：从 SD 卡中启动 Linux，只使用 PS 端

实验顺序：

#### 硬件设计及获取 .hdf 文件

1. 在 Vivado 创建工程，关闭不需要的端口，并且将 SD卡、JTAG、网口打开

   只有打开了网口，之后才能进行网络连接和通信！

   ![image-20211003170956367](README.assets/image-20211003170956367.png)

2. 为了获取更快的速度，**在 MIO Configuration 菜单中将 SD 卡和网口的所有端口的速度设置为 `fast`**

3. 修改内存及 Bank1 的电压

4. 得到以下

   ![image-20211003171238770](README.assets/image-20211003171238770.png)

5. 导出顶层 HDL，及硬件

6. 启动 SDK

   **注意：启动 SDK 的目的是为了获取到 system.hdf 这一硬件描述文件，是为了之后使用 petalinux 创建工程而使用**

7. 在 工程下的 SDK 文件夹中，得到 `.hdf` 文件，并将其拷贝到 Linux 环境下



#### 使用 PetaLinux 创建引导

1. 新建 PetaLinux 工程

   ```bash
   petalinux-create --type project --template zynq --name 【想创建的工程的名字】
   ```



2. **进入工程目录**，将之前在 SDK 中获取到的 `system.hdf` 硬件描述文件拷贝至工程根目录

   `system.hdf` 用其配置工程

   ```bash
   petalinux-config --get-hw-description=.			# 最后的 `.` 代表 .hdf 文件在当前工程目录下
   
   # 技巧：获取这个命令可以通过使用 patelinux-config --help
   # 如果 hdf 文件在其他目录，或者使用了整个 sdk 文件夹，可以使用
   petalinux-config --get-hw-description 【sdk文件夹目录】
   # 进行配置导入
   ```

   此工程将直接使用默认配置，所以直接退出配置界面即可

   

3. 编译工程

   ```bash
   petalinux_build
   ```

   命令执行完会生成 `image` 文件夹，里面包含了 U-BOOT 等之后我们需要用到的文件

   - 需要用到的文件：u-boot.elf 、zynq_fsbl.elf 、image.ub，他们会用来生成 BOOT.bin 

   - **zynq_fsbl.elf**

     当嵌入式系统启动时， ARM 将执行 PS 域上 ROM 中的程序，将非易失性存储如 Flash， SD卡上的 first stage boot loader 文件加载到 DDR 并执行，first stage boot loader 主要完成以下功能

     1. 使用FPGA 比特流文件配置FPGA（如果存在比特流，本例没有）
     2. 配置PS 域的MIO 端口
     3. 初始化DDR 控制器
     4. 初始化系统时钟， PLL
     5. 将 u-boot 从非易失存储如 Flash， SD 卡等load 到DDR 中

   - **u-boot.elf**

     嵌入式系统通用 Boot 文件，负责将 image.ub 从非易失存储如 Flash，SD 卡等 load 到DDR 中

   - **image.ub**

     PetaLinux，包括内核镜像、ramdisk、设备树dtb

     

4. 格式化 U盘，并设置分区

   ```bash
   # 切换为管理员
   su
   
   # 查看系统磁盘设备信息，并找到待U盘的目录(Linux系统中所有设备均被视为文件)
   fdisk -l		# 示例中为 /dev/sdb1
   
   # 注意：进行下面的操作时必须取消挂载
   # 开始使用 fdisk 进行和分区
   fdisk /dev/sdb
   > p				# 查看分区
   > d				# 删除分区
   > p				# 查看是否删除成功
   > n				# 增加主分区
   > p				# 设置为主分区
   > 一直默认回车，如果是想增加特定大小（比如增加100M），就在第2个提示处使用 +100M
   > t				# 改变分区类型
   > c				# 设置为W95 FAT32 (LBA)，如果是Linux分区就输入83
   >q				# 退出
   
   # 格式化
   # 注意：mkfs 后面不是固定的！要根据分区类型而改变！！！
   mkfs.vfat -F 32 -n boot /dev/sdb1	# 格式化 FAT32 类型的分区，并设置为 boot
   mkfs.ext4 -L rootfs -n /dev/sdb2	# 格式化 ext4 类型的分区，并设置为 rootfs
   ```

   

5. 制作 BOOT.bin

   1. 【使用 Windows 制作】复制文件到 windows 下，准备制作 BOOT.bin 

      需要用到的文件：u-boot.elf 、zynq_fsbl.elf 、image.ub，他们会用来生成 BOOT.bin 

      为了方便管理，在 vivado 工程目录下新建一个 images 文件夹，并把上述的 3 个文件拷贝进去

      下面开始制作 Boot.bin 文件

      - 选择 Create Boot Image

      ![image-20211003191020377](README.assets/image-20211003191020377.png)

      - 选择输出路径

      - 建议使用刚刚创建的 images文件夹

        ![image-20211003191134847](README.assets/image-20211003191134847.png)

      - 添加 bootloader，也就是 zynq_fsbl.elf
      
        ![image-20211003191621023](README.assets/image-20211003191621023.png)
      
      - 添加 datafile，也就是 u-boot.elf
      
        ![image-20211003191733800](README.assets/image-20211003191733800.png)
      
      - 点击 Create Image 打包生成 BOOT.bin 文件
      
        
      
   2. **【使用 Ubuntu 制作】使用 PeataLinux 打包**

      ```bash
      # 用到了哪些参数，才写哪些参数
      patalinux-package --boot --fsbl --fpga --u-boot --force
      ```

      

6. 将 Boot.bin 和 image.ub 拷贝至 SD 卡中

7. 开发板设置为 SD 模式，启动

8. 使用 MobaXterm 进行连接，当然用 Putty 也可以。

   **默认的登录名和密码都是 root**

   成功启动并登录：

   ![image-20211003193649748](README.assets/image-20211003193649748.png)

#### 驱动 USB 外设

1. 根据开发板原理图，开启 USB 对应的端口，**并打开 GPIO MIO，设置 USB 的 Reset 端口！**

   可以根据选择，将 USB 的速度设置为 fast

   ![image-20211006183812519](README.assets/image-20211006183812519.png)

   ![image-20211006183527601](README.assets/image-20211006183527601.png)

2. 其他地方同上一实验保持一致，导出硬件设计，打开SDK，得到 `.hdf` 硬件描述文件

3. 使用 PetaLinux 创建并配置工程，这两步同样保持默认配置

4. 配置 USB

   1. 为了支持USB 外设，这里要配置Kernel ，从Xilinx 官方Wiki http://www.wiki.xilinx.com/Zynq+Linux+USB+Device+Driver 可知，USB 设备有三种配置， 即HOST 模式，Peripheral 模式和OTG 模式，各模式的配置如下：

      - HOST 模式

        ![image-20211006184512112](README.assets/image-20211006184512112.png)

      - Peripheral Mode

        ![image-20211006184519835](README.assets/image-20211006184519835.png)

      - OTG

        ![image-20211006184552616](README.assets/image-20211006184552616.png)

      使用以下命令入**kernal 配置界面：**

      ```bash
      petalinux-config –c kernal
      ```

      按需要，将 USB 配置成所需的模式，保存退出

5. **修改设备树**

   **为支持 USB 设备的使用**，我们需要在设备树文件中添加关于USB 的相关内容， 打开目录`~工作目录/project-spec/meta-user/recipes-bsp/device-tree/files` 下的 **`system-user.dtsi`** 文件，并在其中添加以下内容并保存。

   ![image-20211006213101546](README.assets/image-20211006213101546.png)

6. 编译工程，得到 zynq_fsbl.elf， u-boot.elf 和image.ub

   ```bash
   petalinux-build
   ```

7. 打包（参考上个任务）

8. 开发板验证



   



