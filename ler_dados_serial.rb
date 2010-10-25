#Programa em ruby que le os dados da porta serial

require "rubygems"
require "serialport"

sp = SerialPort.new "/dev/ttyUSB0" #Caso use windows a porta será COM7

while true do
  printf(sp.read)
end

sp.close

