class NotificationController < ApplicationController

  def index
    user = current_user
    email = current_user.find_primary_contact_email
    ContactNotifierMailer.death_notice(user, email).deliver_now
    redirect_to reports_path
  end

end
