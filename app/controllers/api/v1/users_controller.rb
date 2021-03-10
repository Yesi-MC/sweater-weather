class Api::V1::UsersController < ApplicationController

  def create
    if valid_password?
      user = User.new(user_params)
      user.generate_key
      user.save
      render json: UsersSerializer.new(user), status: 201
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end

  def valid_password?
    params[:password] == params[:password_confirmation]
  end

end
