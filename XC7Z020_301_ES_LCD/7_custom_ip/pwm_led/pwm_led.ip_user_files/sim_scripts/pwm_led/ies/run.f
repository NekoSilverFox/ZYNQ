-makelib ies_lib/xilinx_vip -sv \
  "C:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "C:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "C:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "C:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "C:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "C:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "C:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/axi_infrastructure_v1_1_0 \
  "../../../../pwm_led.srcs/sources_1/bd/pwm_led/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_vip_v1_1_4 -sv \
  "../../../../pwm_led.srcs/sources_1/bd/pwm_led/ipshared/98af/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib ies_lib/processing_system7_vip_v1_0_6 -sv \
  "../../../../pwm_led.srcs/sources_1/bd/pwm_led/ipshared/70cf/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../pwm_led.srcs/sources_1/bd/pwm_led/ip/pwm_led_processing_system7_0_0/sim/pwm_led_processing_system7_0_0.v" \
  "../../../../pwm_led.srcs/sources_1/bd/pwm_led/ipshared/4b82/hdl/pwm_ip.v" \
  "../../../../pwm_led.srcs/sources_1/bd/pwm_led/ipshared/4b82/hdl/pwm_ip_v1_0_S00_AXI.v" \
  "../../../../pwm_led.srcs/sources_1/bd/pwm_led/ipshared/4b82/hdl/pwm_ip_v1_0.v" \
  "../../../../pwm_led.srcs/sources_1/bd/pwm_led/ip/pwm_led_pwm_ip_0_0/sim/pwm_led_pwm_ip_0_0.v" \
-endlib
-makelib ies_lib/lib_cdc_v1_0_2 \
  "../../../../pwm_led.srcs/sources_1/bd/pwm_led/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/proc_sys_reset_v5_0_13 \
  "../../../../pwm_led.srcs/sources_1/bd/pwm_led/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../pwm_led.srcs/sources_1/bd/pwm_led/ip/pwm_led_rst_ps7_0_50M_0/sim/pwm_led_rst_ps7_0_50M_0.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../pwm_led.srcs/sources_1/bd/pwm_led/sim/pwm_led.v" \
-endlib
-makelib ies_lib/generic_baseblocks_v2_1_0 \
  "../../../../pwm_led.srcs/sources_1/bd/pwm_led/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_3 \
  "../../../../pwm_led.srcs/sources_1/bd/pwm_led/ipshared/64f4/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_3 \
  "../../../../pwm_led.srcs/sources_1/bd/pwm_led/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_3 \
  "../../../../pwm_led.srcs/sources_1/bd/pwm_led/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib ies_lib/axi_data_fifo_v2_1_17 \
  "../../../../pwm_led.srcs/sources_1/bd/pwm_led/ipshared/c4fd/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_register_slice_v2_1_18 \
  "../../../../pwm_led.srcs/sources_1/bd/pwm_led/ipshared/cc23/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_protocol_converter_v2_1_18 \
  "../../../../pwm_led.srcs/sources_1/bd/pwm_led/ipshared/7a04/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../pwm_led.srcs/sources_1/bd/pwm_led/ip/pwm_led_auto_pc_0/sim/pwm_led_auto_pc_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

