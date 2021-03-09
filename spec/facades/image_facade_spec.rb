require 'rails_helper'

RSpec.describe ImageFacade do
  context "class methods" do
    it "can call service for image/background info " do
      data = ImageFacade.obtain_image('Denver,Co')

      expect(data).to be_a(Background)
    end 
  end 
end 