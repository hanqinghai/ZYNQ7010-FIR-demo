`timescale 1ns / 1ps

module fir_ctrl(
input   wire    [11:0]  fir_data_in             ,
input   wire            fir_data_invalid        ,
output  wire            s_axis_data_tvalid      , 
input   wire            s_axis_data_tready      ,//Meaningless signal    
output  wire    [15:0]  s_axis_data_tdata       ,               

output  wire    [13:0]  fir_data_out            ,
output  wire            fir_data_outvalid       ,
input   wire            m_axis_data_tvalid      ,        
input   wire    [41:0]  m_axis_data_tdata       ,        

output  reg             filter_config_tvalid    ,
input   wire            filter_config_tready    ,
output  reg     [7:0]   filter_config_tdata     ,

output  wire            fir_data_in_clk_o       ,
output  wire            fir_data_out_clk_o      ,
input   wire            clk_i                   ,
output  wire            clk_300M                ,
input   wire    [7:0]   freq_ctrl_i             ,
input   wire            rstn_i                  
);

////////////////数据重装载//////////////////////////
wire    [15:0]  s_axis_reload_tdata         ;
wire            s_axis_reload_tlast         ;
wire            s_axis_reload_tready        ;
wire            s_axis_reload_tvalid        ;
////////////////时钟产生&&截止频率选择//////////////
reg             clk_5M_o                    ;
wire    [7:0]   Freq_Select                 ;
wire            event_s_reload_tlast_missing;
wire            event_s_reload_tlast_unexpected ;
reg     [7:0]   cnt                             ;
   
assign  s_axis_data_tvalid  = fir_data_invalid;
assign  s_axis_data_tdata   = fir_data_in - 12'd2048;

assign  fir_data_out        = m_axis_data_tdata / 32'd1_048_576+ 16'd8192;
assign  fir_data_outvalid   = m_axis_data_tvalid;

assign  Freq_Select         = freq_ctrl_i;
assign  fir_data_in_clk_o   = clk_5M_o;
assign  fir_data_out_clk_o  = clk_5M_o;
//assign  clk_300M_o          = clk_300M;

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

endmodule