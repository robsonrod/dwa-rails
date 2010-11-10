require "rubygems"
require "sinatra"

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

