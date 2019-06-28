class AuthControllerController < ApplicationController

  def create # post
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      render json: {user: UserSerializer.new(user), token: encode_token(user.id)}
    else
      render json: {errors: 'Please enter the correct username or password'}
    end
  end

  def login # get'
    token = request.headers['authorization']
    id = JWT.decode(token, ENV['SECRET_KEY'])[0]["user_id"]
    @user = User.find(id)
    if @user
      render json: {user: UserSerializer.new(@user)}
    else
      render json: {errors: 'Something went wrong'}
    end
  end
end
