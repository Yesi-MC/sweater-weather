require 'rails_helper'

describe "Yelp API Endpoints" do
  describe "can get munchies info" do 
    it "obtains food, weather, and travel data info" do 

      query_params = ({ start: 'Denver,Co', destination: 'Pueblo, Co', food: 'hamburger' })

      get '/api/v1/munchies', params: query_params 

      expect(response).to be_successful 
      expect(response.status).to eq(200)

    end
  end
end