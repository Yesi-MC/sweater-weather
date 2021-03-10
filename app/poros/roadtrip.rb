class Roadtrip 
  attr_reader :start_city, 
              :end_city, 
              :travel_time, 
              :weather_at_eta
              
  def initialize(start_location, end_location, trip_travel_time, arrival_weather)
    @start_city = start_location
    @end_city = end_location
    @travel_time = trip_travel_time
    @weather_at_eta = {
                        temperature: arrival_weather[:temp], 
                        conditions: arrival_weather[:weather][0][:description] 
                      }
  end
end