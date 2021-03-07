class HourlyWeather 
  attr_reader :time,
              :temperature,
              :conditions, 
              :icon

  def initialize(data)
    # require 'pry'; binding.pry
    @time = DateTime.strptime(data[:dt].to_s, '%s')
    @temperature = data[:temp]
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end
end 
