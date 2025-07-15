`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/07/14 12:52:22
// Design Name: 
// Module Name: fir_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fir_top(
     input  wire            clk_i               ,
     input  wire            rstn_i              ,
     input  wire    [7:0]   freq_ctrl_i         ,
     
     input  wire    [11:0]  fir_data_in         ,
     input  wire            fir_data_invalid    ,
     
     output wire    [13:0]  fir_data_out        ,
     output wire            fir_data_outvalid   ,
     
     output wire            fir_data_in_clk_o   ,
     output wire            fir_data_out_clk_o  
);

wire            s_axis_data_tvalid      ;
wire            s_axis_data_tready      ;    
wire    [15:0]  s_axis_data_tdata       ;
wire            m_axis_data_tvalid      ;        
wire    [47:0]  m_axis_data_tdata       ;
wire            s_axis_config_tvalid    ;
wire            s_axis_config_tready    ;
wire    [7:0]   s_axis_config_tdata     ;
wire    clk_300M;

fir_ctrl fir_ctrl_inst (
    .fir_data_in            (fir_data_in),
    .fir_data_invalid       (fir_data_invalid),
    .s_axis_data_tvalid     (s_axis_data_tvalid), 
    .s_axis_data_tready     (s_axis_data_tready),//Meaningless signal    
    .s_axis_data_tdata      (s_axis_data_tdata),               
    
    .filter_config_tvalid   (s_axis_config_tvalid),
    .filter_config_tready   (s_axis_config_tready),
    .filter_config_tdata    (s_axis_config_tdata),
    
    .fir_data_out           (fir_data_out),
    .fir_data_outvalid      (fir_data_outvalid),
    .m_axis_data_tvalid     (m_axis_data_tvalid),        
    .m_axis_data_tdata      (m_axis_data_tdata),
    
    .fir_data_in_clk_o      (fir_data_in_clk_o),
    .fir_data_out_clk_o     (fir_data_out_clk_o),
    .clk_i                  (clk_i),
    .clk_300M               (clk_300M),
    .freq_ctrl_i            (freq_ctrl_i),
    .rstn_i                 (rstn_i)
);

fir fir_inst (
    .aresetn                         (rstn_i              ),// input wire aresetn
    .aclk                            (clk_300M                 ),// input wire aclk
    .s_axis_data_tvalid              (s_axis_data_tvalid   ),// input wire s_axis_data_tvalid
    .s_axis_data_tready              (s_axis_data_tready   ),// output wire s_axis_data_tready
    .s_axis_data_tdata               (s_axis_data_tdata    ),// input wire [15 : 0] s_axis_data_tdata
  
    .s_axis_config_tvalid            (s_axis_config_tvalid ),  // input wire s_axis_config_tvalid 
    .s_axis_config_tready            (s_axis_config_tready ),  // output wire s_axis_config_tready
    .s_axis_config_tdata             (s_axis_config_tdata  ),  // input wire [7 : 0] s_axis_config_tdata
    
    .m_axis_data_tvalid              (m_axis_data_tvalid   ),// output wire m_axis_data_tvalid
    .m_axis_data_tdata               (m_axis_data_tdata    ),// output wire [39 : 0] m_axis_data_tdata
  
    .s_axis_reload_tvalid            (),          
    .s_axis_reload_tready            (),
    .s_axis_reload_tlast             (),  
    .s_axis_reload_tdata             (),
    
    .event_s_reload_tlast_missing    (),
    .event_s_reload_tlast_unexpected ()
  
);
 
endmodule
