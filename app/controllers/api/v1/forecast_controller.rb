class Api::V1::ForecastController < ApplicationController
  def index
    if params[:location] != ""
      locale = params[:location]
      location = LocationFacade.location(locale)
      latitude = location.lat
      longitude = location.long
      total_weather = ForecastFacade.forecast(latitude, longitude)
      render json: ForecastSerializer.new(total_weather)
    else 
      render json: "Invalid Query Params", status: 400
    end 
  end
end 