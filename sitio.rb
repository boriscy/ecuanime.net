require 'rubygems'
require 'sinatra'
require 'mail'
require 'haml'


#ActiveRecord::Base.establish_connection(
#  :adapter => 'mysql',
#  :host     => 'localhost',
#  :username => 'root',
#  :password => 'demo123',
#  :database => 'polla_development'
#)

before do
  @nav = %w(inicio nosotros trabajos contacto)
end


get '/*' do
  @saludo = "Como estas"
  @path = request.env["REQUEST_PATH"].gsub(/\//, '')
  @path = 'inicio' if @path == ''
  template = :index

  case(@path)
    when ''
      template = :index
    when 'nosotros'
      template = :nosotros
    when 'trabajos'
      template = :trabajos
    when 'contacto'
      template = :contacto
  end

  haml template
end

post '/contacto' do
  
  @params = params

  mail = Mail.new do
    subject 'Consulta ecuanime.net'
    to 'boriscyber@gmail.com'
    body @params['consulta']
    from @params['email']
  end

  mail.deliver!

  @path = 'contacto'
  erb :contacto
end


#get '/*' do
#  erb :_404
#end
