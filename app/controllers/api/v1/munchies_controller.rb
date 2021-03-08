class Api::V1::MunchiesController < ApplicationController
  
  def index
    destination = params[:destination]
    start_location = params[:start]
    food = params[:food]
    munchie = MunchieFacade.get_munchies(destination, start_location, food)
    render json: MunchieSerializer.new(munchie)
  end 
end 