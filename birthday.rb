require "sinatra"
require "date"

set :session_secret, 'super secret'

get '/' do
    @name = params[:name]
    @bday = params[:bday]
    if params[:bday] != nil
      @date1 = Date.new(Date.today.year, Date.parse(@bday).month, Date.parse(@bday).day)
      @date1 += 1.year if Date.today >= @date1
      @date2 = Date.today
      @diff = @date1.mjd - Date.today.mjd
    end
    erb :index
end