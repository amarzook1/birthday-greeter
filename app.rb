require "sinatra"
require "date"

set :session_secret, 'super secret'

get '/' do
  @name = params[:name]
  @bday = params[:bday]
  if params[:bday] != nil
    @date1 = Date.new(Date.today.year, Date.parse(@bday).month, Date.parse(@bday).day)
    if @date1 = Date.today
      redirect to("/happybday?name=#{@name}")
    elsif @date1 > Date.today
      @diff = @date1.mjd - Date.today.mjd
      redirect to("/countdown?name=#{@name}&diff=#{@diff}")
    else
      @diff = Date.new(Date.today.year + 1, @date1.month, @date1.day).mjd - Date.today.mjd
      redirect to("/countdown?name=#{@name}&diff=#{@diff}")
    end
  end
  erb :index
end

post '/happybday' do
  @name = params[:name]
  erb :hapbday
end

post '/countdown' do
  @name = params[:name]
  @diff = params[:diff]
  erb :countdown
end