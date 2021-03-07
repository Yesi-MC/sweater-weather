class Api::V1::ForecastController < ApplicationController
  def index
    # conn = Faraday.new('http://www.mapquestapi.com') do |f|
    #   f.params['key'] = ENV['map_api_key']
    # end
    # response = conn.get("/geocoding/v1/address") do |r|
    #   r.params['location'] = params[:location]
    # end
    # location = JSON.parse(response.body, symbolize_names: true) 

    # latitude = location[:results][0][:locations][0][:latLng][:lat]
    # longitude = location[:results][0][:locations][0][:latLng][:lng]
    locale = params[:location]
    location = LocationFacade.location(locale)
    # latitude = location[:results][0][:locations][0][:latLng][:lat]
    # longitude = location[:results][0][:locations][0][:latLng][:lng]
    latitude = location.lat
    longitude = location.long
    # conn2 = Faraday.new('https://api.openweathermap.org') do |f|
    #   f.params['appid'] = ENV['weather_api_key']
    # end
    # response2 = conn2.get("/data/2.5/onecall") do |r|
    #   r.params['lat'] = latitude
    #   r.params['lon'] = longitude
    #   r.params['exclude'] = "minutely,alerts"
    #   r.params['units'] = "imperial"
    # end
    # weather = JSON.parse(response2.body, symbolize_names: true) 
    total_weather = ForecastFacade.forecast(latitude, longitude)
    # current_weather = CurrentWeather.new(weather[:current])
    # daily_weather = weather[:daily][0..4].map { |daily| DailyWeather.new(daily) }
    # hourly_weather = weather[:hourly][0..7].map { |hourly| HourlyWeather.new(hourly) }
    # total_weather = TotalWeather.new(current_weather, daily_weather, hourly_weather) 

    render json: ForecastSerializer.new(total_weather)
  end
end 