require 'rails_helper'

RSpec.describe TotalWeather do 
  it "exits and has attributes" do 
    current = {
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

    current_weather = CurrentWeather.new(current) 
    
    daily = {
            :dt=>1615057200,
            :sunrise=>1615037111,
            :sunset=>1615078640,
            :temp=>{:day=>57.18, :min=>38.34, :max=>61.97, :night=>44.35, :eve=>56.48, :morn=>38.34},
            :feels_like=>{:day=>51.53, :night=>36.34, :eve=>50.14, :morn=>31.68},
            :pressure=>1016,
            :humidity=>31,
            :dew_point=>15.04,
            :wind_speed=>2.46,
            :wind_deg=>178,
            :weather=>[{:id=>803, :main=>"Clouds", :description=>"broken clouds", :icon=>"04d"}],
            :clouds=>81,
            :pop=>0,
            :uvi=>4.88
            }

    daily_weather = DailyWeather.new(daily)

    hourly = {
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

    hourly_weather = HourlyWeather.new(hourly) 

    total_details = TotalWeather.new(current_weather, daily_weather, hourly_weather)
    expect(total_details).to be_a(TotalWeather)
    expect(total_details.current_weather).to eq(current_weather)
    expect(total_details.daily_weather).to eq(daily_weather)
    expect(total_details.hourly_weather).to eq(hourly_weather)
  end
end