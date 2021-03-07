class DailyWeather 
  attr_reader :date,
              :sunrise,
              :sunset, 
              :max_temp, 
              :min_temp, 
              :conditions, 
              :icon

  def initialize(data)
    @date = DateTime.strptime(data[:dt].to_s, '%s')
    @sunrise = DateTime.strptime(data[:sunrise].to_s, '%s')
    @sunset = DateTime.strptime(data[:sunset].to_s, '%s')
    @max_temp = data[:temp][:max]
    @min_temp = data[:temp][:min]
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end
end 
