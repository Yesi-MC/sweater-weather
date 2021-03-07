class ForecastService
  class << self 

    def forecast(latitude, longitude)
      response = conn.get("/data/2.5/onecall") do |r|
        r.params['lat'] = latitude
        r.params['lon'] = longitude
        r.params['exclude'] = "minutely,alerts"
        r.params['units'] = "imperial"
      end
      parse_data(response)
    end

    private 

    def conn 
      Faraday.new('https://api.openweathermap.org') do |f|
        f.params['appid'] = ENV['weather_api_key']
      end
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true) 
    end
  end
end