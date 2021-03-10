class LocationService 
  class << self 

    def location(locale) 
       response = conn.get("/geocoding/v1/address") do |r|
        r.params['location'] = locale
      end
      parse_data(response)
    end 

    def get_travel_time(start_location, end_location)
      response = conn.get("/directions/v2/route") do |r|
        r.params['from'] = start_location
        r.params['to'] = end_location
      end
        parse_data(response)
    end

    private 

    def conn 
      conn = Faraday.new('http://www.mapquestapi.com') do |f|
        f.params['key'] = ENV['map_api_key']
      end
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end