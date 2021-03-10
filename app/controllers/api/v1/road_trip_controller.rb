class Api::V1::RoadTripController < ApplicationController

  def create 
    user = User.find_by(api_key: params[:api_key] )
    start_location = params[:origin]
    end_location = params[:destination]

    conn = Faraday.new('http://www.mapquestapi.com') do |f|
      f.params['key'] = ENV['map_api_key']
    end 
    response = conn.get("/directions/v2/route") do |r|
      r.params['from'] = start_location
      r.params['to'] = end_location
    end

    response2 = conn.get("/geocoding/v1/address") do |r|
      r.params['location'] = end_location
    end

    coordinates = JSON.parse(response2.body, symbolize_names: true)
    distance = JSON.parse(response.body, symbolize_names: true)

    latitude = coordinates[:results][0][:locations][0][:latLng][:lat]
    longitude = coordinates[:results][0][:locations][0][:latLng][:lng]

    conn3 = Faraday.new('https://api.openweathermap.org') do |f|
      f.params['appid'] = ENV['weather_api_key']
    end

    response3 = conn3.get("/data/2.5/onecall") do |r|
      r.params['lat'] = latitude
      r.params['lon'] = longitude
      r.params['exclude'] = "minutely,alerts"
      r.params['units'] = "imperial"
    end
    weathers = JSON.parse(response3.body, symbolize_names: true)
    trip_travel_time = distance[:route][:formattedTime]
    trip_time = get_time_block(trip_travel_time)
    arrival_weather = weathers[:hourly][trip_time]
    roadtrip = Roadtrip.new(start_location, end_location, trip_travel_time, arrival_weather )
    render json: RoadtripSerializer.new(roadtrip)
  end

  def get_time_block(trip_duration) 
    if Time.parse(trip_duration).min < 30
      Time.parse(trip_duration).hour 
    else 
      Time.parse(trip_duration).hour + 1 
    end
  end

  


end 

