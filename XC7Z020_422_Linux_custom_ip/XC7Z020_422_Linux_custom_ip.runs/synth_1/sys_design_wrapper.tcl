# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7z020clg400-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_422_Linux_custom_ip/XC7Z020_422_Linux_custom_ip.cache/wt [current_project]
set_property parent.project_path C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_422_Linux_custom_ip/XC7Z020_422_Linux_custom_ip.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_repo_paths c:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_216_ES_custom_ip_LED/ip_repo/pwm_ip_1.0 [current_project]
update_ip_catalog
set_property ip_output_repo c:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_422_Linux_custom_ip/XC7Z020_422_Linux_custom_ip.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_422_Linux_custom_ip/XC7Z020_422_Linux_custom_ip.srcs/sources_1/bd/sys_design/hdl/sys_design_wrapper.v
add_files C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_422_Linux_custom_ip/XC7Z020_422_Linux_custom_ip.srcs/sources_1/bd/sys_design/sys_design.bd
set_property used_in_implementation false [get_files -all c:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_422_Linux_custom_ip/XC7Z020_422_Linux_custom_ip.srcs/sources_1/bd/sys_design/ip/sys_design_processing_system7_0_0/sys_design_processing_system7_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_422_Linux_custom_ip/XC7Z020_422_Linux_custom_ip.srcs/sources_1/bd/sys_design/ip/sys_design_rst_ps7_0_50M_0/sys_design_rst_ps7_0_50M_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_422_Linux_custom_ip/XC7Z020_422_Linux_custom_ip.srcs/sources_1/bd/sys_design/ip/sys_design_rst_ps7_0_50M_0/sys_design_rst_ps7_0_50M_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_422_Linux_custom_ip/XC7Z020_422_Linux_custom_ip.srcs/sources_1/bd/sys_design/ip/sys_design_auto_pc_0/sys_design_auto_pc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_422_Linux_custom_ip/XC7Z020_422_Linux_custom_ip.srcs/sources_1/bd/sys_design/sys_design_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_422_Linux_custom_ip/XC7Z020_422_Linux_custom_ip.srcs/constrs_1/new/led_pin.xdc
set_property used_in_implementation false [get_files C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_422_Linux_custom_ip/XC7Z020_422_Linux_custom_ip.srcs/constrs_1/new/led_pin.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top sys_design_wrapper -part xc7z020clg400-2


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef sys_design_wrapper.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file sys_design_wrapper_utilization_synth.rpt -pb sys_design_wrapper_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]