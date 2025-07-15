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
input   wire    [11:0]  fir_data_in         ,
input   wire            fir_data_invalid    ,

output  wire    [13:0]  fir_data_out        ,
output  wire            fir_data_outvalid   ,

output  wire            adc_clk_o           ,
output  wire            dac_clk_o           ,
input   wire            clk_i               ,
input   wire    [1:0]   freq_ctrl_i         ,
input   wire            rstn_i               
);
////////////////数据接收////////////////////////////
wire            s_axis_data_tvalid          ;
wire    [15:0]  s_axis_data_tdata           ;
wire            s_axis_data_tready          ;
////////////////数据输出////////////////////////////
wire            m_axis_data_tvalid          ;
wire    [41:0]  m_axis_data_tdata           ;
////////////////数据重装载//////////////////////////
wire    [15:0]  s_axis_reload_tdata         ;
wire            s_axis_reload_tlast         ;
wire            s_axis_reload_tready        ;
wire            s_axis_reload_tvalid        ;
////////////////时钟产生&&截止频率选择//////////////
wire            clk_300M                    ;
reg             clk_5M_o                    ;
wire    [1:0]   Freq_Select                 ;
wire            event_s_reload_tlast_missing;
wire            event_s_reload_tlast_unexpected ;
reg     [7:0]   cnt                             ;
   
assign  s_axis_data_tvalid  = fir_data_invalid;
assign  s_axis_data_tdata   = fir_data_in - 12'd2048;
//assign  fir_data_out        =(m_axis_data_tdata < 64'd0) ? (m_axis_data_tdata / 16'd8192 + 16'd8192) : (m_axis_data_tdata / 16'd8192);
assign  fir_data_out        = m_axis_data_tdata / 32'd1_048_576+ 16'd8192;
assign  fir_data_outvalid   = m_axis_data_tvalid;
assign  Freq_Select         = freq_ctrl_i;
assign  adc_clk_o           = clk_5M_o;
assign  dac_clk_o           = clk_5M_o;

reg         filter_config_tvalid        ;
wire        filter_config_tready        ;
reg [7:0]   filter_config_tdata         ;
// 功能：通过控制filter_config_tvalid和filter_config_tdata，进而实现动态配置FIR的coe系数
always@(posedge clk_300M or negedge rstn_i)
begin
    if(!rstn_i)
        begin
            filter_config_tvalid<=1'b0;
            filter_config_tdata<=8'd0;
        end
    else if( filter_config_tready )//config通道准备好接收数据
        begin
            filter_config_tvalid<=1'b1;
            case(Freq_Select)
                8'd0: filter_config_tdata<=8'd0; //选择系数的组别
                8'd1: filter_config_tdata<=8'd1;
//                8'd2: filter_config_tdata<=8'd2;
//                8'd3: filter_config_tdata<=8'd3;
//                8'd4: filter_config_tdata<=8'd4;
//                8'd5: filter_config_tdata<=8'd5;
//                8'd6: filter_config_tdata<=8'd6;
//                8'd7: filter_config_tdata<=8'd7;                
                default:  
                      filter_config_tdata<=8'd0;
            endcase                             
        end
    else 
        begin
            filter_config_tvalid<=filter_config_tvalid;
            filter_config_tdata<=filter_config_tdata;
        end  
end    

always@(posedge clk_i or negedge rstn_i)
    if(!rstn_i)
        cnt <= 8'd0;
    else if(cnt < 8'd4)
        cnt <= cnt + 1'b1;
    else if(cnt >= 8'd4)
        cnt <= 8'd0;
        
always@(posedge clk_i or negedge rstn_i)
    if(!rstn_i)
        clk_5M_o <= 1'b1;
    else if(cnt == 8'd2)
        clk_5M_o <= ~clk_5M_o;
        
clk_wiz_0 clk_wiz_0_inst
(
    .clk_300M(clk_300M),     
    .locked(),       
    .clk_in1(clk_i)
);    


//fir_compiler_0 fir_compiler_0_inst (
//    .aresetn                         (rstn_i               ),// input wire aresetn
//    .aclk                            (clk_300M             ),// input wire aclk
//    .s_axis_data_tvalid              (s_axis_data_tvalid   ),// input wire s_axis_data_tvalid
//    .s_axis_data_tready              (s_axis_data_tready   ),// output wire s_axis_data_tready
//    .s_axis_data_tdata               (s_axis_data_tdata    ),// input wire [15 : 0] s_axis_data_tdata
  
//    .m_axis_data_tvalid              (m_axis_data_tvalid   ),// output wire m_axis_data_tvalid
//    .m_axis_data_tdata               (m_axis_data_tdata    ),// output wire [39 : 0] m_axis_data_tdata
  
//    .s_axis_reload_tdata             (s_axis_reload_tdata  ),
//    .s_axis_reload_tlast             (s_axis_reload_tlast  ),           
//    .s_axis_reload_tready            (s_axis_reload_tready ),
//    .s_axis_reload_tvalid            (s_axis_reload_tvalid ),
    
//    .event_s_reload_tlast_missing    (event_s_reload_tlast_missing),
//    .event_s_reload_tlast_unexpected (event_s_reload_tlast_unexpected),
    
//    .s_axis_config_tdata             (filter_config_tdata  ),  // input wire [7 : 0] s_axis_config_tdata
//    .s_axis_config_tready            (filter_config_tready ),  // output wire s_axis_config_tready
//    .s_axis_config_tvalid            (filter_config_tvalid )  // input wire s_axis_config_tvalid 
    
);
 
endmodule