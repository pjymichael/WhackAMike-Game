/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module random_dynamike_10 (
    input clk,
    input rst,
    output reg [4:0] out
  );
  
  
  
  wire [1-1:0] M_edge_detector_rng_out;
  reg [1-1:0] M_edge_detector_rng_in;
  edge_detector_19 edge_detector_rng (
    .clk(clk),
    .in(M_edge_detector_rng_in),
    .out(M_edge_detector_rng_out)
  );
  wire [1-1:0] M_edge_detector_seed_out;
  reg [1-1:0] M_edge_detector_seed_in;
  edge_detector_19 edge_detector_seed (
    .clk(clk),
    .in(M_edge_detector_seed_in),
    .out(M_edge_detector_seed_out)
  );
  reg [4:0] M_random_d, M_random_q = 1'h0;
  reg [4:0] M_seed_d, M_seed_q = 1'h0;
  wire [1-1:0] M_slowclock_forvariablecounter_value;
  counter_23 slowclock_forvariablecounter (
    .clk(clk),
    .rst(rst),
    .value(M_slowclock_forvariablecounter_value)
  );
  wire [1-1:0] M_slowerclock_value;
  counter_21 slowerclock (
    .clk(clk),
    .rst(rst),
    .value(M_slowerclock_value)
  );
  wire [32-1:0] M_rand_num;
  reg [1-1:0] M_rand_next;
  reg [32-1:0] M_rand_seed;
  pn_gen_22 rand (
    .clk(clk),
    .rst(rst),
    .next(M_rand_next),
    .seed(M_rand_seed),
    .num(M_rand_num)
  );
  
  always @* begin
    M_random_d = M_random_q;
    M_seed_d = M_seed_q;
    
    M_rand_seed = M_seed_q;
    M_edge_detector_rng_in = M_slowerclock_value;
    M_rand_next = M_edge_detector_rng_out;
    M_edge_detector_seed_in = M_slowclock_forvariablecounter_value;
    if (M_edge_detector_seed_out) begin
      M_seed_d = M_seed_q + 2'h2;
    end
    if (M_edge_detector_rng_out) begin
      M_rand_seed = M_seed_q;
      M_rand_next = 1'h1;
      M_random_d = M_rand_num[0+4-:5];
    end
    out = M_random_q;
  end
  
  always @(posedge clk) begin
    M_random_q <= M_random_d;
    M_seed_q <= M_seed_d;
  end
  
endmodule
