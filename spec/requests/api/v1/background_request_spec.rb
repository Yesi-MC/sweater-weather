require 'rails_helper'

describe "Background API Endpoints" do
  describe "can get background image based on location" do
    it "obtains image info" do 
  
      query_params = ({ location: 'Denver, CO' })

      get '/api/v1/background', params: query_params 

      expect(response).to be_successful
      expect(response.status).to eq(200)

      background = JSON.parse(response.body, symbolize_names: true) 
        
      expect(background).to be_a(Hash)
      expect(background).to have_key(:data)
      expect(background[:data]).to be_a(Hash)
      expect(background[:data]).to have_key(:type)
      expect(background[:data][:type]).to eq('image')
      expect(background[:data]).to have_key(:id)
      expect(background[:data][:id]).to eq(nil)
      expect(background[:data]).to have_key(:attributes)
      expect(background[:data][:attributes]).to be_a(Hash)

      image_data = background[:data][:attributes][:image]
      expect(image_data).to be_a(Hash)
      expect(image_data).to have_key(:location)
      expect(image_data[:location]).to be_a(String)
      expect(image_data).to have_key(:image_url)
      expect(image_data[:image_url]).to be_a(String)
      
      credit_data = background[:data][:attributes][:credit]
      expect(credit_data).to be_a(Hash)
      expect(credit_data).to have_key(:source)
      expect(credit_data[:source]).to be_a(String)
      expect(credit_data).to have_key(:author)
      expect(credit_data[:author]).to be_a(String)
      expect(credit_data).to have_key(:logo)
      expect(credit_data[:logo]).to be_a(String)
    end 
  end
end 