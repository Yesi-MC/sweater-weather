class LocationFacade
  class << self

    def location(locale)
      location = LocationService.location(locale)
      Location.new(location[:results][0][:locations][0][:latLng])
    end

    def travel_time(start_location, end_location)
      LocationService.get_travel_time(start_location, end_location)
    end
    
  end 
end