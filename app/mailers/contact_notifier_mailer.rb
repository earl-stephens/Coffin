class ContactNotifierMailer < ApplicationMailer

  def death_notice(user, contact)
    @user = current_user
    mail(to: contact, subject: "IMPORTANT MESSAGE ABOUT #{@user.first_name @user.last_name}")
  end

end
