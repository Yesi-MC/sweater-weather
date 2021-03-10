require 'rails_helper'

RSpec.describe "roadtrip endpoint" do
  describe "can get info for roadtrip" do 
    it "can return roadtrip info" do
      user = User.create(email: "whatever@example.com", password: "password", api_key: "jgn983hy48thw9begh98h4539h4")
      
      query_params = {
                      "origin": "Denver,CO",
                      "destination": "Estes Park,CO",
                      "api_key": "jgn983hy48thw9begh98h4539h4"
                      }

      post "/api/v1/road_trip", params: query_params
      
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.content_type).to eq("application/json")

      trip_data = JSON.parse(response.body, symbolize_names: true)
      expect(trip_data).to be_a(Hash)

      expect(trip_data).to have_key(:data)
      expect(trip_data[:data]).to be_a(Hash)

      expect(trip_data[:data]).to have_key(:type)
      expect(trip_data[:data][:type]).to eq("roadtrip")

      expect(trip_data[:data]).to have_key(:id)
      expect(trip_data[:data][:id]).to be(nil)

      expect(trip_data[:data]).to have_key(:attributes)
      expect(trip_data[:data][:attributes]).to be_a(Hash)

      trip_attributes = trip_data[:data][:attributes]
      expect(trip_attributes).to be_a(Hash)
      expect(trip_attributes).to have_key(:start_city)
      expect(trip_attributes[:start_city]).to be_a(String)

      expect(trip_attributes).to have_key(:end_city)
      expect(trip_attributes[:end_city]).to be_a(String)

      expect(trip_attributes).to have_key(:travel_time)
      expect(trip_attributes[:travel_time]).to be_a(String)

      weather_eta = trip_data[:data][:attributes][:weather_at_eta]               
      expect(weather_eta).to be_a(Hash)
      expect(weather_eta).to have_key(:temperature)
      expect(weather_eta[:temperature]).to be_a(Numeric)

      expect(weather_eta).to have_key(:conditions)
      expect(weather_eta[:conditions]).to be_a(String)
    end
    it 'will return a 400 error if no query is passed' do 
      user = User.create(email: "whatever@example.com", password: "password", api_key: "jgn983hy48thw9begh98h4539h4")
      
      query_params = {
                      "origin": "",
                      "destination": "Estes Park,CO",
                      "api_key": "jgn983hy48thw9begh98h4539h4"
                      }

      post "/api/v1/road_trip", params: query_params

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
    end 
    it 'will return a 401 error if no query is passed' do 
      user = User.create(email: "whatever@example.com", password: "password", api_key: "jgn983hy48thw9begh98h4539h4")
      
      query_params = {
                      "origin": "Denver,CO",
                      "destination": "Estes Park,CO",
                      "api_key": "jgn983hy48thw9"
                      }

      post "/api/v1/road_trip", params: query_params

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
    end 
  end
end