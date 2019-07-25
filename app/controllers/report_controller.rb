class ReportController < ApplicationController

  def show
    # require 'pry'; binding.pry
    if current_user
      @user = current_user
    else
    @user = User.find(5)
    # @user = Contact.find(params[:id]).user
    end
  end

end
