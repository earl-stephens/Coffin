require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'and I visit the profile page' do
    before :each do
      @user1 = User.create(first_name: "Bob", last_name: "Olsen", email: "bob@gmail.com")
      @contact1 = Contact.create!(first_name: 'Alex',
                                last_name: 'Dra',
                                email: 'alex_dra@example.com',
                                phone: '4445555555',
                                role: 0,
                                user_id: @user1.id)
      @contact2 = Contact.create!(first_name: 'Mills',
                                last_name: 'Provosty',
                                email: 'mills@example.com',
                                phone: '9990001111',
                                role: 1,
                                user_id: @user1.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
    end

    it 'I can set the dead man switch parameters' do
      visit profile_path
      select 'Days', from: :interval
      fill_in 'quantity', with: 7
      click_on 'Save'

      expect(@user1.dead_man_switch.interval_in_seconds).to eq(604800)

      @user1.reload

      visit profile_path
      select 'Months', from: :interval
      fill_in 'quantity', with: 1
      click_on 'Save'

      expect(@user1.dead_man_switch.interval_in_seconds).to eq(2629746)

      @user1.reload

      visit profile_path
      select 'Years', from: :interval
      fill_in 'quantity', with: 1
      click_on 'Save'

      expect(@user1.dead_man_switch.interval_in_seconds).to eq(31556952)
    end
  end
end
