require 'rails_helper'

RSpec.describe LocationService do
  describe 'location' do
    it 'sends a request to the Geo API for coordinates' do
      data = LocationService.location('Denver,Co')

      expect(data).to be_a(Hash) 

      geo_data = data[:results][0][:locations][0][:latLng] 

      expect(geo_data).to have_key(:lat)
      expect(geo_data[:lat]).to be_a(Numeric)

      expect(geo_data).to have_key(:lng)
      expect(geo_data[:lng]).to be_a(Numeric)
    end
  end
end