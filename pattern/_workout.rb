# These are common tests for all testers
ss "Verify a register API write"
$dut.reg(:reg32).write!(0x1234_5678)

ss "Verify a register API read"
$dut.reg(:reg32).read!

if $tester.jtag?
  ss "Verify write_dr with a register"
  $tester.write_dr $dut.reg(:reg32)
  ss "Verify write_dr with a data value"
  $tester.write_dr 0x1122, :size => 16
  ss "Verify read_dr with a register"
  $tester.read_dr $dut.reg(:reg32)
  ss "Verify read_dr with a data value"
  $tester.read_dr 0x1122, :size => 16
  ss "Verify write_ir with a register"
  $tester.write_ir $dut.reg(:reg32)
  ss "Verify write_ir with a data value"
  $tester.write_ir 0x1122, :size => 16
  ss "Verify read_ir with a register"
  $tester.read_ir $dut.reg(:reg32)
  ss "Verify read_ir with a data value"
  $tester.read_ir 0x1122, :size => 16
end

ss "Verify write_register method"
$tester.write_register $dut.reg(:reg32)
ss "Verify read_register method"
$tester.read_register $dut.reg(:reg32)
ss "Verify write8" 
$tester.write8 0x55, :address => 0x12
ss "Verify write16" 
$tester.write16 0x55AA, :address => 0x12
ss "Verify write32" 
$tester.write32 0x55AA_3344, :address => 0x12

ss "Verify read8"
$tester.read8 0x55, :address => 0x12
ss "Verify read16"
$tester.read16 0x55AA, :address => 0x12
ss "Verify read32"
$tester.read32 0x55AA_3344, :address => 0x12
ss "Verify read32, optimized"
$tester.read32 0x55AA_3344, address: 0x12, optimize:true

ss "Verify Array of 32-bit data"
$tester.read32 [0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF], address: 0x12
ss "Verify Array of 32-bit data, optimized"
$tester.read32 [0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF], address: 0x12, optimize: true

ss "Verify write with a register" 
$tester.write $dut.reg(:reg32)
ss "Verify write with a data value" 
$tester.write 0x55, :address => 0x12, :size => 8
ss "Verify read with a register" 
$tester.read $dut.reg(:reg32)
ss "Verify read with a register, optimized" 
$tester.read $dut.reg(:reg32), optimize: true
ss "Verify read with register and following 3 words, optimized" 
$tester.read $dut.reg(:reg32), number: 4, optimize: true
ss "Verify read with an 8-bit data value" 
$tester.read 0x55, :address => 0x12, :size => 8
ss "Verify read with a 16-bit data value" 
$tester.read 0x5555, :address => 0x12, :size => 16
ss "Verify read with a 32-bit data value" 
$tester.read 0x55555555, :address => 0x12, :size => 32


ss "Verify delay of 10k mS"
$tester.delay(10000)
