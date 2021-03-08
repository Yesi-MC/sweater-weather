class Api::V1::ForecastController < ApplicationController
  def index
    locale = params[:location]
    location = LocationFacade.location(locale)
    latitude = location.lat
    longitude = location.long
    total_weather = ForecastFacade.forecast(latitude, longitude)
    render json: ForecastSerializer.new(total_weather)
  end
end 