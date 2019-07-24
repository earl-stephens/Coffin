require 'digest'
class ContactNotifierMailer < ApplicationMailer

  def death_notice(user, contact)
    @user = user
    mail(to: contact, subject: "IMPORTANT MESSAGE ABOUT #{@user.first_name} #{@user.last_name}")
  end


  def day_warning(user, contact)
    @user = user
    mail(to: contact, subject: "IMPORTANT MESSAGE ABOUT #{@user.first_name} #{@user.last_name}")
  end

  def hour_warning(user, contact)
    @user = user
    mail(to: contact, subject: "IMPORTANT MESSAGE ABOUT #{@user.first_name} #{@user.last_name}")

  def add_contact(user, contact)
    @user = user
    @contact = contact
    address = @contact.email
    mail(to: address, subject: "IMPORTANT MESSAGE ABOUT #{@user.first_name} #{@user.last_name}")

  end

end
# (verification_token: @contact.verification_token)
# "http://localhost:3000/?verification_token=#{@contact.verification_token}"
