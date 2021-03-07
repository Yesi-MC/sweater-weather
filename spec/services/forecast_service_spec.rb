require 'rails_helper'

RSpec.describe ForecastService do
  describe 'forecast' do
    it 'sends a request to obtain forecast info' do
      data = ForecastService.forecast('39.7385', '-104.9849')

      expect(data).to be_a(Hash) 

      expect(data).to have_key(:current)
      expect(data[:current]).to be_a(Hash)

      weather_data = data[:current]

      expect(weather_data).to have_key(:dt)
      expect(weather_data[:dt]).to be_a(Numeric)

      expect(weather_data).to have_key(:sunrise)
      expect(weather_data[:sunrise]).to be_a(Numeric)

      expect(weather_data).to have_key(:sunset)
      expect(weather_data[:sunset]).to be_a(Numeric)

      expect(weather_data).to have_key(:temp)
      expect(weather_data[:temp]).to be_a(Numeric)

      expect(weather_data).to have_key(:feels_like)
      expect(weather_data[:feels_like]).to be_a(Numeric)

      expect(weather_data).to have_key(:humidity)
      expect(weather_data[:humidity]).to be_a(Numeric)

      expect(weather_data).to have_key(:uvi)
      expect(weather_data[:uvi]).to be_a(Numeric)

      expect(weather_data).to have_key(:visibility)
      expect(weather_data[:visibility]).to be_a(Numeric)

      weather_description = data[:current][:weather][0]

      expect(weather_description).to have_key(:description)
      expect(weather_description[:description]).to be_a(String)

      expect(weather_description).to have_key(:icon)
      expect(weather_description[:icon]).to be_a(String)
    end
  end
end