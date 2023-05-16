package perfect.random
import chisel3.iotesters.Driver
import chisel3.iotesters.PeekPokeTester
import chisel3.stage.ChiselStage
import chiseltest._
import org.scalatest._
//import flatspec.AnyFlatSpec
//import matchers.should.Matchers

class TestCRC(dut : perfect.random.CRC) extends PeekPokeTester(dut) {

//  def readBits(dut: CRC, n: Int) = {
//    var bits = 0
//    for (i <- (n - 1) to 0 by -1) {
//      val bit = dut.io.out.peek().litValue
//      step(1)
//      bits |= (bit.toInt << i)
//    }
//    bits
//  }

  def writeBits(dut: CRC, d: Int, n: Int) = {
    for (i <- (n - 1) to 0 by -1) {
      val bit = (d & 1 << i) != 0
      poke(dut.io.in, bit)
      step(1)
    }
  }

  def writeString(dut: CRC, s: String) = {
    s.foreach { c => writeBits(dut, c, 8) }
  }

  step(1)
  poke(dut.io.en, true)
  writeString(dut, "foo")
//  expect(dut.io.debug, 0xaf96)
  step(1)
  poke(dut.io.en, false)
  step(1)
//  readBits(dut, 16)

//  it should "calculate the CRC" in {
//    test(new CRC(16, 0x1021)) { dut =>
//      dut.io.en.poke(true)
//      writeString(dut, "foo")
//      dut.io.debug.expect(0xaf96)
//      dut.io.en.poke(false)
//      readBits(dut, 16) shouldBe 0xaf96
//    }
//  }

//  it should "check the CRC" in {
//    test(new CRC(16, 0x1021)) { dut =>
//      dut.io.en.poke(true)
//      writeString(dut, "foo")
//      writeBits(dut, 0xaf96, 16)
//      dut.io.debug.expect(0)
//      dut.io.en.poke(false)
//      readBits(dut, 16) shouldBe 0
//    }
//  }
}

object TestCRC extends App {
  chisel3.iotesters.Driver(() => new CRC(
    16, 0x1021)) {
    c => new TestCRC(c)
  }
}

object TestCRCVerilog extends App {
  (new ChiselStage).emitVerilog(new CRC(
    16, 0x1021
  ))
}

class WaveformCRC extends FlatSpec with Matchers {
  "WaveformCRC" should "pass" in {
    Driver.execute(Array("--generate-vcd-output", "on"), () => new CRC(
      16, 0x1021
    )) {
      c => new TestCRC(c)
    }
  }
}