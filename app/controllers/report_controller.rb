class ReportController < ApplicationController

  def show
    @user = User.find(5)
  end

end
