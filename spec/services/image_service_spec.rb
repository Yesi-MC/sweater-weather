require 'rails_helper'

RSpec.describe ImageService do
  describe 'Background Image' do
    it 'sends a request to the Unsplash API for image' do
      data = ImageService.get_single_image('Denver,Co')

      expect(data).to be_a(Hash) 

      image_data = data[:results][0][:urls]

      expect(image_data).to have_key(:full)
      expect(image_data[:full]).to be_a(String)

      credit_data = data[:results][0][:user]

      expect(credit_data).to have_key(:username)
      expect(credit_data[:username]).to be_a(String)
    end
  end
end