# ==============================================================
# File generated on Sun Oct 24 17:05:42 +0300 2021
# Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
# SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
# IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# ==============================================================
add_files -tb ../code/testCorner.cpp -cflags { -Wno-unknown-pragmas}
add_files XC7Z020_316_ES_ConerDetect/code/screen.bmp
add_files XC7Z020_316_ES_ConerDetect/code/CornerDetect.h
add_files XC7Z020_316_ES_ConerDetect/code/CornerDetect.cpp
set_part xc7z020clg400-2
create_clock -name default -period 10
