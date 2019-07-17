require 'rails_helper'

RSpec.describe 'as a visitor' do
  context 'on the root path' do
    it 'sees links to login, create account, about and home' do
      visit root_path

      expect(page).to have_link('Login')
      expect(page).to have_link('Create Account')
      expect(page).to have_link('About')
      expect(page).to have_link('Home')
    end
  end
end