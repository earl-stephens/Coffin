require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'I can update extra info in my profile' do
    before :each do
      @user1 = User.create(first_name: "Bob", last_name: "Olsen", email: "bob@gmail.com")
    end

    it 'I can update organ donor to true' do
      visit edit_info_path(@user1)

      within('.organ_donor')
      expect(page).to have_content('Organ Donor Status: false')


      expect
    end
  end
end
