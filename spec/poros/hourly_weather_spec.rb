require 'rails_helper'

RSpec.describe HourlyWeather do 
  it "exits and has attributes" do 
    data =  {
            :dt=>1615096800,
            :temp=>44.56,
            :feels_like=>36.57,
            :pressure=>1009,
            :humidity=>32,
            :dew_point=>18.27,
            :uvi=>0,
            :clouds=>69,
            :visibility=>10000,
            :wind_speed=>4.79,
            :wind_deg=>217,
            :weather=>[{:id=>803, :main=>"Clouds", :description=>"broken clouds", :icon=>"04n"}],
            :pop=>0
            }

    hourly_details = HourlyWeather.new(data)
    expect(hourly_details).to be_a(HourlyWeather)
    expect(hourly_details.time).to eq(DateTime.strptime(data[:dt].to_s, '%s'))
    expect(hourly_details.temperature).to eq(data[:temp])
    expect(hourly_details.conditions).to eq(data[:weather][0][:description])
    expect(hourly_details.icon).to eq(data[:weather][0][:icon])
  end
end