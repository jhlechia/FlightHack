class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
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

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :birthday, :username, :password, :password_confirm, :avatar)
    end
end
