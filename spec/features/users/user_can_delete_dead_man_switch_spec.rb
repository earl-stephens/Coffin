require 'rails_helper'

RSpec.describe "As a logged in user" do
  describe "and I visit the dashboard" do
    describe "I see a button to cancel my dead man switch" do
      before :each do
        @user1 = User.create(first_name: "Bob", last_name: "Olsen", email: "bob@gmail.com")

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
      end

      xit "I can cancel my dead man switch" do
        visit profile_path(@user1)

        select "Months", from: :interval
        fill_in 'quantity', with: 1
        click_on "Save"

        expect(current_path).to eq(dashboard_path)

        expect(page).to have_button("Cancel Dead Man Switch")

        click_button "Cancel Dead Man Switch"

        @user1.reload
        expect(current_path).to eq(profile_path(@user1))
        expect(page).to have_content("Your switch has been cancelled.")
        expect(@user1.dead_man_switch).to eq(nil)
      end
    end
  end
end
