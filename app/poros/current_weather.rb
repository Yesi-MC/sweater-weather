class CurrentWeather 
  attr_reader :datetime,
              :sunrise,
              :sunset, 
              :temperature, 
              :feels_like, 
              :humidity, 
              :uvi, 
              :visibility, 
              :conditions, 
              :icon

  def initialize(data)
    @datetime = DateTime.strptime(data[:dt].to_s, '%s')
    @sunrise = DateTime.strptime(data[:sunrise].to_s, '%s')
    @sunset = DateTime.strptime(data[:sunset].to_s, '%s')
    @temperature = data[:temp]
    @feels_like = data[:feels_like]
    @humidity = data[:humidity]
    @uvi = data[:uvi]
    @visibility = data[:visibility]
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end
end 