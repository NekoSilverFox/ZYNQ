#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
# 

echo "This script was generated under a different operating system."
echo "Please update the PATH and LD_LIBRARY_PATH variables below, before executing this script"
exit

if [ -z "$PATH" ]; then
  PATH=G:/Xilinx/SDK/2016.3/bin;G:/Xilinx/Vivado/2016.3/ids_lite/ISE/bin/nt64;G:/Xilinx/Vivado/2016.3/ids_lite/ISE/lib/nt64:G:/Xilinx/Vivado/2016.3/bin
else
  PATH=G:/Xilinx/SDK/2016.3/bin;G:/Xilinx/Vivado/2016.3/ids_lite/ISE/bin/nt64;G:/Xilinx/Vivado/2016.3/ids_lite/ISE/lib/nt64:G:/Xilinx/Vivado/2016.3/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_208_ES_key_control_led_GPIO_EMIO/XC7Z020_208_ES_key_control_led_GPIO_EMIO.runs/impl_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

# pre-commands:
/bin/touch .write_bitstream.begin.rst
EAStep vivado -log ps_design_wrapper.vdi -applog -m64 -product Vivado -messageDb vivado.pb -mode batch -source ps_design_wrapper.tcl -notrace


