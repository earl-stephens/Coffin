class NotificationController < ApplicationController
  # This controller queries the endpoint from the dead_man_switch miniservice
  # and receive a time difference (as an integer) and a user id (as an integer).
  # If the time difference is positive, then the switch has expired.
  # If the time difference negative, then the switch has not expired
  # 1 day = 24 hours = 1440 minutes = 86400 seconds
  # one_day_plus_one_min = -86460 # i.e. this dms will expire in 1 day and 1 minutes
  # one_day = -86400
  # one_day_minues_one_min = -86340

  def message_sender
    @user = current_user
    @email = current_user.find_primary_contact_email
    @user_email = @user.email
    @time_difference = session[:time_difference].to_i
    @timer_one_day_message = "Coffin timer will expire in less than 24 hours."
    @timer_one_hour_message = "Coffin timer will expire in less than 1 hour."
    @timer_expired_message = "Coffin timer expired. Your info has been released."
    # respond_to do |format|
      # if @time_difference > 86400
      #   @user.dead_man_switch.update(one_day_message_sent: false)
      #   @user.dead_man_switch.update(one_hour_message_sent: false)
      #   @user.dead_man_switch.update(expired_message_sent: false)
      if @time_difference <= 86415 && @user.dead_man_switch.one_day_message_sent == false
        message = @timer_one_day_message
        # TwilioTextMessenger.new(message).call # this is the syntax from Twilio to 'call' the message method
        ContactNotifierMailer.day_warning(@user, @user_email).deliver_now
        @user.dead_man_switch.update(one_day_message_sent: true)
      elsif @time_difference <= 3600 && @user.dead_man_switch.one_hour_message_sent == false
        message = @timer_one_hour_message
        # TwilioTextMessenger.new(message).call
        ContactNotifierMailer.hour_warning(@user, @user_email).deliver_now
        @user.dead_man_switch.update(one_hour_message_sent: true)
      elsif @time_difference <= 0 && @user.dead_man_switch.expired_message_sent == false
        message = @timer_expired_message
        # TwilioTextMessenger.new(message).call
        ContactNotifierMailer.death_notice(@user, @email).deliver_now
        @user.dead_man_switch.update(expired_message_sent: true)
        @user.update(deceased: true)
      end
      redirect_to dashboard_path
    # end
  end
end
