#Programa em ruby que le os dados da porta serial do meu computador mandar para o
#aplicação web

require 'rubygems'
require 'rest-client'
require "serialport"

sp = SerialPort.new "/dev/ttyUSB0"

  while true do
     @valor = String(sp.read.strip)
    if (!@valor.empty?) then
     RestClient.post 'http://arduinoonruby.heroku.com/dados', :valor =>  @valor, :content_type => 'application/x-www-form-urlencoded'
    end
  end
sp.close

