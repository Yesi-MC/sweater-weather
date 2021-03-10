class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: user_params[:email])
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id 
      render json: UsersSerializer.new(user), status: 200
    elsif user && !user.authenticate(user_params[:password]) 
      render json: "Invalid Credentials", status: 401 
    else 
      render json: "Invalid Query Params", status: 400 
    end 
  end

  private

  def user_params
    params.permit(:email, :password)
  end


end
