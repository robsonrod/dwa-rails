require "rubygems"
require "sinatra"
require "sequel"

module Points
  def self.dados
    @@dados ||= make
  end

  def self.criabase
    db = Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://arduino.db')
    cria_tabelas(db)
    db[:points]
  end

  def self.cria_tabelas(db)
    db.create_table :dadosarduino do
    primary_key :id
    Integer :valor
    timestamp :timestamp
  end
  rescue Sequel::DatabaseError
  end
end

get '/' do
  erb :index
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

