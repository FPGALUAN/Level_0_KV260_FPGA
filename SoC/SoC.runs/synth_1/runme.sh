#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/opt/xilinx/Vitis/2022.2/bin:/opt/xilinx/Vivado/2022.2/ids_lite/ISE/bin/lin64:/opt/xilinx/Vivado/2022.2/bin
else
  PATH=/opt/xilinx/Vitis/2022.2/bin:/opt/xilinx/Vivado/2022.2/ids_lite/ISE/bin/lin64:/opt/xilinx/Vivado/2022.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/hoailuan/Phat_Trien_Phan_Cung_FPGA/Kria_KV260_FPGA/Level_0/SoC/SoC.runs/synth_1'
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

EAStep vivado -log SoC_wrapper.vds -m64 -stack 10000 -product Vivado -mode batch -messageDb vivado.pb -notrace -source SoC_wrapper.tcl
