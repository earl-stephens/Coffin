require 'rails_helper'

RSpec.describe "As a user on the profile page" do
  before :each do
    @user1 = User.create(first_name: "Bob", last_name: "Olsen", email: "bob@gmail.com")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
  end

  it "I can see a section for funeral arrangements" do
    visit profile_path

    within('.funeral-box')
    expect(page).to have_content('Funeral Arrangements')
    expect(page).to have_link('Add Funeral Arrangement')

    click_link 'Add Funeral Arrangement'

    expect(current_path).to eq(new_user_funeral_path(@user1))


  end
end
