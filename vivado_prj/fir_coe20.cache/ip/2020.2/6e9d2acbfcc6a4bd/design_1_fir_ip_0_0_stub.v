// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Tue Jul 15 10:16:47 2025
// Host        : hanqinghai running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_fir_ip_0_0_stub.v
// Design      : design_1_fir_ip_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "fir_ip_v1_0,Vivado 2020.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(fir_data_in, fir_data_invalid, 
  s_axis_data_tvalid, s_axis_data_tready, s_axis_data_tdata, fir_data_out, 
  fir_data_outvalid, m_axis_data_tvalid, m_axis_data_tdata, filter_config_tvalid, 
  filter_config_tready, filter_config_tdata, fir_data_in_clk_o, fir_data_out_clk_o, 
  clk_300M, s00_axi_aclk, s00_axi_aresetn, s00_axi_awaddr, s00_axi_awprot, s00_axi_awvalid, 
  s00_axi_awready, s00_axi_wdata, s00_axi_wstrb, s00_axi_wvalid, s00_axi_wready, 
  s00_axi_bresp, s00_axi_bvalid, s00_axi_bready, s00_axi_araddr, s00_axi_arprot, 
  s00_axi_arvalid, s00_axi_arready, s00_axi_rdata, s00_axi_rresp, s00_axi_rvalid, 
  s00_axi_rready)
/* synthesis syn_black_box black_box_pad_pin="fir_data_in[11:0],fir_data_invalid,s_axis_data_tvalid,s_axis_data_tready,s_axis_data_tdata[15:0],fir_data_out[13:0],fir_data_outvalid,m_axis_data_tvalid,m_axis_data_tdata[41:0],filter_config_tvalid,filter_config_tready,filter_config_tdata[7:0],fir_data_in_clk_o,fir_data_out_clk_o,clk_300M,s00_axi_aclk,s00_axi_aresetn,s00_axi_awaddr[3:0],s00_axi_awprot[2:0],s00_axi_awvalid,s00_axi_awready,s00_axi_wdata[31:0],s00_axi_wstrb[3:0],s00_axi_wvalid,s00_axi_wready,s00_axi_bresp[1:0],s00_axi_bvalid,s00_axi_bready,s00_axi_araddr[3:0],s00_axi_arprot[2:0],s00_axi_arvalid,s00_axi_arready,s00_axi_rdata[31:0],s00_axi_rresp[1:0],s00_axi_rvalid,s00_axi_rready" */;
  input [11:0]fir_data_in;
  input fir_data_invalid;
  output s_axis_data_tvalid;
  input s_axis_data_tready;
  output [15:0]s_axis_data_tdata;
  output [13:0]fir_data_out;
  output fir_data_outvalid;
  input m_axis_data_tvalid;
  input [41:0]m_axis_data_tdata;
  output filter_config_tvalid;
  input filter_config_tready;
  output [7:0]filter_config_tdata;
  output fir_data_in_clk_o;
  output fir_data_out_clk_o;
  output clk_300M;
  input s00_axi_aclk;
  input s00_axi_aresetn;
  input [3:0]s00_axi_awaddr;
  input [2:0]s00_axi_awprot;
  input s00_axi_awvalid;
  output s00_axi_awready;
  input [31:0]s00_axi_wdata;
  input [3:0]s00_axi_wstrb;
  input s00_axi_wvalid;
  output s00_axi_wready;
  output [1:0]s00_axi_bresp;
  output s00_axi_bvalid;
  input s00_axi_bready;
  input [3:0]s00_axi_araddr;
  input [2:0]s00_axi_arprot;
  input s00_axi_arvalid;
  output s00_axi_arready;
  output [31:0]s00_axi_rdata;
  output [1:0]s00_axi_rresp;
  output s00_axi_rvalid;
  input s00_axi_rready;
endmodule
