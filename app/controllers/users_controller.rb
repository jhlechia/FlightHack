class UsersController < ApplicationController
  def new
  end

  def create
    #  render plain: params[:user].inspect
     @user = User.new(user_params)
     @user.save
     redirect_to @user
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :birthday, :username, :password, :password_confirm, :avatar)
    end
end
