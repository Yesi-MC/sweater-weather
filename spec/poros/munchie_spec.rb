require 'rails_helper'

RSpec.describe Munchie do 
  it "exits and has attributes" do 
    distance = {
                :route=>
                  {:hasTollRoad=>false,
                  :hasBridge=>true,
                  :boundingBox=>{:lr=>{:lng=>-104.605087, :lat=>38.265427}, :ul=>{:lng=>-104.98761, :lat=>39.738453}},
                  :distance=>111.38,
                  :hasTimedRestriction=>false,
                  :hasTunnel=>false,
                  :hasHighway=>true,
                  :computedWaypoints=>[],
                  :routeError=>{:errorCode=>-400, :message=>""},
                  :formattedTime=>"01:44:22",
                  :sessionId=>"604661c7-00a3-5f21-02b4-3500-0a439d50b801",
                  :hasAccessRestriction=>false,
                  :realTime=>8665,
                  :hasSeasonalClosure=>false,
                  :hasCountryCross=>false,
                  :fuelUsed=>5.5}
                }
    weather = {
              :lat=>38.2654,
              :lon=>-104.6051,
              :timezone=>"America/Denver",
              :timezone_offset=>-25200,
              :current=>
                {:dt=>1615225287,
                :sunrise=>1615209590,
                :sunset=>1615251518,
                :temp=>54.19,
                :feels_like=>48.2,
                :pressure=>1018,
                :humidity=>37,
                :dew_point=>28.92,
                :uvi=>3.94,
                :clouds=>1,
                :visibility=>10000,
                :wind_speed=>3.44,
                :wind_deg=>270,
                :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]}
              }
    food = {
            :businesses=>
              [{:id=>"8wGSggWsopmqoCyd9bY-dw",
                :alias=>"bingo-burger-pueblo-4",
                :name=>"Bingo Burger",
                :image_url=>"https://s3-media3.fl.yelpcdn.com/bphoto/KyMKYZ2W8nyjocqzkrrEog/o.jpg",
                :is_closed=>false,
                :url=>"https://www.yelp.com/biz/bingo-burger-pueblo-4?adjust_creative=o0T6A7ngZsvufObjObqwew&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=o0T6A7ngZsvufObjObqwew",
                :review_count=>406,
                :categories=>[{:alias=>"burgers", :title=>"Burgers"}],
                :rating=>4.0,
                :coordinates=>{:latitude=>38.268043, :longitude=>-104.609794},
                :transactions=>["delivery", "pickup"],
                :price=>"$$",
                :location=>{:address1=>"101 Central Plz", :address2=>"", :address3=>"", :city=>"Pueblo", :zip_code=>"81003", :country=>"US", :state=>"CO", :display_address=>["101 Central Plz", "Pueblo, CO 81003"]},
                :phone=>"+17192258363",
                :display_phone=>"(719) 225-8363",
                :distance=>3190.6682549996963}]
            }

    destination = "Pueblo,CO"

    munchie_details = Munchie.new(distance, weather, food, destination)

    expect(munchie_details).to be_a(Munchie)
    expect(munchie_details.destination_city).to eq(destination)
    expect(munchie_details.travel_time).to eq(distance[:route][:formattedTime])
    expect(munchie_details.forecast).to eq({ summary: weather[:current][:weather][0][:description], temperature: weather[:current][:temp].to_s })
    expect(munchie_details.restaurant).to eq({ name: food[:businesses][0][:name], address: food[:businesses][0][:location][:display_address][0] })

  end 
end