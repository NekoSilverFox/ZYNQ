############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project XC7Z020_316_ES_ConerDetect
set_top doCorner
add_files XC7Z020_316_ES_ConerDetect/code/screen.bmp
add_files XC7Z020_316_ES_ConerDetect/code/CornerDetect.h
add_files XC7Z020_316_ES_ConerDetect/code/CornerDetect.cpp
add_files -tb XC7Z020_316_ES_ConerDetect/code/testCorner.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution1"
set_part {xc7z020clg400-2} -tool vivado
create_clock -period 10 -name default
config_export -format ip_catalog -rtl verilog
#source "./XC7Z020_316_ES_ConerDetect/solution1/directives.tcl"
csim_design -clean
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
