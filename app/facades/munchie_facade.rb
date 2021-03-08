class MunchieFacade 
  class << self 

    def get_munchies(destination, start_location, food)
      conn = Faraday.new('http://www.mapquestapi.com') do |f|
      f.params['key'] = ENV['map_api_key']
    end
    response = conn.get("/directions/v2/route") do |r|
      r.params['from'] = start_location
      r.params['to'] = destination
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
    food_data = FoodService.get_food_data(food, destination)
    munchie = Munchie.new(distance, weather, food_data, destination)


    end
  end
end