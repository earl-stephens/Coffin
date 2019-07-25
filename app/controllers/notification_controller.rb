class NotificationController < ApplicationController

  def message_sender
    @user = current_user
    @contact = current_user.find_primary_contact
    @user_email = @user.email
    @time_difference = session[:time_difference].to_i
    # binding.pry
      if @time_difference <= 86415 && @user.dead_man_switch.one_day_message_sent == false
        account_sid = ENV['EARLID']
        auth_token = ENV['EARLTOKEN']

        @client = Twilio::REST::Client.new(account_sid, auth_token)

        message = @client.messages.create(
                                     body: "Coffin timer will expire in less than 24 hours.",
                                     from: '+13609791097',
                                     to: '+13606203690'
                                   )

        ContactNotifierMailer.day_warning(@user, @user_email).deliver_now
        @user.dead_man_switch.update(one_day_message_sent: true)
      elsif @time_difference <= 3600 && @user.dead_man_switch.one_hour_message_sent == false
        account_sid = ENV['EARLID']
        auth_token = ENV['EARLTOKEN']
        @client = Twilio::REST::Client.new(account_sid, auth_token)

        message = @client.messages.create(
                                     body: "Coffin timer will expire in less than 1 hour.",
                                     from: '+13609791097',
                                     to: '+13606203690'
                                   )

        ContactNotifierMailer.hour_warning(@user, @user_email).deliver_now
        @user.dead_man_switch.update(one_hour_message_sent: true)
      elsif @time_difference <= 0 && @user.dead_man_switch.expired_message_sent == false
        account_sid = ENV['EARLID']
        auth_token = ENV['EARLTOKEN']
        @client = Twilio::REST::Client.new(account_sid, auth_token)

        message = @client.messages.create(
                                     body: "Coffin timer expired. Your info has been released.",
                                     from: '+13609791097',
                                     to: '+13606203690'
                                   )
        ContactNotifierMailer.death_notice(@user, @contact).deliver_now
        @user.dead_man_switch.update(expired_message_sent: true)
        @user.update(deceased: true)
      redirect_to dashboard_path
    end

  end
end
