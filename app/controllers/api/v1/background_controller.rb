class Api::V1::BackgroundController < ApplicationController

  def index 
    if params[:location] != ""
      location = params[:location]
      background = ImageFacade.obtain_image(location)
      render json: ImageSerializer.new(background)
    else 
      render json: "Invalid Query Params", status: 400
    end 
  end
end 