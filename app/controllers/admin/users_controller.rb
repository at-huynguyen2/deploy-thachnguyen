class Admin::UsersController < AdminsController
  def index
    @users = User.all
    render :index
  end
  def login
    render :login
  end
end
