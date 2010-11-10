#Programa em ruby que le os dados da porta serial

require 'rubygems'
require 'rest-client'
require "serialport"

sp = SerialPort.new "/dev/ttyUSB0" #Caso use windows a porta será COM7

  while true do
      #RestClient.post 'http://localhost:4567/dados', :valor => '4'
RestClient.post 'http://localhost:4567/dados', :valor => '4', :content_type => 'application/x-www-form-urlencoded; charset=UTF-8'
  end
sp.close

