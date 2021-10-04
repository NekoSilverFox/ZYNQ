proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000

start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_230_ES_UG1165_LAB3/XC7Z020_230_ES_UG1165_LAB3.cache/wt [current_project]
  set_property parent.project_path C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_230_ES_UG1165_LAB3/XC7Z020_230_ES_UG1165_LAB3.xpr [current_project]
  set_property ip_output_repo C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_230_ES_UG1165_LAB3/XC7Z020_230_ES_UG1165_LAB3.cache/ip [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  set_property XPM_LIBRARIES XPM_CDC [current_project]
  add_files -quiet C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_230_ES_UG1165_LAB3/XC7Z020_230_ES_UG1165_LAB3.runs/synth_1/lab3_ps_pl_wrapper.dcp
  read_xdc -ref lab3_ps_pl_processing_system7_0_0 -cells inst c:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_230_ES_UG1165_LAB3/XC7Z020_230_ES_UG1165_LAB3.srcs/sources_1/bd/lab3_ps_pl/ip/lab3_ps_pl_processing_system7_0_0/lab3_ps_pl_processing_system7_0_0.xdc
  set_property processing_order EARLY [get_files c:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_230_ES_UG1165_LAB3/XC7Z020_230_ES_UG1165_LAB3.srcs/sources_1/bd/lab3_ps_pl/ip/lab3_ps_pl_processing_system7_0_0/lab3_ps_pl_processing_system7_0_0.xdc]
  read_xdc -prop_thru_buffers -ref lab3_ps_pl_axi_gpio_0_0 -cells U0 c:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_230_ES_UG1165_LAB3/XC7Z020_230_ES_UG1165_LAB3.srcs/sources_1/bd/lab3_ps_pl/ip/lab3_ps_pl_axi_gpio_0_0/lab3_ps_pl_axi_gpio_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_230_ES_UG1165_LAB3/XC7Z020_230_ES_UG1165_LAB3.srcs/sources_1/bd/lab3_ps_pl/ip/lab3_ps_pl_axi_gpio_0_0/lab3_ps_pl_axi_gpio_0_0_board.xdc]
  read_xdc -ref lab3_ps_pl_axi_gpio_0_0 -cells U0 c:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_230_ES_UG1165_LAB3/XC7Z020_230_ES_UG1165_LAB3.srcs/sources_1/bd/lab3_ps_pl/ip/lab3_ps_pl_axi_gpio_0_0/lab3_ps_pl_axi_gpio_0_0.xdc
  set_property processing_order EARLY [get_files c:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_230_ES_UG1165_LAB3/XC7Z020_230_ES_UG1165_LAB3.srcs/sources_1/bd/lab3_ps_pl/ip/lab3_ps_pl_axi_gpio_0_0/lab3_ps_pl_axi_gpio_0_0.xdc]
  read_xdc -ref lab3_ps_pl_axi_timer_0_0 -cells U0 c:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_230_ES_UG1165_LAB3/XC7Z020_230_ES_UG1165_LAB3.srcs/sources_1/bd/lab3_ps_pl/ip/lab3_ps_pl_axi_timer_0_0/lab3_ps_pl_axi_timer_0_0.xdc
  set_property processing_order EARLY [get_files c:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_230_ES_UG1165_LAB3/XC7Z020_230_ES_UG1165_LAB3.srcs/sources_1/bd/lab3_ps_pl/ip/lab3_ps_pl_axi_timer_0_0/lab3_ps_pl_axi_timer_0_0.xdc]
  read_xdc -prop_thru_buffers -ref lab3_ps_pl_rst_ps7_0_50M_0 -cells U0 c:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_230_ES_UG1165_LAB3/XC7Z020_230_ES_UG1165_LAB3.srcs/sources_1/bd/lab3_ps_pl/ip/lab3_ps_pl_rst_ps7_0_50M_0/lab3_ps_pl_rst_ps7_0_50M_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_230_ES_UG1165_LAB3/XC7Z020_230_ES_UG1165_LAB3.srcs/sources_1/bd/lab3_ps_pl/ip/lab3_ps_pl_rst_ps7_0_50M_0/lab3_ps_pl_rst_ps7_0_50M_0_board.xdc]
  read_xdc -ref lab3_ps_pl_rst_ps7_0_50M_0 -cells U0 c:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_230_ES_UG1165_LAB3/XC7Z020_230_ES_UG1165_LAB3.srcs/sources_1/bd/lab3_ps_pl/ip/lab3_ps_pl_rst_ps7_0_50M_0/lab3_ps_pl_rst_ps7_0_50M_0.xdc
  set_property processing_order EARLY [get_files c:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_230_ES_UG1165_LAB3/XC7Z020_230_ES_UG1165_LAB3.srcs/sources_1/bd/lab3_ps_pl/ip/lab3_ps_pl_rst_ps7_0_50M_0/lab3_ps_pl_rst_ps7_0_50M_0.xdc]
  read_xdc C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_230_ES_UG1165_LAB3/XC7Z020_230_ES_UG1165_LAB3.srcs/constrs_1/new/pins_key.xdc
  link_design -top lab3_ps_pl_wrapper -part xc7z020clg400-2
  write_hwdef -file lab3_ps_pl_wrapper.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force lab3_ps_pl_wrapper_opt.dcp
  report_drc -file lab3_ps_pl_wrapper_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force lab3_ps_pl_wrapper_placed.dcp
  report_io -file lab3_ps_pl_wrapper_io_placed.rpt
  report_utilization -file lab3_ps_pl_wrapper_utilization_placed.rpt -pb lab3_ps_pl_wrapper_utilization_placed.pb
  report_control_sets -verbose -file lab3_ps_pl_wrapper_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force lab3_ps_pl_wrapper_routed.dcp
  report_drc -file lab3_ps_pl_wrapper_drc_routed.rpt -pb lab3_ps_pl_wrapper_drc_routed.pb -rpx lab3_ps_pl_wrapper_drc_routed.rpx
  report_methodology -file lab3_ps_pl_wrapper_methodology_drc_routed.rpt -rpx lab3_ps_pl_wrapper_methodology_drc_routed.rpx
  report_timing_summary -warn_on_violation -max_paths 10 -file lab3_ps_pl_wrapper_timing_summary_routed.rpt -rpx lab3_ps_pl_wrapper_timing_summary_routed.rpx
  report_power -file lab3_ps_pl_wrapper_power_routed.rpt -pb lab3_ps_pl_wrapper_power_summary_routed.pb -rpx lab3_ps_pl_wrapper_power_routed.rpx
  report_route_status -file lab3_ps_pl_wrapper_route_status.rpt -pb lab3_ps_pl_wrapper_route_status.pb
  report_clock_utilization -file lab3_ps_pl_wrapper_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force lab3_ps_pl_wrapper_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

start_step write_bitstream
set ACTIVE_STEP write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  set_property XPM_LIBRARIES XPM_CDC [current_project]
  catch { write_mem_info -force lab3_ps_pl_wrapper.mmi }
  write_bitstream -force -no_partial_bitfile lab3_ps_pl_wrapper.bit 
  catch { write_sysdef -hwdef lab3_ps_pl_wrapper.hwdef -bitfile lab3_ps_pl_wrapper.bit -meminfo lab3_ps_pl_wrapper.mmi -file lab3_ps_pl_wrapper.sysdef }
  catch {write_debug_probes -quiet -force debug_nets}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
  unset ACTIVE_STEP 
}

