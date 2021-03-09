class Background
attr_reader :image 


  def initialize(image, location)
    @image = {
              location: location, 
              image_url: image[:results][0][:urls][:full], 
              credit: {
                source: "unsplash.com", 
                author: image[:results][0][:user][:username], 
                logo: "https://unsplash.com/blog/content/images/max/2560/1-vQ5EsgnJkANWb5fktHPwnw.jpeg"
                }
              }
  end
end