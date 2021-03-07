require 'rails_helper'

RSpec.describe Location do 
  it "exits and has attributes" do 
    data =  {:lat=>39.738453, :lng=>-104.984853}

    location_details = Location.new(data)

    expect(location_details).to be_a(Location)
    expect(location_details.lat).to eq(data[:lat])
    expect(location_details.long).to eq(data[:lng])
  end
end