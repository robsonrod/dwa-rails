require "rubygems"
require "sinatra"
require "serialport"

sp = SerialPort.new "/dev/ttyUSB0"

get "/" do
  #sp.write 1
  "Feito!"
end

