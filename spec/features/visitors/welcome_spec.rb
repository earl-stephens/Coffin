require 'rails_helper'

RSpec.describe 'as a visitor' do
  context 'on the root path' do
    it 'can see the welcome page' do
      visit root_path

      expect(page).to have_content('Coffin is coming...')
    end
  end
end