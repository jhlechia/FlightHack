class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :show, :update]
  def new
    @user = User.new
  end

  def edit
  end

  def create
    #  render plain: params[:user].inspect
     @user = User.new(user_params)
     @user.save
     redirect_to @user
  end

  def show
  end

  def index
    @users = User.all
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :birthday, :username, :password, :password_confirm, :avatar)
    end
end
