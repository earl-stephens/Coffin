require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'I can update extra info in my profile' do
    before :each do
      @user1 = User.create(first_name: "Bob", last_name: "Olsen", email: "bob@gmail.com")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
    end

    it 'I can update organ donor to true' do

      visit profile_path

      expect(@user1.organ_donor).to eq(false)

      within('.update-profile')

      expect(page).to have_content('Organ Donor')

      choose('user[organ_donor]', option: "true")
      find(:css, '#user_organ_donor_true').click

      click_on 'Update'
      @user1.reload
      expect(@user1.organ_donor).to eq(true)
    end

    it 'I can add place of birth' do
      visit profile_path

      fill_in "Place of birth", with: "Placentia, Ca"

      click_on 'Update'
      @user1.reload
      expect(@user1.place_of_birth).to eq("Placentia, Ca")
    end

    it 'I can add place my maiden name if applicable' do
      visit profile_path

      fill_in "Maiden name", with: "Johnson"

      click_on 'Update'

      @user1.reload
      expect(@user1.maiden_name).to eq("Johnson")
    end
  end
end
