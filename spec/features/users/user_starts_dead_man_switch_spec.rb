require 'rails_helper'

RSpec.describe "As a logged in user" do
  describe "and I visit the dashboard" do
    describe "I see a button to activate my dead man switch" do
      before :each do
        @user1 = User.create(first_name: "Bob", last_name: "Olsen", email: "bob@gmail.com")
        @dead_man_switch = DeadManSwitch.create(user_id: @user1.id, interval: 7, interval_type: "days", start_time: Time.now)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
      end
      it "I can activate my dead man switch" do
        visit dashboard_path

        expect(page).to have_button("Dead Man's Switch")

        click_button("Dead Man's Switch")
      end
    end
  end
end
