`timescale 1ns / 1ps
// *********************************************************************************/
// Project Name :
// Author       : i_huyi
// Email        : i_huyi@qq.com
// Creat Time   : 2023/10/20 16:46:10
// File Name    : .v
// Module Name  : 
// Called By    :
// Abstract     :
//
// CopyRight(c) 2020, xxx xxx xxx Co., Ltd.. 

module fir(    
input   wire            aresetn                         ,
input   wire            aclk                            ,

input   wire            s_axis_data_tvalid              ,
output  wire            s_axis_data_tready              ,
input   wire    [15:0]  s_axis_data_tdata               ,
                                                                                  
input   wire            s_axis_config_tvalid            ,
output  wire            s_axis_config_tready            ,
input   wire    [7:0]   s_axis_config_tdata             ,

input   wire            s_axis_reload_tvalid            ,   
output  wire            s_axis_reload_tready            ,
input   wire            s_axis_reload_tlast             ,                                      
input   wire    [15:0]  s_axis_reload_tdata             ,

output  wire            m_axis_data_tvalid              ,
output  wire    [41:0]  m_axis_data_tdata               ,

output  wire            event_s_reload_tlast_missing    ,
output  wire            event_s_reload_tlast_unexpected 

);

fir_compiler_0 fir_compiler_0_inst (
    .aresetn                         (aresetn              ),// input wire aresetn
    .aclk                            (aclk                 ),// input wire aclk
    .s_axis_data_tvalid              (s_axis_data_tvalid   ),// input wire s_axis_data_tvalid
    .s_axis_data_tready              (s_axis_data_tready   ),// output wire s_axis_data_tready
    .s_axis_data_tdata               (s_axis_data_tdata    ),// input wire [15 : 0] s_axis_data_tdata
  
    .s_axis_config_tvalid            (s_axis_config_tvalid ),  // input wire s_axis_config_tvalid 
    .s_axis_config_tready            (s_axis_config_tready ),  // output wire s_axis_config_tready
    .s_axis_config_tdata             (s_axis_config_tdata  ),  // input wire [7 : 0] s_axis_config_tdata
    
    .m_axis_data_tvalid              (m_axis_data_tvalid   ),// output wire m_axis_data_tvalid
    .m_axis_data_tdata               (m_axis_data_tdata    ),// output wire [39 : 0] m_axis_data_tdata
  
    .s_axis_reload_tvalid            (s_axis_reload_tvalid ),          
    .s_axis_reload_tready            (s_axis_reload_tready ),
    .s_axis_reload_tlast             (s_axis_reload_tlast  ),  
    .s_axis_reload_tdata             (s_axis_reload_tdata  ),
    
    .event_s_reload_tlast_missing    (event_s_reload_tlast_missing),
    .event_s_reload_tlast_unexpected (event_s_reload_tlast_unexpected)
  
);
 
endmodule