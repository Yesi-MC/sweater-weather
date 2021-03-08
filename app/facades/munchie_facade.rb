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

    longitude = distance[:route][:boundingBox][:lr][:lng]
    latitude = distance[:route][:boundingBox][:lr][:lat]

    weather = ForecastService.current_forecast(latitude, longitude)

    food_data = FoodService.get_food_data(food, destination)
    
    munchie = Munchie.new(distance, weather, food_data, destination)

    end
  end
end