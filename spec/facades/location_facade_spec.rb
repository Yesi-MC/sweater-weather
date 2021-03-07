require 'rails_helper'

RSpec.describe LocationFacade do
  context "class methods" do
    it "can call service for location cordinates" do
      data = LocationFacade.location('Denver,CO')

      expect(data).to be_a(Location)
    end 
  end 
end 