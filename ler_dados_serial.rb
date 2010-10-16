require "rubygems"
require "serialport"

sp = SerialPort.new "/dev/ttyUSB0"

for i in 1..10
  puts sp.read
end

