class Munchie
  attr_reader :destination_city, 
              :travel_time, 
              :forecast, 
              :restaurant 

  def initialize(distance, weather, food, destination)
    @destination_city = destination
    @travel_time = distance[:route][:formattedTime]
    @forecast = { summary: weather[:current][:weather][0][:description], temperature: weather[:current][:temp].to_s }
    @restaurant = { name: food[:businesses][0][:name], address: food[:businesses][0][:location][:display_address][0] }
  end
end