class LocationFacade
  class << self

    def location(locale)
      location = LocationService.location(locale)
      Location.new(location[:results][0][:locations][0][:latLng])
    end 
    
  end 
end