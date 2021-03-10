class Api::V1::UsersController < ApplicationController

  def create
    if User.find_by(email: params[:email])
      render json: "User Already Exists", status: 409
    else
      user = User.new(user_params)
      if user.email != "" && valid_password?
        user.generate_key
        user.save
        render json: UsersSerializer.new(user), status: 201
      else 
        render json: "Invalid User Params", status: 400
      end
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
