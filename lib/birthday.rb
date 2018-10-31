require 'date'

class Birthday
  def self.calculate(date1, name)
    date1 = Date.today.year, Date.parse(date1).month, Date.parse(date1).day
    date2 = Date.today
    name = name
    if date1 = date2
      return "Happy birthday #{name}"
    elsif date1 > date2
      diff = date1.mjd - date2.mjd
      return "#{diff} till your birthday #{name}"
    else
      diff = Date.new(Date.today.year + 1, date1.month, date1.day).mjd - date2.mjd
      return "#{diff} till your birthday #{name}"
    end
  end
end
