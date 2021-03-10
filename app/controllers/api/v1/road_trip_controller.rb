class Api::V1::RoadTripController < ApplicationController

  def create 
    user = User.find_by(api_key: params[:api_key])
    if user && params[:origin] != "" && params[:destination] != ""
      start_location = params[:origin]
      end_location = params[:destination]
      roadtrip = RoadtripFacade.get_roadtrip_data(start_location, end_location)
      render json: RoadtripSerializer.new(roadtrip)
    elsif !user && params[:origin] != "" && params[:destination] != ""
      render json: "Unauthorized", status: 401
    else  
      render json: "Invalid Query Params", status: 400
    end 
  end
end 

