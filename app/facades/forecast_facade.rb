class ForecastFacade
  class << self

    def forecast(latitude, longitude)
      weather = ForecastService.forecast(latitude, longitude)
      current_weather = CurrentWeather.new(weather[:current])
      daily_weather = weather[:daily][0..4].map { |daily| DailyWeather.new(daily) }
      hourly_weather = weather[:hourly][0..7].map { |hourly| HourlyWeather.new(hourly) }
      TotalWeather.new(current_weather, daily_weather, hourly_weather) 
    end

  end
end