// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Mon Jul 14 20:16:31 2025
// Host        : hanqinghai running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/hanqi/Desktop/EDA_XILINX/FIR_COE20/vivado_prj/my_ip/fir_ip_1.0/src/clk_wiz_0_1/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_300M, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_300M,locked,clk_in1" */;
  output clk_300M;
  output locked;
  input clk_in1;
endmodule
