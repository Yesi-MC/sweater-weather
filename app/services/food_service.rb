class FoodService 
  class << self 

    def get_food_data(food, destination)
      response = conn.get("/v3/businesses/search") do |r|
        r.params['term'] = food
        r.params['location'] = destination
      end
      parse_data(response)
    end

    private 

    def conn
      Faraday.new('https://api.yelp.com') do |f|
        f.headers['Authorization'] = ENV['yelp_api_key']
      end
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true) 
    end

  end
end