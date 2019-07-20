require 'rails_helper'

RSpec.describe 'Site Nav', type: :feature do
  before :each do
    @user = create(:user)
  end

  it 'should show proper links for all visitors' do

    visit root_path

    expect(page).to_not have_link('Logout')
    expect(page).to_not have_link('Profile')
    expect(page).to_not have_link('Dashboard')

    expect(page).to have_link('Login')
    expect(page).to have_link('Register using Google')

    click_link 'About'
    expect(current_path).to eq(about_path)

    click_link 'Home'
    expect(current_path).to eq(root_path)

    visit profile_path
    expect(page.status_code).to eq(404)

    visit dashboard_path
    expect(page.status_code).to eq(404)
  end

  it 'should show proper links for all logged in user' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit root_path

    click_link 'Profile'
    expect(current_path).to eq(profile_path)

    click_link 'Dashboard'
    expect(current_path).to eq(dashboard_path)

    click_link 'Home'
    expect(current_path).to eq(root_path)

    click_link 'About'
    expect(current_path).to eq(about_path)

    click_link 'Logout'
    expect(current_path).to eq(root_path)

    expect(page).to have_link('Login')
    expect(page).to have_link('Register using Google')
    expect(page).to_not have_link('Dashboard')

    visit dashboard_path
    expect(page.status_code).to eq(404)
  end
end
