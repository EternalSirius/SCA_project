circuit CRC :
  module CRC :
    input clock : Clock
    input reset : UInt<1>
    input io_en : UInt<1>
    input io_in : UInt<1>
    output io_out : UInt<1>
    output io_debug : UInt<16>

    reg lfsr_0 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), lfsr_0) @[CRC.scala 24:17]
    reg lfsr_1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), lfsr_1) @[CRC.scala 24:17]
    reg lfsr_2 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), lfsr_2) @[CRC.scala 24:17]
    reg lfsr_3 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), lfsr_3) @[CRC.scala 24:17]
    reg lfsr_4 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), lfsr_4) @[CRC.scala 24:17]
    reg lfsr_5 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), lfsr_5) @[CRC.scala 24:17]
    reg lfsr_6 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), lfsr_6) @[CRC.scala 24:17]
    reg lfsr_7 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), lfsr_7) @[CRC.scala 24:17]
    reg lfsr_8 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), lfsr_8) @[CRC.scala 24:17]
    reg lfsr_9 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), lfsr_9) @[CRC.scala 24:17]
    reg lfsr_10 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), lfsr_10) @[CRC.scala 24:17]
    reg lfsr_11 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), lfsr_11) @[CRC.scala 24:17]
    reg lfsr_12 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), lfsr_12) @[CRC.scala 24:17]
    reg lfsr_13 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), lfsr_13) @[CRC.scala 24:17]
    reg lfsr_14 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), lfsr_14) @[CRC.scala 24:17]
    reg lfsr_15 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), lfsr_15) @[CRC.scala 24:17]
    node _T = xor(io_in, lfsr_15) @[CRC.scala 27:30]
    node bit = mux(io_en, _T, UInt<1>("h0")) @[CRC.scala 27:16]
    node _T_1 = xor(lfsr_4, bit) @[CRC.scala 35:30]
    node _T_2 = xor(lfsr_11, bit) @[CRC.scala 35:30]
    node _T_3 = mux(io_en, io_in, lfsr_15) @[CRC.scala 41:16]
    node lo_lo_lo = cat(lfsr_1, lfsr_0) @[CRC.scala 42:20]
    node lo_lo_hi = cat(lfsr_3, lfsr_2) @[CRC.scala 42:20]
    node lo_lo = cat(lo_lo_hi, lo_lo_lo) @[CRC.scala 42:20]
    node lo_hi_lo = cat(lfsr_5, lfsr_4) @[CRC.scala 42:20]
    node lo_hi_hi = cat(lfsr_7, lfsr_6) @[CRC.scala 42:20]
    node lo_hi = cat(lo_hi_hi, lo_hi_lo) @[CRC.scala 42:20]
    node lo = cat(lo_hi, lo_lo) @[CRC.scala 42:20]
    node hi_lo_lo = cat(lfsr_9, lfsr_8) @[CRC.scala 42:20]
    node hi_lo_hi = cat(lfsr_11, lfsr_10) @[CRC.scala 42:20]
    node hi_lo = cat(hi_lo_hi, hi_lo_lo) @[CRC.scala 42:20]
    node hi_hi_lo = cat(lfsr_13, lfsr_12) @[CRC.scala 42:20]
    node hi_hi_hi = cat(lfsr_15, lfsr_14) @[CRC.scala 42:20]
    node hi_hi = cat(hi_hi_hi, hi_hi_lo) @[CRC.scala 42:20]
    node hi = cat(hi_hi, hi_lo) @[CRC.scala 42:20]
    node _T_4 = cat(hi, lo) @[CRC.scala 42:20]
    io_out <= _T_3 @[CRC.scala 41:10]
    io_debug <= _T_4 @[CRC.scala 42:12]
    lfsr_0 <= bit @[CRC.scala 30:11]
    lfsr_1 <= lfsr_0 @[CRC.scala 37:19]
    lfsr_2 <= lfsr_1 @[CRC.scala 37:19]
    lfsr_3 <= lfsr_2 @[CRC.scala 37:19]
    lfsr_4 <= lfsr_3 @[CRC.scala 37:19]
    lfsr_5 <= _T_1 @[CRC.scala 35:19]
    lfsr_6 <= lfsr_5 @[CRC.scala 37:19]
    lfsr_7 <= lfsr_6 @[CRC.scala 37:19]
    lfsr_8 <= lfsr_7 @[CRC.scala 37:19]
    lfsr_9 <= lfsr_8 @[CRC.scala 37:19]
    lfsr_10 <= lfsr_9 @[CRC.scala 37:19]
    lfsr_11 <= lfsr_10 @[CRC.scala 37:19]
    lfsr_12 <= _T_2 @[CRC.scala 35:19]
    lfsr_13 <= lfsr_12 @[CRC.scala 37:19]
    lfsr_14 <= lfsr_13 @[CRC.scala 37:19]
    lfsr_15 <= lfsr_14 @[CRC.scala 37:19]