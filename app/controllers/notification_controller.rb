class NotificationController < ApplicationController

  def message_sender
    @user = current_user
    @contact = current_user.find_primary_contact
    @user_email = @user.email
    @time_difference = session[:time_difference].to_i
    @timer_one_day_message = "Coffin timer will expire in less than 24 hours."
    @timer_one_hour_message = "Coffin timer will expire in less than 1 hour."
    @timer_expired_message = "Coffin timer expired. Your info has been released."
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
        ContactNotifierMailer.death_notice(@user, @contact).deliver_now
        @user.dead_man_switch.update(expired_message_sent: true)
        @user.update(deceased: true)
      end
      redirect_to dashboard_path
  end
end
