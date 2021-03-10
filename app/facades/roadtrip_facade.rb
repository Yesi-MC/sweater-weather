class RoadtripFacade
  class << self

    def get_roadtrip_data(start_location, end_location)
      coordinates = LocationService.location(end_location)
      distance = LocationService.get_travel_time(start_location, end_location)

      latitude = coordinates[:results][0][:locations][0][:latLng][:lat]
      longitude = coordinates[:results][0][:locations][0][:latLng][:lng]

      weathers = ForecastService.forecast(latitude, longitude)
      trip_travel_time = distance[:route][:formattedTime]
      trip_time = get_time_block(trip_travel_time)
      arrival_weather = weathers[:hourly][trip_time]
      roadtrip = Roadtrip.new(start_location, end_location, trip_travel_time, arrival_weather )
    end 

    def get_time_block(trip_travel_time) 
      if Time.parse(trip_travel_time).min < 30
        Time.parse(trip_travel_time).hour 
      else 
        Time.parse(trip_travel_time).hour + 1 
      end
    end

  end 
end