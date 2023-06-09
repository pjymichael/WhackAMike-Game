/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module regfile_7 (
    input clk,
    input rst,
    input [3:0] write_addrc,
    input [3:0] read_addra,
    input [3:0] read_addrb,
    input we,
    input [15:0] data,
    output reg [15:0] out_reada,
    output reg [15:0] out_readb,
    output reg [15:0] out_mikeled,
    output reg [15:0] out_exmikeled,
    output reg [15:0] out_p1score,
    output reg [15:0] out_p2score,
    output reg [15:0] mikeout,
    output reg [15:0] exmikeout,
    output reg [15:0] p1press_seq,
    output reg [15:0] p2press_seq,
    output reg [0:0] winp1,
    output reg [0:0] winp2,
    output reg [15:0] timer_debug
  );
  
  
  
  reg [15:0] M_p1_score_d, M_p1_score_q = 1'h0;
  reg [15:0] M_p2_score_d, M_p2_score_q = 1'h0;
  reg [15:0] M_p1_win_d, M_p1_win_q = 1'h0;
  reg [15:0] M_p2_win_d, M_p2_win_q = 1'h0;
  reg [15:0] M_pos_mike_d, M_pos_mike_q = 1'h0;
  reg [15:0] M_pos_exmike_d, M_pos_exmike_q = 1'h0;
  reg [15:0] M_p1_buttonpress_d, M_p1_buttonpress_q = 1'h0;
  reg [15:0] M_p2_buttonpress_d, M_p2_buttonpress_q = 1'h0;
  reg [15:0] M_out_mike_d, M_out_mike_q = 1'h0;
  reg [15:0] M_out_exmike_d, M_out_exmike_q = 1'h0;
  reg [15:0] M_round_num_d, M_round_num_q = 1'h0;
  reg [15:0] M_timer_d, M_timer_q = 1'h0;
  reg [15:0] M_check_round_d, M_check_round_q = 1'h0;
  reg [15:0] M_check_timer_d, M_check_timer_q = 1'h0;
  reg [15:0] M_temp_one_d, M_temp_one_q = 1'h0;
  reg [15:0] M_temp_two_d, M_temp_two_q = 1'h0;
  
  always @* begin
    M_p1_score_d = M_p1_score_q;
    M_p1_win_d = M_p1_win_q;
    M_pos_mike_d = M_pos_mike_q;
    M_out_exmike_d = M_out_exmike_q;
    M_p2_buttonpress_d = M_p2_buttonpress_q;
    M_check_timer_d = M_check_timer_q;
    M_p1_buttonpress_d = M_p1_buttonpress_q;
    M_round_num_d = M_round_num_q;
    M_temp_one_d = M_temp_one_q;
    M_p2_score_d = M_p2_score_q;
    M_timer_d = M_timer_q;
    M_p2_win_d = M_p2_win_q;
    M_temp_two_d = M_temp_two_q;
    M_pos_exmike_d = M_pos_exmike_q;
    M_check_round_d = M_check_round_q;
    M_out_mike_d = M_out_mike_q;
    
    out_reada = 16'h0000;
    out_readb = 16'h0000;
    if (we) begin
      
      case (write_addrc)
        4'h0: begin
          M_p1_score_d = data;
        end
        4'h1: begin
          M_p2_score_d = data;
        end
        4'h2: begin
          M_p1_win_d = data;
        end
        4'h3: begin
          M_p2_win_d = data;
        end
        4'h4: begin
          M_pos_mike_d = data;
        end
        4'h5: begin
          M_pos_exmike_d = data;
        end
        4'h6: begin
          M_p1_buttonpress_d = data;
        end
        4'h7: begin
          M_p2_buttonpress_d = data;
        end
        4'h8: begin
          M_out_mike_d = data;
        end
        4'h9: begin
          M_out_exmike_d = data;
        end
        4'ha: begin
          M_round_num_d = data;
        end
        4'hb: begin
          M_timer_d = data;
        end
        4'hc: begin
          M_check_round_d = data;
        end
        4'hd: begin
          M_check_timer_d = data;
        end
        4'he: begin
          M_temp_one_d = data;
        end
        4'hf: begin
          M_temp_two_d = data;
        end
      endcase
    end
    
    case (read_addra)
      4'h0: begin
        out_reada = M_p1_score_q;
      end
      4'h1: begin
        out_reada = M_p2_score_q;
      end
      4'h2: begin
        out_reada = M_p1_win_q;
      end
      4'h3: begin
        out_reada = M_p2_win_q;
      end
      4'h4: begin
        out_reada = M_pos_mike_q;
      end
      4'h5: begin
        out_reada = M_pos_exmike_q;
      end
      4'h6: begin
        out_reada = M_p1_buttonpress_q;
      end
      4'h7: begin
        out_reada = M_p2_buttonpress_q;
      end
      4'h8: begin
        out_reada = M_out_mike_q;
      end
      4'h9: begin
        out_reada = M_out_exmike_q;
      end
      4'ha: begin
        out_reada = M_round_num_q;
      end
      4'hb: begin
        out_reada = M_timer_q;
      end
      4'hc: begin
        out_reada = M_check_round_q;
      end
      4'hd: begin
        out_reada = M_check_timer_q;
      end
      4'he: begin
        out_reada = M_temp_one_q;
      end
      4'hf: begin
        out_reada = M_temp_two_q;
      end
      default: begin
        out_reada = 1'h0;
      end
    endcase
    
    case (read_addrb)
      4'h0: begin
        out_readb = M_p1_score_q;
      end
      4'h1: begin
        out_readb = M_p2_score_q;
      end
      4'h2: begin
        out_readb = M_p1_win_q;
      end
      4'h3: begin
        out_readb = M_p2_win_q;
      end
      4'h4: begin
        out_readb = M_pos_mike_q;
      end
      4'h5: begin
        out_readb = M_pos_exmike_q;
      end
      4'h6: begin
        out_readb = M_p1_buttonpress_q;
      end
      4'h7: begin
        out_readb = M_p2_buttonpress_q;
      end
      4'h8: begin
        out_readb = M_out_mike_q;
      end
      4'h9: begin
        out_readb = M_out_exmike_q;
      end
      4'ha: begin
        out_readb = M_round_num_q;
      end
      4'hb: begin
        out_readb = M_timer_q;
      end
      4'hc: begin
        out_readb = M_check_round_q;
      end
      4'hd: begin
        out_readb = M_check_timer_q;
      end
      4'he: begin
        out_readb = M_temp_one_q;
      end
      4'hf: begin
        out_readb = M_temp_two_q;
      end
      default: begin
        out_readb = 1'h0;
      end
    endcase
    out_mikeled = M_out_mike_q;
    out_exmikeled = M_out_exmike_q;
    out_p1score = M_p1_score_q;
    out_p2score = M_p2_score_q;
    winp1 = M_p1_win_q[0+0-:1];
    winp2 = M_p2_win_q[0+0-:1];
    mikeout = M_out_mike_q;
    exmikeout = M_out_exmike_q;
    p1press_seq = M_p1_buttonpress_q;
    p2press_seq = M_p2_buttonpress_q;
    timer_debug = M_timer_q;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_p1_score_q <= 1'h0;
      M_p2_score_q <= 1'h0;
      M_p1_win_q <= 1'h0;
      M_p2_win_q <= 1'h0;
      M_pos_mike_q <= 1'h0;
      M_pos_exmike_q <= 1'h0;
      M_p1_buttonpress_q <= 1'h0;
      M_p2_buttonpress_q <= 1'h0;
      M_out_mike_q <= 1'h0;
      M_out_exmike_q <= 1'h0;
      M_round_num_q <= 1'h0;
      M_timer_q <= 1'h0;
      M_check_round_q <= 1'h0;
      M_check_timer_q <= 1'h0;
      M_temp_one_q <= 1'h0;
      M_temp_two_q <= 1'h0;
    end else begin
      M_p1_score_q <= M_p1_score_d;
      M_p2_score_q <= M_p2_score_d;
      M_p1_win_q <= M_p1_win_d;
      M_p2_win_q <= M_p2_win_d;
      M_pos_mike_q <= M_pos_mike_d;
      M_pos_exmike_q <= M_pos_exmike_d;
      M_p1_buttonpress_q <= M_p1_buttonpress_d;
      M_p2_buttonpress_q <= M_p2_buttonpress_d;
      M_out_mike_q <= M_out_mike_d;
      M_out_exmike_q <= M_out_exmike_d;
      M_round_num_q <= M_round_num_d;
      M_timer_q <= M_timer_d;
      M_check_round_q <= M_check_round_d;
      M_check_timer_q <= M_check_timer_d;
      M_temp_one_q <= M_temp_one_d;
      M_temp_two_q <= M_temp_two_d;
    end
  end
  
endmodule
