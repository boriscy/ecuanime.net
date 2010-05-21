require 'rubygems'
require 'sinatra'
#require 'ruby-debug'

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

  erb template
end

post '/contacto' do
 @path = 'contacto'
 erb :contacto
end



#get '/*' do
#  erb :_404
#end
