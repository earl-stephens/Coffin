class ContactLoginController < ApplicationController

  def edit

  end

  def update
    contact = Contact.find_by(verification_token: params[:verification_token])
    if contact
      contact.update(verified: true)
      redirect_to report_path(contact)
    else
      flash[:failure] = "Something has gone wrong.  Please reach out to support."
    end
  end

end
