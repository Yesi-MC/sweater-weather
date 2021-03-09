class ImageService 
  class << self 

    def get_single_image(location)
      response = conn.get("/search/photos") do |r|
        r.params['query'] = location
        r.params['per_page'] = 1
      end
      parse_data(response)
    end

    private 

    def conn 
      Faraday.new('https://api.unsplash.com') do |f|
        f.params['client_id'] = ENV['unsplash_api_key']
      end
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true) 
    end


  end 
end