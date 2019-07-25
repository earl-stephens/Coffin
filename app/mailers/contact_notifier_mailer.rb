class ContactNotifierMailer < ApplicationMailer

  def death_notice(user, contact)
    @user = user
    @contact = contact
    mail(to: @contact.email, subject: "IMPORTANT MESSAGE ABOUT #{@user.first_name} #{@user.last_name}")
  end

  def day_warning(user, contact)
    @user = user
    mail(to: contact, subject: "IMPORTANT MESSAGE ABOUT #{@user.first_name} #{@user.last_name}")
  end

  def hour_warning(user, contact)
    @user = user
    mail(to: contact, subject: "IMPORTANT MESSAGE ABOUT #{@user.first_name} #{@user.last_name}")
  end

  def add_contact(user, contact)
    @user = user
    @contact = contact
    address = @contact.email
    mail(to: address, subject: "IMPORTANT MESSAGE ABOUT #{@user.first_name} #{@user.last_name}")
  end
end
