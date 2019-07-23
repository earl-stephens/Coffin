class Profile::ContactsController < Profile::BaseController
  def new
    @contact = Contact.new
  end

end
