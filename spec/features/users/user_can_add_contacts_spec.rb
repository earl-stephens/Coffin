require 'rails_helper'

RSpec.describe "As a user" do
  describe "when I visit my profile page" do
    before :each do
      @user_1 = create(:user)
      @contact_1 = {first_name: 'Nicolas', last_name: 'Cage', phone: '3038100629', email: 'bplantico@gmail.com'}

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
    end

    it "I see a link to add a new contact" do

      visit profile_path

      expect(page).to have_link("Add A Contact")
    end

    it "I can create a new contact" do
      visit profile_path

      click_link "Add A Contact"

      expect(current_path).to eq(new_profile_contact_path)

      fill_in "contact_first_name", with: @contact_1[:first_name]
      fill_in "contact_last_name", with: @contact_1[:last_name]
      fill_in "contact_email", with: @contact_1[:phone]
      fill_in "contact_phone", with: @contact_1[:email]
      click_button "Add Contact"

      expect(current_path).to eq(profile_path)
      expect(page).to have_content("Your new contact has been added!")
      expect(page).to have_content(@user_1.contacts.last.first_name)
      expect(page).to have_content(@user_1.contacts.last.last_name)
    end
  end
end
