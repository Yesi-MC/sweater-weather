require 'rails_helper'

RSpec.describe MunchieFacade do
  context "class methods" do
    it "can call service for munchie details" do
      data = MunchieFacade.get_munchies('Pueblo,Co', 'Denver,Co', 'hamburger')

      expect(data).to be_a(Munchie)
    end 
  end 
end 