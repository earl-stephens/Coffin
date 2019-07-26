class DashboardController < ApplicationController
  before_action :require_reguser

  def index
    @user = current_user
  end

end
