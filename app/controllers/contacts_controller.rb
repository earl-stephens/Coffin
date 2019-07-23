class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    @contact[:user_id] = current_user.id
    if @contact.save
      flash[:success] = "Your new contact has been added!"
      redirect_to profile_path
    else
      flash[:danger] = @contact.errors.full_messages
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone)
  end
end
