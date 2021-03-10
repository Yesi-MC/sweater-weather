require 'rails_helper'

RSpec.describe RoadtripFacade do
  context "class methods" do
    it "can call services for distance and weather for roadtrip" do
      data = RoadtripFacade.get_roadtrip_data('Denver,CO', 'Estes Park, Co')

      expect(data).to be_a(Roadtrip)
    end 
    it "can round time to integer" do 
      time = RoadtripFacade.get_time_block("01:22:49") 

      expect(time).to eq(1)
    end
    it "can round time up if past half hour" do 
      time = RoadtripFacade.get_time_block("01:45:49") 

      expect(time).to eq(2)
    end
  end 
end 