require 'rails_helper'

RSpec.describe FoodService do
  describe 'food' do
    it 'sends a request to the Yelp API for info' do
      data = FoodService.get_food_data('hamburger', 'Pueblo,Co')
      
      expect(data).to be_a(Hash) 

      food_data = data[:businesses][0] 

      expect(food_data).to have_key(:name)
      expect(food_data[:name]).to be_a(String)

      address_data = data[:businesses][0][:location]
      
      expect(address_data).to have_key(:display_address)
      expect(address_data[:display_address]).to be_a(Array)
    end 
  end 
end 