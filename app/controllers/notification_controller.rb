class NotificationController < ApplicationController
  # This controller queries the endpoint from the dead_man_switch miniservice
  # and receive a time difference (as an integer) and a user id (as an integer).
  # If the time difference is positive, then the switch has expired.
  # If the time difference negative, then the switch has not expired
  # 1 day = 24 hours = 1440 minutes = 86400 seconds
  one_day_plus_one_min = -86460 # i.e. this dms will expire in 1 day and 1 minutes
  one_day = -86400
  one_day_minues_one_min = -86340

  def index
    user = current_user
    email = current_user.find_primary_contact_email
    ContactNotifierMailer.death_notice(user, email).deliver_now
    redirect_to reports_path
  end

  def index
    # set connection to the Sinatra Microservice API endpoint here w/ Faraday
    # code below will change w/e endpoint actually is using conn.get (i.e. `conn.get("/v1/dms/user")`)
    @user = User.find(params[:user_id])
    @time_difference = one_day_plus_one_min
    @timer_one_day_message = "Coffin timer will expire in less than 24 hours."
    @timer_one_hour_message = "Coffin timer will expire in less than 1 hour."
    @timer_expired_message = "Coffin timer expired. Your info has been released."

    respond_to do |format|
      if @time_difference >= -86400 && @user.one_day_alert_sent == false
        message = @timer_one_day_message
        TwilioTextMessenger.new(message).call # this is the syntax from Twilio to 'call' the message method
        # send out the email here too
        # update the one day alert sent column to be true
      elsif @time_difference >= -86400 && @user.one_hour_alert_sent == false
        message = @timer_one_hour_message
        TwilioTextMessenger.new(message).call
        # send out the email here too
        # update the one hour alert sent column to be true
      elsif @time_difference > 0 && @user.timer_expired_alert_sent == false
        message = @timer_expired_message
        TwilioTextMessenger.new(message).call
        # send out the email here too
        # update the one hour alert sent column to be true
      end
    end
  end
    # Based on updating these messages sent columns in the database,
    # we also need the DeadmeanswitchController to change those message_sent columns
    # back to false.
end
