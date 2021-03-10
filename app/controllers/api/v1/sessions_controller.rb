class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: user_params[:email])
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id 
      render json: UsersSerializer.new(user), status: 200 
    end 
  end

  private

  def user_params
    params.permit(:email, :password)
  end


end
