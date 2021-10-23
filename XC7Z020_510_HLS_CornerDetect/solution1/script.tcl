############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project XC7Z020_510_HLS_CornerDetect
set_top doCorner
add_files CornerDetect.cpp
add_files XC7Z020_510_HLS_CornerDetect/code/CornerDetect.h
add_files XC7Z020_510_HLS_CornerDetect/code/screen.bmp
add_files XC7Z020_510_HLS_CornerDetect/code/testCorner.cpp
add_files -tb XC7Z020_510_HLS_CornerDetect/code/testCorner.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution1"
set_part {xc7z010clg400-2}
create_clock -period 20 -name default
config_compile -no_signed_zeros=0 -unsafe_math_optimizations=0
config_sdx -optimization_level none -target none
config_schedule -effort medium -relax_ii_for_timing=0
config_bind -effort medium
config_export -format ip_catalog -rtl verilog
set_clock_uncertainty 12.5%
#source "./XC7Z020_510_HLS_CornerDetect/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
