/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module manualPress_3 (
    input clk,
    input rst,
    input [4:0] buttons,
    input [23:0] io_dip,
    output reg [15:0] out_a,
    output reg [15:0] out_b,
    output reg [5:0] out_alufn,
    output reg [15:0] out_compute,
    output reg [2:0] out_nvz,
    output reg [23:0] io_led
  );
  
  
  
  wire [16-1:0] M_alu_unit_out;
  wire [3-1:0] M_alu_unit_nvz;
  reg [16-1:0] M_alu_unit_a;
  reg [16-1:0] M_alu_unit_b;
  reg [6-1:0] M_alu_unit_alufn_sig;
  alu_6 alu_unit (
    .rst(rst),
    .clk(clk),
    .a(M_alu_unit_a),
    .b(M_alu_unit_b),
    .alufn_sig(M_alu_unit_alufn_sig),
    .out(M_alu_unit_out),
    .nvz(M_alu_unit_nvz)
  );
  
  reg [15:0] M_areg_d, M_areg_q = 1'h0;
  
  reg [15:0] M_breg_d, M_breg_q = 1'h0;
  
  reg [5:0] M_alufn_reg_d, M_alufn_reg_q = 1'h0;
  
  reg [15:0] M_compute_d, M_compute_q = 1'h0;
  
  reg [2:0] M_nvz_d, M_nvz_q = 1'h0;
  
  reg [15:0] a;
  
  reg [15:0] b;
  
  reg [5:0] alufn_sigs;
  
  
  localparam START_checkpress = 3'd0;
  localparam A_checkpress = 3'd1;
  localparam B_checkpress = 3'd2;
  localparam ALUFN_checkpress = 3'd3;
  localparam COMPUTE_checkpress = 3'd4;
  localparam RANDOM_checkpress = 3'd5;
  
  reg [2:0] M_checkpress_d, M_checkpress_q = START_checkpress;
  
  always @* begin
    M_checkpress_d = M_checkpress_q;
    M_compute_d = M_compute_q;
    M_nvz_d = M_nvz_q;
    M_alufn_reg_d = M_alufn_reg_q;
    M_breg_d = M_breg_q;
    M_areg_d = M_areg_q;
    
    io_led = 24'h000000;
    M_alu_unit_a = 1'h0;
    M_alu_unit_b = 1'h0;
    M_alu_unit_alufn_sig = 1'h0;
    
    case (M_checkpress_q)
      START_checkpress: begin
        if (buttons[3+0-:1] | buttons[2+0-:1] | buttons[1+0-:1] | buttons[0+0-:1]) begin
          if (buttons[3+0-:1]) begin
            M_checkpress_d = COMPUTE_checkpress;
          end else begin
            if (buttons[2+0-:1]) begin
              M_checkpress_d = ALUFN_checkpress;
            end else begin
              if (buttons[1+0-:1]) begin
                M_checkpress_d = B_checkpress;
              end else begin
                if (buttons[0+0-:1]) begin
                  M_checkpress_d = A_checkpress;
                end
              end
            end
          end
        end else begin
          M_checkpress_d = START_checkpress;
        end
      end
      A_checkpress: begin
        a[0+7-:8] = io_dip[0+7-:8];
        a[8+7-:8] = io_dip[8+7-:8];
        M_areg_d = a;
        if (buttons[3+0-:1] | buttons[2+0-:1] | buttons[1+0-:1] | buttons[0+0-:1]) begin
          if (buttons[3+0-:1]) begin
            M_checkpress_d = COMPUTE_checkpress;
          end else begin
            if (buttons[2+0-:1]) begin
              M_checkpress_d = ALUFN_checkpress;
            end else begin
              if (buttons[1+0-:1]) begin
                M_checkpress_d = B_checkpress;
              end else begin
                if (buttons[0+0-:1]) begin
                  M_checkpress_d = A_checkpress;
                end
              end
            end
          end
        end else begin
          M_checkpress_d = A_checkpress;
        end
      end
      B_checkpress: begin
        b[0+7-:8] = io_dip[0+7-:8];
        b[8+7-:8] = io_dip[8+7-:8];
        M_breg_d = b;
        if (buttons[3+0-:1] | buttons[2+0-:1] | buttons[1+0-:1] | buttons[0+0-:1]) begin
          if (buttons[3+0-:1]) begin
            M_checkpress_d = COMPUTE_checkpress;
          end else begin
            if (buttons[2+0-:1]) begin
              M_checkpress_d = ALUFN_checkpress;
            end else begin
              if (buttons[1+0-:1]) begin
                M_checkpress_d = B_checkpress;
              end else begin
                if (buttons[0+0-:1]) begin
                  M_checkpress_d = A_checkpress;
                end
              end
            end
          end
        end else begin
          M_checkpress_d = B_checkpress;
        end
      end
      ALUFN_checkpress: begin
        alufn_sigs = io_dip[16+7-:8];
        M_alufn_reg_d = alufn_sigs;
        if (buttons[3+0-:1] | buttons[2+0-:1] | buttons[1+0-:1] | buttons[0+0-:1]) begin
          if (buttons[3+0-:1]) begin
            M_checkpress_d = COMPUTE_checkpress;
          end else begin
            if (buttons[2+0-:1]) begin
              M_checkpress_d = ALUFN_checkpress;
            end else begin
              if (buttons[1+0-:1]) begin
                M_checkpress_d = B_checkpress;
              end else begin
                if (buttons[0+0-:1]) begin
                  M_checkpress_d = A_checkpress;
                end
              end
            end
          end
        end else begin
          M_checkpress_d = ALUFN_checkpress;
        end
      end
      COMPUTE_checkpress: begin
        M_alu_unit_a = M_areg_q;
        M_alu_unit_b = M_breg_q;
        M_alu_unit_alufn_sig = M_alufn_reg_q;
        M_compute_d = M_alu_unit_out;
        M_nvz_d = M_alu_unit_nvz;
        if (buttons[4+0-:1] | buttons[3+0-:1] | buttons[2+0-:1] | buttons[1+0-:1] | buttons[0+0-:1]) begin
          if (buttons[3+0-:1]) begin
            M_checkpress_d = COMPUTE_checkpress;
          end else begin
            if (buttons[2+0-:1]) begin
              M_checkpress_d = ALUFN_checkpress;
            end else begin
              if (buttons[1+0-:1]) begin
                M_checkpress_d = B_checkpress;
              end else begin
                if (buttons[0+0-:1]) begin
                  M_checkpress_d = A_checkpress;
                end else begin
                  if (buttons[4+0-:1]) begin
                    M_compute_d = 1'h0;
                    M_checkpress_d = START_checkpress;
                  end
                end
              end
            end
          end
        end else begin
          M_checkpress_d = COMPUTE_checkpress;
        end
      end
    endcase
    out_a = M_areg_q;
    out_b = M_breg_q;
    out_alufn = M_alufn_reg_q;
    out_compute = M_compute_q;
    out_nvz = M_nvz_q;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_areg_q <= 1'h0;
    end else begin
      M_areg_q <= M_areg_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_alufn_reg_q <= 1'h0;
    end else begin
      M_alufn_reg_q <= M_alufn_reg_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_nvz_q <= 1'h0;
    end else begin
      M_nvz_q <= M_nvz_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_breg_q <= 1'h0;
    end else begin
      M_breg_q <= M_breg_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_checkpress_q <= 1'h0;
    end else begin
      M_checkpress_q <= M_checkpress_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_compute_q <= 1'h0;
    end else begin
      M_compute_q <= M_compute_d;
    end
  end
  
endmodule
