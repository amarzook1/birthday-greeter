require "sinatra/base"
require "date"
require "./lib/birthday.rb"
class BirthdayGreeter < Sinatra::Base
  get '/' do
    session[:name] = params[:name]
    session[:bday] = params[:bday]
    erb :index
  end

  post '/countdown' do
    @countdown = Birthday.calculate(params[:bday], params[:name])
    erb :countdown
  end

  run! if app_file == $0
end
