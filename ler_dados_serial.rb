require "rubygems"
require "serialport"

#Todos os parametros possiveis para a configuração
#Por padrão o serialport os usa, caso mude use a seguinte codificação
#port_str = "/dev/ttyUSB0"
#baud_rate = 9600
#data_bits = 8
#stop_bits = 1
#parity = SerialPort::NONE
#sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

sp = SerialPort.new "/dev/ttyUSB0"

while true do
  printf(sp.read)
end

sp.close

