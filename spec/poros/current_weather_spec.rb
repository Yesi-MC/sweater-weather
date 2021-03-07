require 'rails_helper'

RSpec.describe CurrentWeather do 
  it "exits and has attributes" do 
    data =  {
            :dt=>1615096514,
            :sunrise=>1615037111,
            :sunset=>1615078640,
            :temp=>44.65,
            :feels_like=>36.46,
            :pressure=>1009,
            :humidity=>27,
            :dew_point=>14.86,
            :uvi=>0,
            :clouds=>95,
            :visibility=>10000,
            :wind_speed=>4.61,
            :wind_deg=>218,
            :weather=>[{:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04n"}]
            }

    current_details = CurrentWeather.new(data)
    expect(current_details).to be_a(CurrentWeather)
    expect(current_details.datetime).to eq(DateTime.strptime(data[:dt].to_s, '%s'))
    expect(current_details.sunrise).to eq(DateTime.strptime(data[:sunrise].to_s, '%s'))
    expect(current_details.sunset).to eq(DateTime.strptime(data[:sunset].to_s, '%s'))
    expect(current_details.temperature).to eq(data[:temp])
    expect(current_details.feels_like).to eq(data[:feels_like])
    expect(current_details.humidity).to eq(data[:humidity])
    expect(current_details.uvi).to eq(data[:uvi])
    expect(current_details.visibility).to eq(data[:visibility])
    expect(current_details.conditions).to eq(data[:weather][0][:description])
    expect(current_details.icon).to eq(data[:weather][0][:icon])
  end
end