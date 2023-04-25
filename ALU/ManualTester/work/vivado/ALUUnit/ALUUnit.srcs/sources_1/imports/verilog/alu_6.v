/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_6 (
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn_sig,
    output reg [15:0] out,
    output reg [2:0] nvz,
    input clk,
    input rst
  );
  
  
  
  wire [16-1:0] M_adderUnit_out;
  wire [1-1:0] M_adderUnit_z;
  wire [1-1:0] M_adderUnit_v;
  wire [1-1:0] M_adderUnit_n;
  reg [16-1:0] M_adderUnit_a;
  reg [16-1:0] M_adderUnit_b;
  reg [6-1:0] M_adderUnit_alufn_signal;
  adder_7 adderUnit (
    .a(M_adderUnit_a),
    .b(M_adderUnit_b),
    .alufn_signal(M_adderUnit_alufn_signal),
    .out(M_adderUnit_out),
    .z(M_adderUnit_z),
    .v(M_adderUnit_v),
    .n(M_adderUnit_n)
  );
  
  wire [16-1:0] M_booleanUnit_out;
  reg [6-1:0] M_booleanUnit_alufn_signal;
  reg [16-1:0] M_booleanUnit_a;
  reg [16-1:0] M_booleanUnit_b;
  boolean_8 booleanUnit (
    .alufn_signal(M_booleanUnit_alufn_signal),
    .a(M_booleanUnit_a),
    .b(M_booleanUnit_b),
    .out(M_booleanUnit_out)
  );
  
  wire [16-1:0] M_shifterUnit_out;
  reg [16-1:0] M_shifterUnit_a;
  reg [5-1:0] M_shifterUnit_b;
  reg [6-1:0] M_shifterUnit_alufn_signal;
  shifter_9 shifterUnit (
    .a(M_shifterUnit_a),
    .b(M_shifterUnit_b),
    .alufn_signal(M_shifterUnit_alufn_signal),
    .out(M_shifterUnit_out)
  );
  
  wire [16-1:0] M_compareUnit_out;
  reg [1-1:0] M_compareUnit_z;
  reg [1-1:0] M_compareUnit_v;
  reg [1-1:0] M_compareUnit_n;
  reg [6-1:0] M_compareUnit_alufn_signal;
  compare_10 compareUnit (
    .clk(clk),
    .rst(rst),
    .z(M_compareUnit_z),
    .v(M_compareUnit_v),
    .n(M_compareUnit_n),
    .alufn_signal(M_compareUnit_alufn_signal),
    .out(M_compareUnit_out)
  );
  
  reg z;
  
  reg v;
  
  reg n;
  
  always @* begin
    M_adderUnit_a = a;
    M_adderUnit_b = b;
    M_adderUnit_alufn_signal = alufn_sig;
    z = M_adderUnit_z;
    v = M_adderUnit_v;
    n = M_adderUnit_n;
    nvz[0+0-:1] = z;
    nvz[1+0-:1] = v;
    nvz[2+0-:1] = n;
    M_compareUnit_z = z;
    M_compareUnit_v = v;
    M_compareUnit_n = n;
    M_compareUnit_alufn_signal = alufn_sig;
    M_booleanUnit_alufn_signal = alufn_sig;
    M_booleanUnit_a = a;
    M_booleanUnit_b = b;
    M_shifterUnit_a = a;
    M_shifterUnit_b = b[0+4-:5];
    M_shifterUnit_alufn_signal = alufn_sig;
    
    case (alufn_sig[4+1-:2])
      2'h0: begin
        out = M_adderUnit_out;
      end
      2'h1: begin
        out = M_booleanUnit_out;
      end
      2'h2: begin
        out = M_shifterUnit_out;
      end
      2'h3: begin
        out = M_compareUnit_out;
      end
      default: begin
        out = 16'h0000;
      end
    endcase
  end
endmodule
