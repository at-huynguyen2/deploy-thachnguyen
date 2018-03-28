class UsersController < ApplicationController
  include UsersHelper
  layout "bases"
  def index
    @users = User.all
    @user = User.new
    bindingg
    render :index
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Welcome to!"
      redirect_to :controller=>'users', :action=>'index'
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def new
    @user = User.new
  end

  def sign_in

  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :range, :password, :password_confirmation)
    end
end
