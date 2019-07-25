class ReportController < ApplicationController

  def show
    if current_user
      @user = current_user
    else
    @user = Contact.find(params[:id]).user
    end
  end

end
