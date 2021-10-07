# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7z020clg400-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_420_Linux_GPIO/XC7Z020_420_Linux_GPIO.cache/wt [current_project]
set_property parent.project_path C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_420_Linux_GPIO/XC7Z020_420_Linux_GPIO.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_420_Linux_GPIO/XC7Z020_420_Linux_GPIO.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_420_Linux_GPIO/XC7Z020_420_Linux_GPIO.srcs/sources_1/bd/gpio_design/hdl/gpio_design_wrapper.v
add_files C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_420_Linux_GPIO/XC7Z020_420_Linux_GPIO.srcs/sources_1/bd/gpio_design/gpio_design.bd
set_property used_in_implementation false [get_files -all c:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_420_Linux_GPIO/XC7Z020_420_Linux_GPIO.srcs/sources_1/bd/gpio_design/ip/gpio_design_processing_system7_0_0/gpio_design_processing_system7_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_420_Linux_GPIO/XC7Z020_420_Linux_GPIO.srcs/sources_1/bd/gpio_design/ip/gpio_design_axi_gpio_0_0/gpio_design_axi_gpio_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_420_Linux_GPIO/XC7Z020_420_Linux_GPIO.srcs/sources_1/bd/gpio_design/ip/gpio_design_axi_gpio_0_0/gpio_design_axi_gpio_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_420_Linux_GPIO/XC7Z020_420_Linux_GPIO.srcs/sources_1/bd/gpio_design/ip/gpio_design_axi_gpio_0_0/gpio_design_axi_gpio_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_420_Linux_GPIO/XC7Z020_420_Linux_GPIO.srcs/sources_1/bd/gpio_design/ip/gpio_design_rst_ps7_0_50M_0/gpio_design_rst_ps7_0_50M_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_420_Linux_GPIO/XC7Z020_420_Linux_GPIO.srcs/sources_1/bd/gpio_design/ip/gpio_design_rst_ps7_0_50M_0/gpio_design_rst_ps7_0_50M_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_420_Linux_GPIO/XC7Z020_420_Linux_GPIO.srcs/sources_1/bd/gpio_design/ip/gpio_design_rst_ps7_0_50M_0/gpio_design_rst_ps7_0_50M_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_420_Linux_GPIO/XC7Z020_420_Linux_GPIO.srcs/sources_1/bd/gpio_design/ip/gpio_design_auto_pc_0/gpio_design_auto_pc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_420_Linux_GPIO/XC7Z020_420_Linux_GPIO.srcs/sources_1/bd/gpio_design/gpio_design_ooc.xdc]
set_property is_locked true [get_files C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_420_Linux_GPIO/XC7Z020_420_Linux_GPIO.srcs/sources_1/bd/gpio_design/gpio_design.bd]

foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_420_Linux_GPIO/XC7Z020_420_Linux_GPIO.srcs/constrs_1/new/pin_design.xdc
set_property used_in_implementation false [get_files C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_420_Linux_GPIO/XC7Z020_420_Linux_GPIO.srcs/constrs_1/new/pin_design.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top gpio_design_wrapper -part xc7z020clg400-2


write_checkpoint -force -noxdef gpio_design_wrapper.dcp

catch { report_utilization -file gpio_design_wrapper_utilization_synth.rpt -pb gpio_design_wrapper_utilization_synth.pb }