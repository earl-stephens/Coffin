class ReportController < ApplicationController
 before_action :verified_contact

  def show
    @user = Contact.find(params[:id]).user
  end

  private

  def verified_contact
    contact = Contact.find(params[:id])
    contact.verified
  end

end
