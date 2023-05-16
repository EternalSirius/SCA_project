package perfect.random

import chisel3._

/**
 * Calculates the CRC for a stream of data.
 *
 * @param n The number of CRC bits to calculate.
 * @param g The generator polynomial.
 */
class CRC(n: Int, g: Int) extends Module {
  val io = IO(new Bundle {
    /** Enable */
    val en = Input(Bool())
    /** Input */
    val in = Input(Bool())
    /** Output */
    val out = Output(Bool())
    /** Debug */
    val debug = Output(UInt(n.W))
  })

  // Linear feedback shift register
  val lfsr = Reg(Vec(n, Bool()))

  // XOR the input bit with the last bit in the LFSR
  val bit = Mux(io.en, io.in ^ lfsr.last, false.B)

  // Load the first bit
  lfsr(0) := bit

  // Shift the LFSR bits
  for (i <- 0 until n - 1) {
    if ((g & (1 << i + 1)) != 0)
      lfsr(i + 1) := lfsr(i) ^ bit
    else
      lfsr(i + 1) := lfsr(i)
  }

  // Output
  io.out := Mux(io.en, io.in, lfsr.last)
  io.debug := lfsr.asUInt

  // Debug
  if (sys.env.get("DEBUG").contains("1")) {
    printf(p"CRC(data: ${lfsr} 0x${Hexadecimal(lfsr.asUInt)})\n")
  }
}