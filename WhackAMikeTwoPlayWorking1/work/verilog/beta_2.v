/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module beta_2 (
    input clk,
    input rst,
    input [4:0] p1_button,
    input [4:0] p2_button,
    output reg [15:0] out_mike,
    output reg [15:0] out_dynamike,
    output reg [7:0] segments_p1,
    output reg [1:0] selectors_p1,
    output reg [7:0] segments_p2,
    output reg [1:0] selectors_p2,
    output reg [7:0] segments_win,
    output reg [1:0] selectors_win
  );
  
  
  
  reg [15:0] inputAlu_a;
  
  reg [15:0] inputAlu_b;
  
  reg [3:0] p1score;
  
  reg [3:0] p2score;
  
  reg [0:0] p1win;
  
  reg [0:0] p2win;
  
  wire [16-1:0] M_aluUnit_out;
  wire [3-1:0] M_aluUnit_nvz;
  reg [16-1:0] M_aluUnit_a;
  reg [16-1:0] M_aluUnit_b;
  reg [6-1:0] M_aluUnit_alufn_sig;
  alu_5 aluUnit (
    .a(M_aluUnit_a),
    .b(M_aluUnit_b),
    .alufn_sig(M_aluUnit_alufn_sig),
    .out(M_aluUnit_out),
    .nvz(M_aluUnit_nvz)
  );
  
  wire [1-1:0] M_round_timer_detector_out;
  reg [1-1:0] M_round_timer_detector_in;
  edge_detector_3 round_timer_detector (
    .clk(clk),
    .in(M_round_timer_detector_in),
    .out(M_round_timer_detector_out)
  );
  wire [6-1:0] M_controlUnit_alufn;
  wire [3-1:0] M_controlUnit_asel;
  wire [4-1:0] M_controlUnit_bsel;
  wire [1-1:0] M_controlUnit_wdsel;
  wire [1-1:0] M_controlUnit_we;
  wire [4-1:0] M_controlUnit_rc;
  wire [4-1:0] M_controlUnit_ra;
  wire [4-1:0] M_controlUnit_rb;
  reg [16-1:0] M_controlUnit_ra_datain;
  reg [16-1:0] M_controlUnit_rb_datain;
  reg [8-1:0] M_controlUnit_p1buttonpress;
  reg [1-1:0] M_controlUnit_decrease_timer;
  reg [5-1:0] M_controlUnit_p1_button;
  reg [5-1:0] M_controlUnit_p2_button;
  reg [8-1:0] M_controlUnit_p2buttonpress;
  control_6 controlUnit (
    .clk(clk),
    .rst(rst),
    .ra_datain(M_controlUnit_ra_datain),
    .rb_datain(M_controlUnit_rb_datain),
    .p1buttonpress(M_controlUnit_p1buttonpress),
    .decrease_timer(M_controlUnit_decrease_timer),
    .p1_button(M_controlUnit_p1_button),
    .p2_button(M_controlUnit_p2_button),
    .p2buttonpress(M_controlUnit_p2buttonpress),
    .alufn(M_controlUnit_alufn),
    .asel(M_controlUnit_asel),
    .bsel(M_controlUnit_bsel),
    .wdsel(M_controlUnit_wdsel),
    .we(M_controlUnit_we),
    .rc(M_controlUnit_rc),
    .ra(M_controlUnit_ra),
    .rb(M_controlUnit_rb)
  );
  wire [16-1:0] M_regUnit_out_reada;
  wire [16-1:0] M_regUnit_out_readb;
  wire [16-1:0] M_regUnit_out_mikeled;
  wire [16-1:0] M_regUnit_out_exmikeled;
  wire [16-1:0] M_regUnit_out_p1score;
  wire [16-1:0] M_regUnit_out_p2score;
  wire [16-1:0] M_regUnit_mikeout;
  wire [16-1:0] M_regUnit_exmikeout;
  wire [16-1:0] M_regUnit_p1press_seq;
  wire [16-1:0] M_regUnit_p2press_seq;
  wire [1-1:0] M_regUnit_winp1;
  wire [1-1:0] M_regUnit_winp2;
  wire [16-1:0] M_regUnit_timer_debug;
  reg [4-1:0] M_regUnit_write_addrc;
  reg [4-1:0] M_regUnit_read_addra;
  reg [4-1:0] M_regUnit_read_addrb;
  reg [1-1:0] M_regUnit_we;
  reg [16-1:0] M_regUnit_data;
  regfile_7 regUnit (
    .clk(clk),
    .rst(rst),
    .write_addrc(M_regUnit_write_addrc),
    .read_addra(M_regUnit_read_addra),
    .read_addrb(M_regUnit_read_addrb),
    .we(M_regUnit_we),
    .data(M_regUnit_data),
    .out_reada(M_regUnit_out_reada),
    .out_readb(M_regUnit_out_readb),
    .out_mikeled(M_regUnit_out_mikeled),
    .out_exmikeled(M_regUnit_out_exmikeled),
    .out_p1score(M_regUnit_out_p1score),
    .out_p2score(M_regUnit_out_p2score),
    .mikeout(M_regUnit_mikeout),
    .exmikeout(M_regUnit_exmikeout),
    .p1press_seq(M_regUnit_p1press_seq),
    .p2press_seq(M_regUnit_p2press_seq),
    .winp1(M_regUnit_winp1),
    .winp2(M_regUnit_winp2),
    .timer_debug(M_regUnit_timer_debug)
  );
  wire [1-1:0] M_slow_timer_value;
  counter_8 slow_timer (
    .clk(clk),
    .rst(rst),
    .value(M_slow_timer_value)
  );
  wire [5-1:0] M_randomiser_out;
  random_9 randomiser (
    .clk(clk),
    .rst(rst),
    .out(M_randomiser_out)
  );
  wire [5-1:0] M_randomiser_dynamike_out;
  random_dynamike_10 randomiser_dynamike (
    .clk(clk),
    .rst(rst),
    .out(M_randomiser_dynamike_out)
  );
  wire [7-1:0] M_seg_seg;
  wire [2-1:0] M_seg_sel;
  reg [8-1:0] M_seg_values;
  multi_seven_seg_p1_11 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  wire [7-1:0] M_segp2_seg;
  wire [2-1:0] M_segp2_sel;
  reg [8-1:0] M_segp2_values;
  multi_seven_seg_p2_12 segp2 (
    .clk(clk),
    .rst(rst),
    .values(M_segp2_values),
    .seg(M_segp2_seg),
    .sel(M_segp2_sel)
  );
  wire [7-1:0] M_segwin_seg;
  wire [2-1:0] M_segwin_sel;
  reg [8-1:0] M_segwin_values;
  multi_seven_seg_win_13 segwin (
    .clk(clk),
    .rst(rst),
    .values(M_segwin_values),
    .seg(M_segwin_seg),
    .sel(M_segwin_sel)
  );
  
  always @* begin
    M_seg_values = 8'h00;
    M_segp2_values = 8'h00;
    M_segwin_values = 8'h00;
    segments_p1 = 8'hff;
    selectors_p1 = 4'hf;
    segments_p2 = 8'hff;
    selectors_p2 = 4'hf;
    segments_win = 8'hff;
    selectors_win = 4'hf;
    out_dynamike = M_regUnit_exmikeout;
    out_mike = M_regUnit_mikeout;
    M_round_timer_detector_in = M_slow_timer_value;
    M_controlUnit_decrease_timer = M_round_timer_detector_out;
    M_controlUnit_p1_button = p1_button;
    M_controlUnit_p2_button = p2_button;
    M_regUnit_we = M_controlUnit_we;
    M_regUnit_write_addrc = M_controlUnit_rc;
    M_regUnit_read_addra = M_controlUnit_ra;
    M_regUnit_read_addrb = M_controlUnit_rb;
    M_controlUnit_ra_datain = M_regUnit_out_reada;
    M_controlUnit_rb_datain = M_regUnit_out_readb;
    M_controlUnit_p1buttonpress = M_regUnit_p1press_seq[0+7-:8];
    M_controlUnit_p2buttonpress = M_regUnit_p2press_seq[0+7-:8];
    p1score = M_regUnit_out_p1score[0+3-:4];
    p2score = M_regUnit_out_p2score[0+3-:4];
    p1win = M_regUnit_winp1;
    p2win = M_regUnit_winp2;
    if (p1score <= 4'h9) begin
      M_seg_values = {4'h0, p1score};
    end else begin
      
      case (p1score)
        4'ha: begin
          M_seg_values = 8'h10;
        end
        4'hb: begin
          M_seg_values = 8'h11;
        end
        4'hc: begin
          M_seg_values = 8'h12;
        end
        4'hd: begin
          M_seg_values = 8'h13;
        end
        4'he: begin
          M_seg_values = 8'h14;
        end
        4'hf: begin
          M_seg_values = 8'h15;
        end
      endcase
    end
    if (p2score <= 4'h9) begin
      M_segp2_values = {4'h0, p2score};
    end else begin
      
      case (p2score)
        4'ha: begin
          M_segp2_values = 8'h10;
        end
        4'hb: begin
          M_segp2_values = 8'h11;
        end
        4'hc: begin
          M_segp2_values = 8'h12;
        end
        4'hd: begin
          M_segp2_values = 8'h13;
        end
        4'he: begin
          M_segp2_values = 8'h14;
        end
        4'hf: begin
          M_segp2_values = 8'h15;
        end
      endcase
    end
    if (p1win == 1'h1 && p2win == 1'h0) begin
      M_segwin_values = 8'h31;
    end else begin
      if (p1win == 1'h0 && p2win == 1'h1) begin
        M_segwin_values = 8'h32;
      end else begin
        M_segwin_values = 8'h30;
      end
    end
    segments_p1 = M_seg_seg;
    selectors_p1 = ~M_seg_sel;
    segments_p2 = M_segp2_seg;
    selectors_p2 = ~M_segp2_sel;
    segments_win = M_segwin_seg;
    selectors_win = ~M_segwin_sel;
    
    case (M_controlUnit_asel)
      3'h0: begin
        inputAlu_a = M_regUnit_out_reada;
      end
      3'h1: begin
        inputAlu_a = M_randomiser_out;
      end
      3'h2: begin
        inputAlu_a = 1'h1;
      end
      3'h3: begin
        inputAlu_a = 16'h000f;
      end
      3'h4: begin
        inputAlu_a = M_regUnit_out_mikeled;
      end
      3'h5: begin
        inputAlu_a = M_randomiser_dynamike_out;
      end
      3'h6: begin
        inputAlu_a = 6'h22;
      end
      3'h7: begin
        inputAlu_a = 7'h44;
      end
      default: begin
        inputAlu_a = 1'h0;
      end
    endcase
    
    case (M_controlUnit_bsel)
      4'h0: begin
        inputAlu_b = M_regUnit_out_readb;
      end
      4'h1: begin
        inputAlu_b = 16'h0000;
      end
      4'h2: begin
        inputAlu_b = 16'h0002;
      end
      4'h3: begin
        inputAlu_b = 5'h05;
      end
      4'h4: begin
        inputAlu_b = M_regUnit_out_exmikeled;
      end
      4'h5: begin
        inputAlu_b = 7'h68;
      end
      4'h6: begin
        inputAlu_b = 16'h0001;
      end
      4'h7: begin
        inputAlu_b = 8'h90;
      end
      4'h8: begin
        inputAlu_b = 16'h0003;
      end
      default: begin
        inputAlu_b = 1'h0;
      end
    endcase
    M_aluUnit_a = inputAlu_a;
    M_aluUnit_b = inputAlu_b;
    M_aluUnit_alufn_sig = M_controlUnit_alufn;
    
    case (M_controlUnit_wdsel)
      1'h0: begin
        M_regUnit_data = M_aluUnit_out;
      end
      1'h1: begin
        M_regUnit_data = 16'h0000;
      end
      default: begin
        M_regUnit_data = M_aluUnit_out;
      end
    endcase
  end
endmodule
