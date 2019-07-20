class NotificationController

  def index
    ContactNotifierMailer.death_notice(current_user, params[:email]).deliver_now
  end

end
