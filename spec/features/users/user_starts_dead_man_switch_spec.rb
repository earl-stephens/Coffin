require 'rails_helper'

RSpec.describe "As a logged in user" do
  describe "and I visit the dashboard" do
    describe "I see a button to reset my dead man switch timer" do
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
        @dead_man_switch = DeadManSwitch.create(user_id: @user1.id, interval_in_seconds: 86400)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
      end

      it "I can reset my dead man switch timer" do
        visit dashboard_path

        expect(page).to have_button("I'm Still Alive!")

        click_button("I'm Still Alive!")
        date = @user1.dead_man_switch.updated_at + @user1.dead_man_switch.interval_in_seconds
        expiration_date = date.strftime('%B %-d, %Y at%l:%M:%S')

        expect(page).to have_content("Your Dead Man Switch has been reset and will expire on")
      end
    end
  end
end
