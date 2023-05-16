module CRC(
  input         clock,
  input         reset,
  input         io_en,
  input         io_in,
  output        io_out,
  output [15:0] io_debug
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
`endif // RANDOMIZE_REG_INIT
  reg  lfsr_0; // @[CRC.scala 24:17]
  reg  lfsr_1; // @[CRC.scala 24:17]
  reg  lfsr_2; // @[CRC.scala 24:17]
  reg  lfsr_3; // @[CRC.scala 24:17]
  reg  lfsr_4; // @[CRC.scala 24:17]
  reg  lfsr_5; // @[CRC.scala 24:17]
  reg  lfsr_6; // @[CRC.scala 24:17]
  reg  lfsr_7; // @[CRC.scala 24:17]
  reg  lfsr_8; // @[CRC.scala 24:17]
  reg  lfsr_9; // @[CRC.scala 24:17]
  reg  lfsr_10; // @[CRC.scala 24:17]
  reg  lfsr_11; // @[CRC.scala 24:17]
  reg  lfsr_12; // @[CRC.scala 24:17]
  reg  lfsr_13; // @[CRC.scala 24:17]
  reg  lfsr_14; // @[CRC.scala 24:17]
  reg  lfsr_15; // @[CRC.scala 24:17]
  wire  bit_ = io_en & (io_in ^ lfsr_15); // @[CRC.scala 27:16]
  wire [7:0] lo = {lfsr_7,lfsr_6,lfsr_5,lfsr_4,lfsr_3,lfsr_2,lfsr_1,lfsr_0}; // @[CRC.scala 42:20]
  wire [7:0] hi = {lfsr_15,lfsr_14,lfsr_13,lfsr_12,lfsr_11,lfsr_10,lfsr_9,lfsr_8}; // @[CRC.scala 42:20]
  assign io_out = io_en ? io_in : lfsr_15; // @[CRC.scala 41:16]
  assign io_debug = {hi,lo}; // @[CRC.scala 42:20]
  always @(posedge clock) begin
    lfsr_0 <= io_en & (io_in ^ lfsr_15); // @[CRC.scala 27:16]
    lfsr_1 <= lfsr_0; // @[CRC.scala 37:19]
    lfsr_2 <= lfsr_1; // @[CRC.scala 37:19]
    lfsr_3 <= lfsr_2; // @[CRC.scala 37:19]
    lfsr_4 <= lfsr_3; // @[CRC.scala 37:19]
    lfsr_5 <= lfsr_4 ^ bit_; // @[CRC.scala 35:30]
    lfsr_6 <= lfsr_5; // @[CRC.scala 37:19]
    lfsr_7 <= lfsr_6; // @[CRC.scala 37:19]
    lfsr_8 <= lfsr_7; // @[CRC.scala 37:19]
    lfsr_9 <= lfsr_8; // @[CRC.scala 37:19]
    lfsr_10 <= lfsr_9; // @[CRC.scala 37:19]
    lfsr_11 <= lfsr_10; // @[CRC.scala 37:19]
    lfsr_12 <= lfsr_11 ^ bit_; // @[CRC.scala 35:30]
    lfsr_13 <= lfsr_12; // @[CRC.scala 37:19]
    lfsr_14 <= lfsr_13; // @[CRC.scala 37:19]
    lfsr_15 <= lfsr_14; // @[CRC.scala 37:19]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  lfsr_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  lfsr_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  lfsr_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  lfsr_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  lfsr_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  lfsr_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  lfsr_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  lfsr_7 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  lfsr_8 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  lfsr_9 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  lfsr_10 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  lfsr_11 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  lfsr_12 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  lfsr_13 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  lfsr_14 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  lfsr_15 = _RAND_15[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
