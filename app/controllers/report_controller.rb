class ReportController < ApplicationController
 before_action :verified_contact

  def show
    if current_user
      @user = current_user
    else
      @user = Contact.find(params[:id]).user
    end
  end

  private

  def verified_contact
    contact = Contact.find(params[:id])
    contact.verified
  end
end