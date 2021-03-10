require 'rails_helper'

RSpec.describe "Registration endpoint" do
  describe "can get user info from registration" do 
    it "can return user info" do

      query_params = {
                    "email": "whatever@example.com",
                    "password": "password",
                    "password_confirmation": "password"
                      }

      post "/api/v1/users", params: query_params
      
      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(response.content_type).to eq("application/json")

      user_data = JSON.parse(response.body, symbolize_names: true)
      expect(user_data).to be_a(Hash)

      expect(user_data).to have_key(:data)
      expect(user_data[:data]).to be_a(Hash)

      expect(user_data[:data]).to have_key(:type)
      expect(user_data[:data][:type]).to eq("users")

      expect(user_data[:data]).to have_key(:id)
      expect(user_data[:data][:id]).to be_a(String)

      expect(user_data[:data]).to have_key(:attributes)
      expect(user_data[:data][:attributes]).to be_a(Hash)

      user_attributes = user_data[:data][:attributes]
      expect(user_attributes).to have_key(:email)
      expect(user_attributes[:email]).to be_a(String)

      expect(user_attributes).to have_key(:api_key)
      expect(user_attributes[:api_key]).to be_a(String)
    end
  end
end