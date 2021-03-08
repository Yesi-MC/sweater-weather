class MunchieFacade 
  class << self 

    def get_munchies(destination, start_location, food)
      distance = LocationService.get_distance(start_location, destination)

      longitude = distance[:route][:boundingBox][:lr][:lng]
      latitude = distance[:route][:boundingBox][:lr][:lat]

      weather = ForecastService.current_forecast(latitude, longitude)

      food_data = FoodService.get_food_data(food, destination)

      Munchie.new(distance, weather, food_data, destination)
    end

  end
end