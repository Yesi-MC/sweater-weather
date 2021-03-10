class Api::V1::RoadTripController < ApplicationController

  def create 
    user = User.find_by(api_key: params[:api_key])
    start_location = params[:origin]
    end_location = params[:destination]
    roadtrip = RoadtripFacade.get_roadtrip_data(start_location, end_location)
    render json: RoadtripSerializer.new(roadtrip)
  end
end 

