/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input usb_rx,
    output reg usb_tx,
    input [4:0] p1,
    input [4:0] p2,
    output reg [4:0] normike,
    output reg [4:0] dynamike,
    output reg [7:0] io_segp1,
    output reg [1:0] io_selp1,
    output reg [7:0] io_segp2,
    output reg [1:0] io_selp2,
    output reg [7:0] io_segwin,
    output reg [1:0] io_selwin
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [16-1:0] M_betaUnit_out_mike;
  wire [16-1:0] M_betaUnit_out_dynamike;
  wire [8-1:0] M_betaUnit_segments_p1;
  wire [2-1:0] M_betaUnit_selectors_p1;
  wire [8-1:0] M_betaUnit_segments_p2;
  wire [2-1:0] M_betaUnit_selectors_p2;
  wire [8-1:0] M_betaUnit_segments_win;
  wire [2-1:0] M_betaUnit_selectors_win;
  reg [5-1:0] M_betaUnit_p1_button;
  reg [5-1:0] M_betaUnit_p2_button;
  beta_2 betaUnit (
    .clk(clk),
    .rst(rst),
    .p1_button(M_betaUnit_p1_button),
    .p2_button(M_betaUnit_p2_button),
    .out_mike(M_betaUnit_out_mike),
    .out_dynamike(M_betaUnit_out_dynamike),
    .segments_p1(M_betaUnit_segments_p1),
    .selectors_p1(M_betaUnit_selectors_p1),
    .segments_p2(M_betaUnit_segments_p2),
    .selectors_p2(M_betaUnit_selectors_p2),
    .segments_win(M_betaUnit_segments_win),
    .selectors_win(M_betaUnit_selectors_win)
  );
  wire [(3'h5+0)-1:0] M_edge_dt_btn_p1_out;
  reg [(3'h5+0)-1:0] M_edge_dt_btn_p1_in;
  
  genvar GEN_edge_dt_btn_p10;
  generate
  for (GEN_edge_dt_btn_p10=0;GEN_edge_dt_btn_p10<3'h5;GEN_edge_dt_btn_p10=GEN_edge_dt_btn_p10+1) begin: edge_dt_btn_p1_gen_0
    edge_detector_3 edge_dt_btn_p1 (
      .clk(clk),
      .in(M_edge_dt_btn_p1_in[GEN_edge_dt_btn_p10*(1)+(1)-1-:(1)]),
      .out(M_edge_dt_btn_p1_out[GEN_edge_dt_btn_p10*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  wire [(3'h5+0)-1:0] M_edge_dt_btn_p2_out;
  reg [(3'h5+0)-1:0] M_edge_dt_btn_p2_in;
  
  genvar GEN_edge_dt_btn_p20;
  generate
  for (GEN_edge_dt_btn_p20=0;GEN_edge_dt_btn_p20<3'h5;GEN_edge_dt_btn_p20=GEN_edge_dt_btn_p20+1) begin: edge_dt_btn_p2_gen_0
    edge_detector_3 edge_dt_btn_p2 (
      .clk(clk),
      .in(M_edge_dt_btn_p2_in[GEN_edge_dt_btn_p20*(1)+(1)-1-:(1)]),
      .out(M_edge_dt_btn_p2_out[GEN_edge_dt_btn_p20*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  wire [(3'h5+0)-1:0] M_btn_cond_p1_out;
  reg [(3'h5+0)-1:0] M_btn_cond_p1_in;
  
  genvar GEN_btn_cond_p10;
  generate
  for (GEN_btn_cond_p10=0;GEN_btn_cond_p10<3'h5;GEN_btn_cond_p10=GEN_btn_cond_p10+1) begin: btn_cond_p1_gen_0
    button_conditioner_4 btn_cond_p1 (
      .clk(clk),
      .in(M_btn_cond_p1_in[GEN_btn_cond_p10*(1)+(1)-1-:(1)]),
      .out(M_btn_cond_p1_out[GEN_btn_cond_p10*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  wire [(3'h5+0)-1:0] M_btn_cond_p2_out;
  reg [(3'h5+0)-1:0] M_btn_cond_p2_in;
  
  genvar GEN_btn_cond_p20;
  generate
  for (GEN_btn_cond_p20=0;GEN_btn_cond_p20<3'h5;GEN_btn_cond_p20=GEN_btn_cond_p20+1) begin: btn_cond_p2_gen_0
    button_conditioner_4 btn_cond_p2 (
      .clk(clk),
      .in(M_btn_cond_p2_in[GEN_btn_cond_p20*(1)+(1)-1-:(1)]),
      .out(M_btn_cond_p2_out[GEN_btn_cond_p20*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  
  always @* begin
    M_reset_cond_in = rst_n;
    rst = M_reset_cond_out;
    usb_tx = usb_rx;
    led = 8'h00;
    normike = 5'h00;
    dynamike = 5'h00;
    io_segp1 = 8'hff;
    io_selp1 = 4'hf;
    io_segp2 = 8'hff;
    io_selp2 = 4'hf;
    io_segwin = 8'hff;
    io_selwin = 4'hf;
    M_btn_cond_p1_in = p1;
    M_btn_cond_p2_in = p2;
    M_edge_dt_btn_p1_in = M_btn_cond_p1_out;
    M_edge_dt_btn_p2_in = M_btn_cond_p2_out;
    M_betaUnit_p1_button = M_edge_dt_btn_p1_out;
    M_betaUnit_p2_button = M_edge_dt_btn_p2_out;
    normike = M_betaUnit_out_mike[0+4-:5];
    dynamike = M_betaUnit_out_dynamike[0+4-:5];
    io_segp1 = M_betaUnit_segments_p1;
    io_selp1 = M_betaUnit_selectors_p1;
    io_segp2 = M_betaUnit_segments_p2;
    io_selp2 = M_betaUnit_selectors_p2;
    io_segwin = M_betaUnit_segments_win;
    io_selwin = M_betaUnit_selectors_win;
  end
endmodule
