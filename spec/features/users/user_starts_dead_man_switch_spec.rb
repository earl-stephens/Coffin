require 'rails_helper'

RSpec.describe "As a logged in user" do
  describe "and I visit the dashboard" do
    describe "I see a button to activate my dead man switch" do
      before :each do
        @user_1 = User.create(first_name: "Bob", last_name: "Olsen", email: "bob@gmail.com")
        @dead_man_switch = DeadManSwitch.create(user_id: @user_1.id, interval_in_seconds: 86400)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
      end
      it "I can activate my dead man switch" do
        visit dashboard_path

        expect(page).to have_button("I'm Still Alive!")

        click_button("I'm Still Alive!")

        expect(page).to have_content("Your Dead Man Switch has been reset and will expire on")
      end
    end
  end
end
