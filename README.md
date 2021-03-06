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



## FPGA

---待补充---

## 嵌入式设计SDK

### 自定义 IP 核

#### IP 核的封装

1. 打开 Vavido

   ![image-20211014140843825](README.assets/image-20211014140843825.png)

   ![image-20211013201256403](README.assets/image-20211013201256403.png)

   ![image-20211013201318475](README.assets/image-20211013201318475.png)

   因为我们要使用 AXI 总线，所以选择 `Create a new AXI4 peripheral`

   ![image-20211013201431497](README.assets/image-20211013201431497.png)

   修改名称

   ![image-20211013201548976](README.assets/image-20211013201548976.png)

   

   因为我们使用到了 AXI 总线，所以要对AXI总线做一定的设置

   ![image-20211013201710835](README.assets/image-20211013201710835.png)

   

   将IP添加到存储库中

   ![image-20211013201731304](README.assets/image-20211013201731304.png)

   

   可以看到我们创建的 IP 已经被添加到IP库中了

   ![image-20211013201811428](README.assets/image-20211013201811428.png)

   

2. 编辑 IP 核

   右键 IP 核，选择以下。会打开一个新的界面

   ![image-20211013201849404](README.assets/image-20211013201849404.png)

   打开并添加端口

   ![image-20211014141814750](README.assets/image-20211014141814750.png)

   ```hdl
   `timescale 1ns / 1ps
   
   module pwm_ip(
       input sys_clk ,
       input sys_rst_n , 
       input [9:0] set_freq_step , 
       output pwm 
   );
    //*****************************************************
    //** main code
    //*****************************************************
    //reg define
   reg [15:0] period_cnt ; 
   reg [15:0] duty_cycle ; 
   reg inc_flag ; 
   //wire define
   wire led_t ;
   
   assign led_t = ( period_cnt <= duty_cycle ) ? 1'b1 : 1'b0 ;
   assign pwm = led_t;
   always @ (posedge sys_clk) begin
       if (!sys_rst_n)
           period_cnt <= 16'd0;
       else if( period_cnt == 16'd50_0000 )
           period_cnt <= 16'd0;
       else
           period_cnt <= period_cnt + 16'd1;
       end
   always @(posedge sys_clk) begin
       if (sys_rst_n == 1'b0) begin
           duty_cycle <= 16'd0;
           inc_flag <= 1'b0;
       end
       else if( period_cnt == 16'd50_0000 ) begin
           if( inc_flag ) begin 
               if( duty_cycle == 16'd0 )
                   inc_flag <= 1'b0;
               else if(duty_cycle < 10'd100)
                   duty_cycle <= 16'd0;
           else
               duty_cycle <= duty_cycle - set_freq_step;
           end
       else begin 
           if( duty_cycle >= 16'd50_0000 )
               inc_flag <= 1'b1;
           else
               duty_cycle <= duty_cycle + set_freq_step;
           end
       end
       else 
           duty_cycle <= duty_cycle ;
       end
    endmodule
   
   ```

   

   ![image-20211013202036243](README.assets/image-20211013202036243.png)

   ```vhdl
   `timescale 1 ns / 1 ps
   
   	module pwm_ip_v1_0_S00_AXI #
   	(
   		// Users to add parameters here
           
   		// User parameters ends
   		// Do not modify the parameters beyond this line
   
   		// Width of S_AXI data bus
   		parameter integer C_S_AXI_DATA_WIDTH	= 32,
   		// Width of S_AXI address bus
   		parameter integer C_S_AXI_ADDR_WIDTH	= 4
   	)
   	(
   		// Users to add ports here
           output pwm,
   		// User ports ends
   		// Do not modify the ports beyond this line
   
   		// Global Clock Signal
   		input wire  S_AXI_ACLK,
   		// Global Reset Signal. This Signal is Active LOW
   		input wire  S_AXI_ARESETN,
   		// Write address (issued by master, acceped by Slave)
   		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
   		// Write channel Protection type. This signal indicates the
       		// privilege and security level of the transaction, and whether
       		// the transaction is a data access or an instruction access.
   		input wire [2 : 0] S_AXI_AWPROT,
   		// Write address valid. This signal indicates that the master signaling
       		// valid write address and control information.
   		input wire  S_AXI_AWVALID,
   		// Write address ready. This signal indicates that the slave is ready
       		// to accept an address and associated control signals.
   		output wire  S_AXI_AWREADY,
   		// Write data (issued by master, acceped by Slave) 
   		input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
   		// Write strobes. This signal indicates which byte lanes hold
       		// valid data. There is one write strobe bit for each eight
       		// bits of the write data bus.    
   		input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
   		// Write valid. This signal indicates that valid write
       		// data and strobes are available.
   		input wire  S_AXI_WVALID,
   		// Write ready. This signal indicates that the slave
       		// can accept the write data.
   		output wire  S_AXI_WREADY,
   		// Write response. This signal indicates the status
       		// of the write transaction.
   		output wire [1 : 0] S_AXI_BRESP,
   		// Write response valid. This signal indicates that the channel
       		// is signaling a valid write response.
   		output wire  S_AXI_BVALID,
   		// Response ready. This signal indicates that the master
       		// can accept a write response.
   		input wire  S_AXI_BREADY,
   		// Read address (issued by master, acceped by Slave)
   		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
   		// Protection type. This signal indicates the privilege
       		// and security level of the transaction, and whether the
       		// transaction is a data access or an instruction access.
   		input wire [2 : 0] S_AXI_ARPROT,
   		// Read address valid. This signal indicates that the channel
       		// is signaling valid read address and control information.
   		input wire  S_AXI_ARVALID,
   		// Read address ready. This signal indicates that the slave is
       		// ready to accept an address and associated control signals.
   		output wire  S_AXI_ARREADY,
   		// Read data (issued by slave)
   		output wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,
   		// Read response. This signal indicates the status of the
       		// read transfer.
   		output wire [1 : 0] S_AXI_RRESP,
   		// Read valid. This signal indicates that the channel is
       		// signaling the required read data.
   		output wire  S_AXI_RVALID,
   		// Read ready. This signal indicates that the master can
       		// accept the read data and response information.
   		input wire  S_AXI_RREADY
   	);
   
   	// AXI4LITE signals
   	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
   	reg  	axi_awready;
   	reg  	axi_wready;
   	reg [1 : 0] 	axi_bresp;
   	reg  	axi_bvalid;
   	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
   	reg  	axi_arready;
   	reg [C_S_AXI_DATA_WIDTH-1 : 0] 	axi_rdata;
   	reg [1 : 0] 	axi_rresp;
   	reg  	axi_rvalid;
   
   	// Example-specific design signals
   	// local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
   	// ADDR_LSB is used for addressing 32/64 bit registers/memories
   	// ADDR_LSB = 2 for 32 bits (n downto 2)
   	// ADDR_LSB = 3 for 64 bits (n downto 3)
   	localparam integer ADDR_LSB = (C_S_AXI_DATA_WIDTH/32) + 1;
   	localparam integer OPT_MEM_ADDR_BITS = 1;
   	//----------------------------------------------
   	//-- Signals for user logic register space example
   	//------------------------------------------------
   	//-- Number of Slave Registers 4
   	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg0;
   	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg1;
   	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg2;
   	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg3;
   	wire	 slv_reg_rden;
   	wire	 slv_reg_wren;
   	reg [C_S_AXI_DATA_WIDTH-1:0]	 reg_data_out;
   	integer	 byte_index;
   	reg	 aw_en;
   
   	// I/O Connections assignments
   
   	assign S_AXI_AWREADY	= axi_awready;
   	assign S_AXI_WREADY	= axi_wready;
   	assign S_AXI_BRESP	= axi_bresp;
   	assign S_AXI_BVALID	= axi_bvalid;
   	assign S_AXI_ARREADY	= axi_arready;
   	assign S_AXI_RDATA	= axi_rdata;
   	assign S_AXI_RRESP	= axi_rresp;
   	assign S_AXI_RVALID	= axi_rvalid;
   	// Implement axi_awready generation
   	// axi_awready is asserted for one S_AXI_ACLK clock cycle when both
   	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
   	// de-asserted when reset is low.
   
   	always @( posedge S_AXI_ACLK )
   	begin
   	  if ( S_AXI_ARESETN == 1'b0 )
   	    begin
   	      axi_awready <= 1'b0;
   	      aw_en <= 1'b1;
   	    end 
   	  else
   	    begin    
   	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en)
   	        begin
   	          // slave is ready to accept write address when 
   	          // there is a valid write address and write data
   	          // on the write address and data bus. This design 
   	          // expects no outstanding transactions. 
   	          axi_awready <= 1'b1;
   	          aw_en <= 1'b0;
   	        end
   	        else if (S_AXI_BREADY && axi_bvalid)
   	            begin
   	              aw_en <= 1'b1;
   	              axi_awready <= 1'b0;
   	            end
   	      else           
   	        begin
   	          axi_awready <= 1'b0;
   	        end
   	    end 
   	end       
   
   	// Implement axi_awaddr latching
   	// This process is used to latch the address when both 
   	// S_AXI_AWVALID and S_AXI_WVALID are valid. 
   
   	always @( posedge S_AXI_ACLK )
   	begin
   	  if ( S_AXI_ARESETN == 1'b0 )
   	    begin
   	      axi_awaddr <= 0;
   	    end 
   	  else
   	    begin    
   	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en)
   	        begin
   	          // Write Address latching 
   	          axi_awaddr <= S_AXI_AWADDR;
   	        end
   	    end 
   	end       
   
   	// Implement axi_wready generation
   	// axi_wready is asserted for one S_AXI_ACLK clock cycle when both
   	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
   	// de-asserted when reset is low. 
   
   	always @( posedge S_AXI_ACLK )
   	begin
   	  if ( S_AXI_ARESETN == 1'b0 )
   	    begin
   	      axi_wready <= 1'b0;
   	    end 
   	  else
   	    begin    
   	      if (~axi_wready && S_AXI_WVALID && S_AXI_AWVALID && aw_en )
   	        begin
   	          // slave is ready to accept write data when 
   	          // there is a valid write address and write data
   	          // on the write address and data bus. This design 
   	          // expects no outstanding transactions. 
   	          axi_wready <= 1'b1;
   	        end
   	      else
   	        begin
   	          axi_wready <= 1'b0;
   	        end
   	    end 
   	end       
   
   	// Implement memory mapped register select and write logic generation
   	// The write data is accepted and written to memory mapped registers when
   	// axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
   	// select byte enables of slave registers while writing.
   	// These registers are cleared when reset (active low) is applied.
   	// Slave register write enable is asserted when valid address and data are available
   	// and the slave is ready to accept the write address and write data.
   	assign slv_reg_wren = axi_wready && S_AXI_WVALID && axi_awready && S_AXI_AWVALID;
   
   	always @( posedge S_AXI_ACLK )
   	begin
   	  if ( S_AXI_ARESETN == 1'b0 )
   	    begin
   	      slv_reg0 <= 0;
   	      slv_reg1 <= 0;
   	      slv_reg2 <= 0;
   	      slv_reg3 <= 0;
   	    end 
   	  else begin
   	    if (slv_reg_wren)
   	      begin
   	        case ( axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
   	          2'h0:
   	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
   	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
   	                // Respective byte enables are asserted as per write strobes 
   	                // Slave register 0
   	                slv_reg0[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
   	              end  
   	          2'h1:
   	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
   	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
   	                // Respective byte enables are asserted as per write strobes 
   	                // Slave register 1
   	                slv_reg1[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
   	              end  
   	          2'h2:
   	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
   	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
   	                // Respective byte enables are asserted as per write strobes 
   	                // Slave register 2
   	                slv_reg2[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
   	              end  
   	          2'h3:
   	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
   	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
   	                // Respective byte enables are asserted as per write strobes 
   	                // Slave register 3
   	                slv_reg3[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
   	              end  
   	          default : begin
   	                      slv_reg0 <= slv_reg0;
   	                      slv_reg1 <= slv_reg1;
   	                      slv_reg2 <= slv_reg2;
   	                      slv_reg3 <= slv_reg3;
   	                    end
   	        endcase
   	      end
   	  end
   	end    
   
   	// Implement write response logic generation
   	// The write response and response valid signals are asserted by the slave 
   	// when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
   	// This marks the acceptance of address and indicates the status of 
   	// write transaction.
   
   	always @( posedge S_AXI_ACLK )
   	begin
   	  if ( S_AXI_ARESETN == 1'b0 )
   	    begin
   	      axi_bvalid  <= 0;
   	      axi_bresp   <= 2'b0;
   	    end 
   	  else
   	    begin    
   	      if (axi_awready && S_AXI_AWVALID && ~axi_bvalid && axi_wready && S_AXI_WVALID)
   	        begin
   	          // indicates a valid write response is available
   	          axi_bvalid <= 1'b1;
   	          axi_bresp  <= 2'b0; // 'OKAY' response 
   	        end                   // work error responses in future
   	      else
   	        begin
   	          if (S_AXI_BREADY && axi_bvalid) 
   	            //check if bready is asserted while bvalid is high) 
   	            //(there is a possibility that bready is always asserted high)   
   	            begin
   	              axi_bvalid <= 1'b0; 
   	            end  
   	        end
   	    end
   	end   
   
   	// Implement axi_arready generation
   	// axi_arready is asserted for one S_AXI_ACLK clock cycle when
   	// S_AXI_ARVALID is asserted. axi_awready is 
   	// de-asserted when reset (active low) is asserted. 
   	// The read address is also latched when S_AXI_ARVALID is 
   	// asserted. axi_araddr is reset to zero on reset assertion.
   
   	always @( posedge S_AXI_ACLK )
   	begin
   	  if ( S_AXI_ARESETN == 1'b0 )
   	    begin
   	      axi_arready <= 1'b0;
   	      axi_araddr  <= 32'b0;
   	    end 
   	  else
   	    begin    
   	      if (~axi_arready && S_AXI_ARVALID)
   	        begin
   	          // indicates that the slave has acceped the valid read address
   	          axi_arready <= 1'b1;
   	          // Read address latching
   	          axi_araddr  <= S_AXI_ARADDR;
   	        end
   	      else
   	        begin
   	          axi_arready <= 1'b0;
   	        end
   	    end 
   	end       
   
   	// Implement axi_arvalid generation
   	// axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
   	// S_AXI_ARVALID and axi_arready are asserted. The slave registers 
   	// data are available on the axi_rdata bus at this instance. The 
   	// assertion of axi_rvalid marks the validity of read data on the 
   	// bus and axi_rresp indicates the status of read transaction.axi_rvalid 
   	// is deasserted on reset (active low). axi_rresp and axi_rdata are 
   	// cleared to zero on reset (active low).  
   	always @( posedge S_AXI_ACLK )
   	begin
   	  if ( S_AXI_ARESETN == 1'b0 )
   	    begin
   	      axi_rvalid <= 0;
   	      axi_rresp  <= 0;
   	    end 
   	  else
   	    begin    
   	      if (axi_arready && S_AXI_ARVALID && ~axi_rvalid)
   	        begin
   	          // Valid read data is available at the read data bus
   	          axi_rvalid <= 1'b1;
   	          axi_rresp  <= 2'b0; // 'OKAY' response
   	        end   
   	      else if (axi_rvalid && S_AXI_RREADY)
   	        begin
   	          // Read data is accepted by the master
   	          axi_rvalid <= 1'b0;
   	        end                
   	    end
   	end    
   
   	// Implement memory mapped register select and read logic generation
   	// Slave register read enable is asserted when valid address is available
   	// and the slave is ready to accept the read address.
   	assign slv_reg_rden = axi_arready & S_AXI_ARVALID & ~axi_rvalid;
   	always @(*)
   	begin
   	      // Address decoding for reading registers
   	      case ( axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
   	        2'h0   : reg_data_out <= slv_reg0;
   	        2'h1   : reg_data_out <= slv_reg1;
   	        2'h2   : reg_data_out <= slv_reg2;
   	        2'h3   : reg_data_out <= slv_reg3;
   	        default : reg_data_out <= 0;
   	      endcase
   	end
   
   	// Output register or memory read data
   	always @( posedge S_AXI_ACLK )
   	begin
   	  if ( S_AXI_ARESETN == 1'b0 )
   	    begin
   	      axi_rdata  <= 0;
   	    end 
   	  else
   	    begin    
   	      // When there is a valid read address (S_AXI_ARVALID) with 
   	      // acceptance of read address by the slave (axi_arready), 
   	      // output the read dada 
   	      if (slv_reg_rden)
   	        begin
   	          axi_rdata <= reg_data_out;     // register read data
   	        end   
   	    end
   	end    
   
   	// Add user logic here
       pwm_ip u_pwm_ip(
           .sys_clk (S_AXI_ACLK),
           .sys_rst_n (S_AXI_ARESETN),
           .set_freq_step (slv_reg1[9:0]),
           .pwm (pwm)
       );
   	// User logic ends
   
   	endmodule
   
   ```

   ![image-20211014142113489](README.assets/image-20211014142113489.png)

   ![image-20211013202844701](README.assets/image-20211013202844701.png)

   ![image-20211014142239012](README.assets/image-20211014142239012.png)

   ![image-20211014142247346](README.assets/image-20211014142247346.png)

   编辑此文件

   ![image-20211013202917671](README.assets/image-20211013202917671.png)

   添加以下代码

   ```hdl
   
   module pwm_ip(
       input sys_clk ,
       input sys_rst_n , 
       input [9:0] set_freq_step , 
       output pwm 
   );
    //*****************************************************
    //** main code
    //*****************************************************
    //reg define
   reg [15:0] period_cnt ; 
   reg [15:0] duty_cycle ; 
   reg inc_flag ; 
   //wire define
   wire led_t ;
   
   assign led_t = ( period_cnt <= duty_cycle ) ? 1'b1 : 1'b0 ;
   assign pwm = led_t;
   always @ (posedge sys_clk) begin
       if (!sys_rst_n)
           period_cnt <= 16'd0;
       else if( period_cnt == 16'd50_0000 )
           period_cnt <= 16'd0;
       else
           period_cnt <= period_cnt + 16'd1;
       end
   always @(posedge sys_clk) begin
       if (sys_rst_n == 1'b0) begin
           duty_cycle <= 16'd0;
           inc_flag <= 1'b0;
       end
       else if( period_cnt == 16'd50_0000 ) begin
           if( inc_flag ) begin 
               if( duty_cycle == 16'd0 )
                   inc_flag <= 1'b0;
               else if(duty_cycle < 10'd100)
                   duty_cycle <= 16'd0;
           else
               duty_cycle <= duty_cycle - set_freq_step;
           end
       else begin 
           if( duty_cycle >= 16'd50_0000 )
               inc_flag <= 1'b1;
           else
               duty_cycle <= duty_cycle + set_freq_step;
           end
       end
       else 
           duty_cycle <= duty_cycle ;
       end
    endmodule
   
   ```

   

3. 进行仿真

   ![image-20211013203146604](README.assets/image-20211013203146604.png)

   

   

4. 点击以下文件

   修改支持器件类型

   ![image-20211013203612218](README.assets/image-20211013203612218.png)

   ![image-20211013203636065](README.assets/image-20211013203636065.png)

   点击

   ![image-20211013203651088](README.assets/image-20211013203651088.png)

   ![image-20211013203732421](README.assets/image-20211013203732421.png)

   ![image-20211014142503399](README.assets/image-20211014142503399.png)

   ![image-20211013203809387](README.assets/image-20211013203809387.png)

   ![image-20211014142600124](README.assets/image-20211014142600124.png)

   

#### 系统硬件的设计

1. 新建工程

2. 添加自定义IP

   ![image-20211014142814278](README.assets/image-20211014142814278.png)

   ![image-20211014142910914](README.assets/image-20211014142910914.png)

3. 之后在Diagram 界面添加ZYNQ7 Processing System 处理系统IP，双击IP 进入配置页面。如之前实验配置UART 和DDR3 控制器，其他保持默认，点击“OK”完成配置。配置完成后，点击“Run Block Automation”，如下图所示：

   ![image-20211014144415257](README.assets/image-20211014144415257.png)

4. 添加自定义 IP 核

   ![image-20211014144456804](README.assets/image-20211014144456804.png)

5. 使用自动连接

   ![image-20211014145011230](README.assets/image-20211014145011230.png)

6. 将pwm的引脚引出

   ![image-20211014145041640](README.assets/image-20211014145041640.png)

7. 将引脚名修改为 pwm

   ![image-20211014145123219](README.assets/image-20211014145123219.png)

8. 根据原理图，添加引脚约束

   ![image-20211014153806971](README.assets/image-20211014153806971.png)

   ![image-20211014153744643](README.assets/image-20211014153744643.png)

   ![image-20211014153844983](README.assets/image-20211014153844983.png)

9. 导出至硬件，并启动SDK

#### SDK 设计部分

1. 新建工程，并创建文件

   ![image-20211014154622724](README.assets/image-20211014154622724.png)

   

2. 







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
   petalinux-build
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

### 使用自定义 IP 核（基于SDK部分实验之自定义LED IP核）

#### Vivado设计部分

1. 创建工程

2. 导入自定义ip

   ![image-20211014162741778](README.assets/image-20211014162741778.png)

3. 配置PS，并设置所有引脚为fast

   ![image-20211014200445027](README.assets/image-20211014200445027.png)

4. 自动导出引脚

   ![image-20211014163646718](README.assets/image-20211014163646718.png)

   ![image-20211014163659515](README.assets/image-20211014163659515.png)

5. 添加自定义IP核

   ![image-20211014163736067](README.assets/image-20211014163736067.png)

6. 自动连接

   ![image-20211014163756806](README.assets/image-20211014163756806.png)

7. 导出自定义IP核引脚，并命名为 pwm

   ![image-20211014163851010](README.assets/image-20211014163851010.png)

8. 导出HDL顶层设计

9. 分配引脚

   ![image-20211014164018068](README.assets/image-20211014164018068.png)

   我们使用 PL_LED_1，根据原理图，分配引脚如下

   ![image-20211014164448133](README.assets/image-20211014164448133.png)

10. 生成比特流

    ![image-20211014164535546](README.assets/image-20211014164535546.png)

11. 导出至硬件，打开SDK，获得 `system.hdf` 硬件描述文件

#### PetaLinux 部分

1. 创建项目

   ```shell
   petalinux-create --type project --template zynq --name petalinux_422_custom_ip
   ```

   

2. 导入 `system.hdf` 硬件描述文件，并配置。

   ```shell
   petlinux-config --get-hw-description=.
   ```

   打开界面后无需配置，直接保存退出

3. 配置内核

   ```shell
   petalinux-config –c kernel
   ```

   无需修改任何东西，直接应用当前配置并保存退出，等待编译结束

4. 编译工程

   ```shell
   petalinux-build
   ```

5. 打包工程

   ```shell
   petalinux-package --boot --fsbl ./images/linux/zynq_fsbl.elf --fpga --u-boot --force
   ```

6. 将生成的 `BOOT.bin` 和 `image.ug`拷贝至 SD 卡

#### 开发板验证

1. SD插到开发板
2. 开发板调整至SD模式
3. 串口连接电脑，打开Putty工具
4. 





### 编写Linux应用程序

![image-20211008112326105](README.assets/image-20211008112326105.png)

![image-20211008104918760](README.assets/image-20211008104918760.png)

![image-20211008112754203](README.assets/image-20211008112754203.png)

**使用交叉编译工具，由 PetaLinux提供**

```bash
arm-linux-gnueabinf-gcc -o 输出文件名 main.c
```


---





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

   ![image-20211009225106386](README.assets/image-20211009225106386.png)

   可以看到Vivado自动识别了我们创建的IP核

   ![image-20211009225140489](README.assets/image-20211009225140489.png)

3. 导入 Zynq7 IP核并配置

   因为我们之后会使用 Flash、网络、USB、SD卡、串口通信；所以按照开发板的原理图，我们将各个端口做以下设置

   ![image-20211009225932217](README.assets/image-20211009225932217.png)

   使能 S_AXI_HP0 

   ![image-20211010145726095](README.assets/image-20211010145726095.png)

   为了适配 LCD 屏幕，我们将PL的输出频率设置为100

   ![image-20211009230209550](README.assets/image-20211009230209550.png)

   点击 Interrupt，使能 PL 到 PS 端的中断输入端口

   ![image-20211010123720693](README.assets/image-20211010123720693.png)

   配置完成后，得到如下所示

   ![image-20211010123747456](README.assets/image-20211010123747456.png)

4. 导入 VDMA IP

   > 使用 VDMA IP 核来实现对于 AXI4-Stream 类目标外设的高带宽直接存储器存取来读取 DDR 中的数据。VDMA 读取到数据之后通过 AXI4-Stream to Video Out IP 核将数据流转换成视频协议的数据流，之后在将该数据流转换为符合 RGB LCD 接口的时序就可以在 LCD 屏幕上显示了。

   `Frame Buffers` 选项可以选择 AXI VDMA 要处理的帧缓冲存储位置 的数量。由于本次显示实验只显示一张图片，数据只需要写入一次，因此不需要 设置多个帧缓存区域，这里设置为 1。因为本实验是从 DDR3 中读取数据输出给 LCD，所以只需要勾选 Enable Read Channel 就可以了，无需勾选 Enable Write Channel。

   `Memory Map Data Width` 选项可以为 MM2S 通道选择所需的 AXI4 数据宽度。此处保持默认 64 即可

   `Read Burst Size` 用于指定突发读的大小，此处选择 64

   `Stream Data Width` 选 项可以选择 MM2S 通道的 AXI4-Stream 数据宽度。 有效值是 8 的倍数，最大 到 1024。 必须注意的是该值必须小于或等于 Memory Map Data Width。**此处因输出数据格式为 RGB888，设置为 24**

   `Line Buffer Depth` 选项可以选择 MM2S 通道的行缓冲深度（行缓冲区宽度 为 stream data 的大小） ，此处设置 **2048**

   ![image-20211009231134235](README.assets/image-20211009231134235.png)

5. 导入 Timing IP核 （视频时序控制器）

   配置如下

   ![image-20211009231634423](README.assets/image-20211009231634423.png)

   

6. 导入 video out（视频输出控制器）

   这里我们使用了独立时钟作为输入，所以选择独立时钟

   ![image-20211009231913924](README.assets/image-20211009231913924.png)

7. **导入自定义LCD IP**

    `Reddepth`、` Greendepth` 和 `Buledepth` 用于 设置输出的 Red、Green 和 Blue 颜色的位数，这里我们使用 RGB888，所以分别设置为 8、8、8

   `Vid In Data Width` 用于指定输入的 RGB 总线宽度，为 24 位

   `Vid Out Data Width` 用于指定输出的 RGB 总线宽度，为 24 位

   ![image-20211009232019130](README.assets/image-20211009232019130.png)

8. 导入dynamic 动态时钟控制器 IP

   ![image-20211009232257512](README.assets/image-20211009232257512.png)

9. 因为 Vivado 自动连接会导致错误，所以我们这里手动分配时钟信号如下

   ![image-20211010110833860](README.assets/image-20211010110833860.png)

10. 使用 Vivado自动导出 Zynq7 PS IP核 的引脚

    ![image-20211009232953958](README.assets/image-20211009232953958.png)

11. 手动引出 自定义 IP 的相关引脚

     ![image-20211009233204932](README.assets/image-20211009233204932.png)

12. 让 Vivado 自动帮我们连接相关引脚

     ![image-20211009233302053](README.assets/image-20211009233302053.png)

13. 连接完成后部分信号无法自动连接，需手动连接

     ![image-20211009233949787](README.assets/image-20211009233949787.png)

14. 得到以下设计

     ![image-20211009235603921](README.assets/image-20211009235603921.png)

15. 导入 Concat IP核，以连接中断信号

     连接 VDMA 的 mm2s_introut 中断信号和 Video Timing Controller 的 irq 中断信号到 concat IP 的输入端，连接 Concat 的输出端到 ZYNQ7 Processing System 的中断信号输入端

     ![image-20211010123908833](README.assets/image-20211010123908833.png)

16. 最终得到以下设计

     ![image-20211010123953147](README.assets/image-20211010123953147.png)

17. 生成顶层 HDL 文件

     ![image-20211010124239589](README.assets/image-20211010124239589.png)

     ![image-20211010124415061](README.assets/image-20211010124415061.png)

18. 使用了GPIO0，所以我们根据开发板和LCD屏幕的原理图进行引脚约束

     ![image-20211010152529481](README.assets/image-20211010152529481.png)

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

     ![image-20211010124557434](README.assets/image-20211010124557434.png)

20. Vivado提示有错误无法生成比特流；经过查看，错误为我们自定义的LCD屏幕IP的端口名称与XDC文件中的不匹配，所以我们进行修改

     ![image-20211010153155356](README.assets/image-20211010153155356.png)

     重命名端口：

     ![image-20211010160230998](README.assets/image-20211010160230998.png)

21. 重新生成比特流，成功（MLGB，这破bug找了4天）

     ![image-20211010160707600](README.assets/image-20211010160707600.png)

22. 导出到硬件

     ![image-20211010160813265](README.assets/image-20211010160813265.png)

     ![image-20211010160829451](README.assets/image-20211010160829451.png)

23. 启动 SDK

24. 成功得到了我们需要用到的硬件描述文件 `system.hdf`

![image-20211010161042609](README.assets/image-20211010161042609.png)

#### 使用 PetaLinux 生成镜像文件

1. 启动 PetaLinux 工具

   ```shell
   source ./petalinux/settings.sh
   ```

   ![image-20211010164546678](README.assets/image-20211010164546678.png)

2. 创建工程

   ```shell
   petalinux-create --type project --template zynq --name petalinux_431_lab
   ```

   ![image-20211010165016952](README.assets/image-20211010165016952.png)

3. 进入工程，并使用 WinSCP 工具将我们获取的硬件描述文件导入当前工程目录

   ![image-20211010165407007](README.assets/image-20211010165407007.png)

4. 配置工程

   ```shell
   petalinux_config –get-hw-description=.
   ```

   ![image-20211010165737218](README.assets/image-20211010165737218.png)

5. 将内核修为本地内核

   <img src="README.assets/image-20211010165920849.png" alt="image-20211010165920849" style="zoom: 67%;" />

   <img src="README.assets/image-20211010165942933.png" alt="image-20211010165942933" style="zoom:67%;" />

   <img src="README.assets/image-20211010165959354.png" alt="image-20211010165959354" style="zoom: 67%;" />

   <img src="README.assets/image-20211010170015695.png" alt="image-20211010170015695" style="zoom:67%;" />

   <img src="README.assets/image-20211010170122684.png" alt="image-20211010170122684" style="zoom:67%;" />

   之后保存退出

   <img src="README.assets/image-20211010170541568.png" alt="image-20211010170541568" style="zoom:67%;" />

6. 配置内核

   ```shell
   petalinux-config –c kernel
   ```

   ![image-20211010170940753](README.assets/image-20211010170940753.png)

   ![image-20211010171010359](README.assets/image-20211010171010359.png)

   ![image-20211010171113245](README.assets/image-20211010171113245.png)

   保存退出

   ![image-20211010171450314](README.assets/image-20211010171450314.png)

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

   ![image-20211010173343823](README.assets/image-20211010173343823.png)

9. 打包工程，以生成 `BOOT.bin` 和 `image.ub`

   ```shell
   petalinux-package --boot --fsbl ./images/linux/zynq_fsbl.elf --fpga --u-boot --force
   ```

   ![image-20211010175359984](README.assets/image-20211010175359984.png)

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

   ![image-20211010181248442](README.assets/image-20211010181248442.png)

8. 启动端口通信工具并连接开发板

9. 启动开发板电源

10. 可以看到Linux系统成功启动，并且通过串口打印出了启动信息

    ![image-20211010213315977](README.assets/image-20211010213315977.png)

    ![image-20211010213245666](README.assets/image-20211010213245666.png)

11. 屏幕也成功显示

    ![image-20211010221012328](README.assets/image-20211010221012328.png)

12. 此时我们把键盘插入 USB 口，可以看到终端上打印出了识别成功的信息

    <img src="README.assets/image-20211010221213083.png" alt="image-20211010221213083" style="zoom: 33%;" />

    ![image-20211010213800330](README.assets/image-20211010213800330.png)

13. 键盘可以通过 USB 正常输入内容，并且网络也可以正常连接

    ![image-20211010221244498](README.assets/image-20211010221244498.png)

实验结束，取得成功





