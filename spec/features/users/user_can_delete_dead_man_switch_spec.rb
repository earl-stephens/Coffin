require 'rails_helper'

RSpec.describe "As a logged in user" do
  describe "and I visit the dashboard" do
    describe "I see a button to cancel my dead man switch" do
      before :each do
        @user1 = User.create(first_name: "Bob", last_name: "Olsen", email: "bob@gmail.com")
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
      end

      it "I can cancel my dead man switch" do
        visit profile_path(@user1)

        select "Months", from: :interval
        # select "intervals", from: :interval
        fill_in 'quantity', with: 1
        click_on "Save"

        save_and_open_page
        expect(current_path).to eq(dashboard_path)

        expect(page).to have_button("Cancel Dead Man Switch")
      end
    end
  end
end
