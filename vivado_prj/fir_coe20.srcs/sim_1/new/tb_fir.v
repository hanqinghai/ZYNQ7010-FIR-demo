`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/07/07 15:50:46
// Design Name: 
// Module Name: tb_fir
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


module tb_fir;
//input 
reg [11:0]  fir_data_in;
reg         fir_data_inen;
 
reg         clk;
reg         clk_5M;
reg         rst_n;
reg [15:0]  simdata [0:32767];
reg [15:0]  read_data;
 
//output
wire[13:0]  fir_data_out;
wire        fir_data_outvalid;
reg [7:0]   Freq_Select;     
wire        adc_clk_o           ;
wire        dac_clk_o           ; 

fir_top fir_top_inst(
    .clk_i               (clk             ),
    .rstn_i              (rst_n            ),
    .freq_ctrl_i         (Freq_Select       ),
    .fir_data_in         (fir_data_in       ),
    .fir_data_invalid    (fir_data_inen  ),
    .fir_data_out        (fir_data_out      ),
    .fir_data_outvalid   (fir_data_outvalid ),
    .fir_data_in_clk_o   (adc_clk_o ),
    .fir_data_out_clk_o  (dac_clk_o) 
);

    integer            i;
    //设置复位参数
    initial
    begin
            $display("[%t] : reset begin...", $realtime);
            rst_n = 0;
            for( i=0 ; i<100 ; i=i+1)
            begin
                    @(posedge clk );
            end
            $display("[%t] : reset stop...", $realtime);
            rst_n = 1;
    end
 
    initial
    begin
            clk = 0;
            clk_5M = 0;
            read_data = 0;
            fir_data_in = 0;
            Freq_Select = 0;
            fir_data_inen = 0;
            wait(rst_n == 1);
            fir_data_inen = 1;
            $display("[%t] : read data begin...", $realtime);
            repeat(2048)
            begin
                    @(posedge clk_5M);
                    read_data = read_data + 16'd1;
                    fir_data_in = simdata[read_data] + 12'd2048;
            end
            Freq_Select = 1;
            read_data = 0;
            repeat(2048)
            begin
                    @(posedge clk_5M);
                    read_data = read_data + 16'd1;
                    fir_data_in = simdata[read_data] + 12'd2048;
            end
//            repeat(100)@(posedge clk);
            $display("[%t] : read data stop...", $realtime);
            $finish(0);
 
 
    end

    initial
    begin
            $readmemh("C:/Users/hanqi/Desktop/simdata.txt",simdata);
 
    end

    always #10 clk = ~clk;
    always #100 clk_5M = ~clk_5M;
endmodule

