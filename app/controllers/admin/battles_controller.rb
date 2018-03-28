class Admin::BattlesController < ApplicationController
  def show
    battle = @Battle.find(params[:id])
  end
end
