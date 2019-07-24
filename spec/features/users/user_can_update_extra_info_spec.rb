require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'I can update extra info in my profile' do
    before :each do
      @user1 = User.create(first_name: "Bob", last_name: "Olsen", email: "bob@gmail.com")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
    end

    it 'I can update organ donor to true' do
      visit profile_path

      within('.organ_donor')

      expect(page).to have_content('Organ Donor')

      choose('user[organ_donor]', option: "true")
    end
  end
end
