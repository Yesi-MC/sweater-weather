require 'rails_helper'

describe "Forecast API Endpoints" do
  describe "can get weather based on location" do
    it "obtains weather info" do 
  
      query_params = ({ location: 'Denver, CO' })

      get '/api/v1/forecast', params: query_params 

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.content_type).to eq("application/json")

      forecast = JSON.parse(response.body, symbolize_names: true) 
        
      expect(forecast).to be_a(Hash)
      expect(forecast).to have_key(:data)
      expect(forecast[:data]).to be_a(Hash)
      expect(forecast[:data]).to have_key(:id)
      expect(forecast[:data][:id]).to eq(nil)
      expect(forecast[:data]).to have_key(:type)
      expect(forecast[:data][:type]).to eq('forecast')
      expect(forecast[:data]).to have_key(:attributes)
      expect(forecast[:data][:attributes]).to be_a(Hash)

      current_weather = forecast[:data][:attributes][:current_weather]
      expect(current_weather).to have_key(:datetime)
      expect(current_weather[:datetime]).to be_a(String)
      expect(current_weather).to have_key(:sunrise)
      expect(current_weather[:sunrise]).to be_a(String)
      expect(current_weather).to have_key(:sunset)
      expect(current_weather[:sunset]).to be_a(String)
      expect(current_weather).to have_key(:temperature)
      expect(current_weather[:temperature]).to be_a(Float)
      expect(current_weather).to have_key(:feels_like)
      expect(current_weather[:feels_like]).to be_a(Numeric)
      expect(current_weather).to have_key(:humidity)
      expect(current_weather[:humidity]).to be_a(Numeric)
      expect(current_weather).to have_key(:uvi)
      expect(current_weather[:uvi]).to be_a(Numeric)
      expect(current_weather).to have_key(:visibility)
      expect(current_weather[:visibility]).to be_a(Numeric)
      expect(current_weather).to have_key(:conditions)
      expect(current_weather[:conditions]).to be_a(String)
      expect(current_weather).to have_key(:icon)
      expect(current_weather[:icon]).to be_a(String)

      daily_weather = forecast[:data][:attributes][:daily_weather]
      expect(daily_weather).to be_a(Array)
      expect(daily_weather.count).to eq(5)
      daily_weather.each do |weather|
        expect(weather).to have_key(:date)
        expect(weather[:date]).to be_a(String)
        expect(weather).to have_key(:sunrise)
        expect(weather[:sunrise]).to be_a(String)
        expect(weather).to have_key(:sunset)
        expect(weather[:sunset]).to be_a(String)
        expect(weather).to have_key(:max_temp)
        expect(weather[:max_temp]).to be_a(Float)
        expect(weather).to have_key(:min_temp)
        expect(weather[:min_temp]).to be_a(Float)
        expect(weather).to have_key(:conditions)
        expect(weather[:conditions]).to be_a(String)
        expect(weather).to have_key(:icon)
        expect(weather[:icon]).to be_a(String)
      end 

      hourly_weather = forecast[:data][:attributes][:hourly_weather] 
      expect(hourly_weather).to be_a(Array)
      expect(hourly_weather.count).to eq(8)
      hourly_weather.each do |weather|
        expect(weather).to have_key(:time)
        expect(weather[:time]).to be_a(String)
        expect(weather).to have_key(:temperature)
        expect(weather[:temperature]).to be_a(Float)
        expect(weather).to have_key(:conditions)
        expect(weather[:conditions]).to be_a(String)
        expect(weather).to have_key(:icon)
        expect(weather[:icon]).to be_a(String)
      end 
    end 
    it 'will return a 400 error if no query is passed' do 
      query_params = {location: ''}

      get "/api/v1/forecast", params: query_params
      
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
    end 
  end
end 