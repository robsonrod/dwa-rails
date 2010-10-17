require "rubygems"
require "serialport"

sp = SerialPort.new "/dev/ttyUSB0"

while true do
  printf(sp.read)
end

sp.close

