class Api::V1::BackgroundController < ApplicationController

  def index 
    location = params[:location]
    background = ImageFacade.obtain_image(location)
    render json: ImageSerializer.new(background)
  end
end 