require 'rails_helper'

RSpec.describe DailyWeather do 
  it "exits and has attributes" do 
    data =  {
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

    daily_details = DailyWeather.new(data)
    expect(daily_details).to be_a(DailyWeather)
    expect(daily_details.date).to eq(DateTime.strptime(data[:dt].to_s, '%s'))
    expect(daily_details.sunrise).to eq(DateTime.strptime(data[:sunrise].to_s, '%s'))
    expect(daily_details.sunset).to eq(DateTime.strptime(data[:sunset].to_s, '%s'))
    expect(daily_details.max_temp).to eq(data[:temp][:max])
    expect(daily_details.min_temp).to eq(data[:temp][:min])
    expect(daily_details.conditions).to eq(data[:weather][0][:description])
    expect(daily_details.icon).to eq(data[:weather][0][:icon])
  end
end