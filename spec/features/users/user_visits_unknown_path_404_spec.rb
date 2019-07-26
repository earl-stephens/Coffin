require 'rails_helper'

RSpec.describe "As a user" do
  before :each do
    @user1 = User.create(first_name: "Bob", last_name: "Olsen", email: "bob@gmail.com")
  end
  xit "if I visit an unknown path I am redirected to 404 error" do
    visit '/somewhere'

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
