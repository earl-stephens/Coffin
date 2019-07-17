require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'when I visit welcome page' do
    it 'I see a link to register' do
      visit '/'

      expect(page).to have_link('Register using Google')
    end
  end
end
