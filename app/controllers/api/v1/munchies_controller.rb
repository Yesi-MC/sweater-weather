class Api::V1::MunchiesController < ApplicationController
  
  def index

    destination = params[:destination]
    conn = Faraday.new('http://www.mapquestapi.com') do |f|
      f.params['key'] = ENV['map_api_key']
    end
    response = conn.get("/directions/v2/route") do |r|
      r.params['from'] = params[:start]
      r.params['to'] = params[:destination]
    end
    distance = JSON.parse(response.body, symbolize_names: true)
    travel_time = distance[:route][:formatted_time]

    long = distance[:route][:boundingBox][:lr][:lng]
    lat = distance[:route][:boundingBox][:lr][:lat]

    conn_2 = Faraday.new('https://api.openweathermap.org') do |f|
      f.params['appid'] = ENV['weather_api_key']
    end

    response_2 = conn_2.get("/data/2.5/onecall") do |r|
      r.params['lat'] = lat
      r.params['lon'] = long
      r.params['exclude'] = "minutely,alerts,hourly,daily"
      r.params['units'] = "imperial"
    end

    weather = JSON.parse(response_2.body, symbolize_names: true)

    summary = weather[:current][:weather][0][:description] 
    temp = weather[:current][:temp] 

    conn_3 = Faraday.new('https://api.yelp.com') do |f|
      f.headers['Authorization'] = ENV['yelp_api_key']
    end

    response_3 = conn_3.get("/v3/businesses/search") do |r|
      r.params['term'] = params[:food]
      r.params['location'] = params[:destination]
    end

    food = JSON.parse(response_3.body, symbolize_names: true) 
    name = food[:businesses][0][:name]
    address = food[:businesses][0][:location][:display_address]

    munchie = Munchie.new(distance, weather, food, destination)

    render json: MunchieSerializer.new(munchie)
  end 
end 