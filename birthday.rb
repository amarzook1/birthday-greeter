require "sinatra"
require "date"

set :session_secret, 'super secret'

get '/' do
    @name = params[:name]
    @bday = params[:bday]
    if params[:bday] != nil
      @date1 = Date.new(Date.today.year, Date.parse(@bday).month, Date.parse(@bday).day)
      if @date1 > Date.today
          @diff = @date1.mjd - Date.today.mjd
      else
          @diff = Date.new(Date.today.year + 1, @date1.month, @date1.day).mjd - Date.today.mjd
      end
    end
    erb :index
end