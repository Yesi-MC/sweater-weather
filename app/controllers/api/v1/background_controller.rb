class Api::V1::BackgroundController < ApplicationController

  def index 
    conn = Faraday.new('https://api.unsplash.com') do |f|
      f.params['client_id'] = ENV['unsplash_api_key']
    end
    response = conn.get("/search/photos") do |r|
      r.params['query'] = params[:location]
      r.params['per_page'] = 1
    end
    image = JSON.parse(response.body, symbolize_names: true) 
  
    # require 'pry'; binding.pry
  end
end 