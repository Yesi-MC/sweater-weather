require 'rails_helper'

RSpec.describe Roadtrip do 
  it "exits and has attributes" do 
    start_location = "Denver,CO"

    end_location = "Estes Park,CO"

    trip_travel_time = "01:22:49"

    arrival_weather = {
                      :dt=>1615345200,
                      :temp=>36.61,
                      :feels_like=>32.45,
                      :pressure=>1009,
                      :humidity=>75,
                      :dew_point=>29.75,
                      :uvi=>0,
                      :clouds=>100,
                      :visibility=>10000,
                      :wind_speed=>0.4,
                      :wind_deg=>101,
                      :weather=>[{:id=>600, :main=>"Snow", :description=>"light snow", :icon=>"13n"}],
                      :pop=>0.33,
                      :snow=>{:"1h"=>0.31}
                      }
                      
    roadtrip_details = Roadtrip.new(start_location, end_location, trip_travel_time, arrival_weather)
    expect(roadtrip_details).to be_a(Roadtrip)
    expect(roadtrip_details.start_city).to eq(start_location)
    expect(roadtrip_details.end_city).to eq(end_location)
    expect(roadtrip_details.travel_time).to eq(trip_travel_time)
    expect(roadtrip_details.weather_at_eta).to eq({temperature: arrival_weather[:temp], conditions: arrival_weather[:weather][0][:description]})
  end
end