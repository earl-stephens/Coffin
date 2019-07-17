require 'rails_helper'

RSpec.describe 'as a visitor' do
  context 'on the root path' do
    it 'sees links to login, create account, about and home in the nav bar' do
      visit root_path

      expect(page).to have_link('Login')
      expect(page).to have_link('Create Account')
      expect(page).to have_link('About')
      expect(page).to have_link('Home')
    end

    it 'can visit the about page' do
      visit root_path

      click_link 'About'
      expect(current_path).to eq(about_path)
      expect(page).to have_content('About Coffin')
      expect(page).to have_content('Frequently Asked Questions')
    end

    it 'can visit the home page' do
      visit about_path

      click_link 'Home'
      expect(current_path).to eq(root_path)
      expect(page).to have_content('Welcome to Coffin')
    end
  end
end