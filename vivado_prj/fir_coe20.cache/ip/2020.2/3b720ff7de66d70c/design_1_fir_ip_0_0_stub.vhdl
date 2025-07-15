-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Mon Jul 14 19:42:06 2025
-- Host        : hanqinghai running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_fir_ip_0_0_stub.vhdl
-- Design      : design_1_fir_ip_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    fir_data_in : in STD_LOGIC_VECTOR ( 11 downto 0 );
    fir_data_invalid : in STD_LOGIC;
    s_axis_data_tvalid : out STD_LOGIC;
    s_axis_data_tready : in STD_LOGIC;
    s_axis_data_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    fir_data_out : out STD_LOGIC_VECTOR ( 13 downto 0 );
    fir_data_outvalid : out STD_LOGIC;
    m_axis_data_tvalid : in STD_LOGIC;
    m_axis_data_tdata : in STD_LOGIC_VECTOR ( 41 downto 0 );
    filter_config_tvalid : out STD_LOGIC;
    filter_config_tready : in STD_LOGIC;
    filter_config_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    fir_data_in_clk_o : out STD_LOGIC;
    fir_data_out_clk_o : out STD_LOGIC;
    clk_300M : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "fir_data_in[11:0],fir_data_invalid,s_axis_data_tvalid,s_axis_data_tready,s_axis_data_tdata[15:0],fir_data_out[13:0],fir_data_outvalid,m_axis_data_tvalid,m_axis_data_tdata[41:0],filter_config_tvalid,filter_config_tready,filter_config_tdata[7:0],fir_data_in_clk_o,fir_data_out_clk_o,clk_300M,s00_axi_aclk,s00_axi_aresetn,s00_axi_awaddr[3:0],s00_axi_awprot[2:0],s00_axi_awvalid,s00_axi_awready,s00_axi_wdata[31:0],s00_axi_wstrb[3:0],s00_axi_wvalid,s00_axi_wready,s00_axi_bresp[1:0],s00_axi_bvalid,s00_axi_bready,s00_axi_araddr[3:0],s00_axi_arprot[2:0],s00_axi_arvalid,s00_axi_arready,s00_axi_rdata[31:0],s00_axi_rresp[1:0],s00_axi_rvalid,s00_axi_rready";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "fir_ip_v1_0,Vivado 2020.2";
begin
end;
