#Programa principal que vai receber os dados postados pelo arduino e criar um
#arquivo .css conforme a luminosidade

require "rubygems"
require "sinatra"

get '/' do
  file = File.new('public/dados.rdb')
  valor =  Integer(file.read)

  if (Integer(valor) < 850) then
     erb :ligado
  else
     erb :desligado
  end

end

post '/dados' do
  valor = params[:valor]
  puts(valor)
  File.open('public/dados.rdb', "w") do |file|
    file.write(valor)
  end

end

