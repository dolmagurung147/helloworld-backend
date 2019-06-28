class UsersController < ApplicationController

  def index
      @users = User.all
      render json: @users
    end


    def create
      @user = User.create(user_params)
      if @user.valid?
        token = encode_token(@user.id)
        render json: { user: UserSerializer.new(@user), token: token }, status: :created
      else
        render json: { error: 'Fill Out the correct information' }, status: :not_acceptable
      end
    end

    def update
      @user = User.find(params[:id])
      @user.update(user_params)
      render json: @user
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      render json: @user
    end

    private

    def user_params
      params.require(:user).permit(:firstName, :lastName, :username, :password, :dob, :sexualRepresentation)
    end
end
