require 'rails_helper'

RSpec.describe ForecastFacade do
  context "class methods" do
    it "can call service for weather info " do
      data = ForecastFacade.forecast('39.7385', '-104.9849')

      expect(data).to be_a(TotalWeather)
    end 
  end 
end 