require "rubygems"
require "sinatra"
require "serialport"

sp = SerialPort.new "/dev/ttyUSB0" #Caso use windows a porta será COM7



sp.close

get '/leitordados' do

  while true do
    printf(sp.read)
  end

  #erb :index
end

post '/dados' do
  valor = params[:valor]

  if (Integer(valor) < 850) then
    redirect "/ligado/#{valor}"
  else
    redirect "/desligado/#{valor}"
  end

end

get '/ligado/:valor' do
  erb :ligado
end

get '/desligado/:valor' do
  erb :ligado
end

