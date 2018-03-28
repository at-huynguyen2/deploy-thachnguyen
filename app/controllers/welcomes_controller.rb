class WelcomesController < BasesController
  layout "bases"
  def index
    @user = User.new
  end
end
