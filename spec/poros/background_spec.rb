require 'rails_helper'

RSpec.describe Background do 
  it "exits and has attributes" do 
    image =  {
                    :total=>2644,
                    :total_pages=>2644,
                    :results=>
                      [{:id=>"cQKn3fl4s5w",
                        :created_at=>"2020-11-10T13:40:05-05:00",
                        :updated_at=>"2021-03-08T21:20:33-05:00",
                        :promoted_at=>nil,
                        :width=>3712,
                        :height=>5568,
                        :color=>"#a6d9f3",
                        :blur_hash=>"LdFsPuH;n,I;F|MbozxaM{%Mt7WB",
                        :description=>"INSTAGRAM: SARRAMPHOTOGRAPHY\n",
                        :alt_description=>"text",
                        :urls=>
                        {:raw=>"https://images.unsplash.com/photo-1605033532441-30378efcd7ef?ixid=MnwyMTMzODZ8MHwxfHNlYXJjaHwxfHxEZW52ZXIsJTIwQ098ZW58MHx8fHwxNjE1MjY1NjU2&ixlib=rb-1.2.1",
                          :full=>
                          "https://images.unsplash.com/photo-1605033532441-30378efcd7ef?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyMTMzODZ8MHwxfHNlYXJjaHwxfHxEZW52ZXIsJTIwQ098ZW58MHx8fHwxNjE1MjY1NjU2&ixlib=rb-1.2.1&q=85",
                          :regular=>
                          "https://images.unsplash.com/photo-1605033532441-30378efcd7ef?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMTMzODZ8MHwxfHNlYXJjaHwxfHxEZW52ZXIsJTIwQ098ZW58MHx8fHwxNjE1MjY1NjU2&ixlib=rb-1.2.1&q=80&w=1080",
                          :small=>
                          "https://images.unsplash.com/photo-1605033532441-30378efcd7ef?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMTMzODZ8MHwxfHNlYXJjaHwxfHxEZW52ZXIsJTIwQ098ZW58MHx8fHwxNjE1MjY1NjU2&ixlib=rb-1.2.1&q=80&w=400",
                          :thumb=>
                          "https://images.unsplash.com/photo-1605033532441-30378efcd7ef?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMTMzODZ8MHwxfHNlYXJjaHwxfHxEZW52ZXIsJTIwQ098ZW58MHx8fHwxNjE1MjY1NjU2&ixlib=rb-1.2.1&q=80&w=200"},
                        :links=>
                        {:self=>"https://api.unsplash.com/photos/cQKn3fl4s5w",
                          :html=>"https://unsplash.com/photos/cQKn3fl4s5w",
                          :download=>"https://unsplash.com/photos/cQKn3fl4s5w/download",
                          :download_location=>"https://api.unsplash.com/photos/cQKn3fl4s5w/download?ixid=MnwyMTMzODZ8MHwxfHNlYXJjaHwxfHxEZW52ZXIsJTIwQ098ZW58MHx8fHwxNjE1MjY1NjU2"},
                        :categories=>[],
                        :likes=>6,
                        :liked_by_user=>false,
                        :current_user_collections=>[],
                        :sponsorship=>nil,
                        :user=>
                        {:id=>"7vaZ99fSB5o",
                          :updated_at=>"2021-03-08T20:47:52-05:00",
                          :username=>"nima_sarram" }
                        }]
                      }
    location = "Denver, CO"
                    

  
    image_details = Background.new(image, location)
    expect(image_details).to be_a(Background)
    expect(image_details.image).to be_a(Hash)
    expect(image_details.image).to eq({
                                      location: location, 
                                      image_url: image[:results][0][:urls][:full], 
                                      credit: {
                                              source: "unsplash.com", 
                                              author: image[:results][0][:user][:username], 
                                              logo:  "https://unsplash.com/blog/content/images/max/2560/1-vQ5EsgnJkANWb5fktHPwnw.jpeg" 
                                              }
                                        })
  end
end