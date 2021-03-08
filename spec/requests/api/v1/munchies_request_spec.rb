require 'rails_helper'

describe "Yelp API Endpoints" do
  describe "can get munchies info" do 
    it "obtains food, weather, and travel data info" do 

      query_params = ({ start: 'Denver,Co', destination: 'Pueblo, Co', food: 'hamburger' })

      get '/api/v1/munchies', params: query_params 

      expect(response).to be_successful 
      expect(response.status).to eq(200)

      munchies = JSON.parse(response.body, symbolize_names: true)

      expect(munchies).to be_a(Hash)
      expect(munchies).to have_key(:data)
      expect(munchies[:data]).to be_a(Hash)

      expect(munchies[:data]).to have_key(:id)
      expect(munchies[:data][:id]).to eq(nil)

      expect(munchies[:data]).to have_key(:type)
      expect(munchies[:data][:type]).to eq('munchie')

      expect(munchies[:data]).to have_key(:attributes)
      expect(munchies[:data][:attributes]).to be_a(Hash)

      munchie_data = munchies[:data][:attributes]

      expect(munchie_data).to have_key(:destination_city)
      expect(munchie_data[:destination_city]).to be_a(String)

      expect(munchie_data).to have_key(:travel_time)
      expect(munchie_data[:travel_time]).to be_a(String)

      expect(munchie_data).to have_key(:forecast)
      expect(munchie_data[:forecast]).to be_a(Hash)

      expect(munchie_data).to have_key(:restaurant)
      expect(munchie_data[:restaurant]).to be_a(Hash)

      forecast_data = munchies[:data][:attributes][:forecast]

      expect(forecast_data).to have_key(:summary)
      expect(forecast_data[:summary]).to be_a(String)

      expect(forecast_data).to have_key(:temperature)
      expect(forecast_data[:temperature]).to be_a(String)

      rest_data = munchies[:data][:attributes][:restaurant]

      expect(rest_data).to have_key(:name)
      expect(rest_data[:name]).to be_a(String)

      expect(rest_data).to have_key(:address)
      expect(rest_data[:address]).to be_a(String)
    end
  end
end