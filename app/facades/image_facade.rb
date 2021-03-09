class ImageFacade 
  class << self 

    def obtain_image(location)
      image = ImageService.get_single_image(location)
      Background.new(image, location)
    end

  end
end