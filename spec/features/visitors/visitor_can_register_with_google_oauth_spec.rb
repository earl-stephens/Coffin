require 'rails_helper'
require 'vcr'

RSpec.describe 'As a visitor' do
  describe 'when I visit the welcome path' do

    before :each do
      OmniAuth.config.mock_auth[:google_oauth2] = nil
    end

    it 'I see a link to register' do
      visit '/'

      expect(page).to have_link('Register using Google')
    end

    context 'and I click link to register using google and complete oauth process' do
      it "I am not logged in if invalid credentials" do

        visit '/'

        OmniAuth.config.test_mode = true

        OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentials

            click_link 'Register using Google'

            expect(current_path).to eq(root_path)
            expect(page).to_not have_content("Logout")
          end

      it "I am taken to a form to complete my profile" do

        visit '/'

        OmniAuth.config.test_mode = true

        OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
          provider: 'google_oauth2',
          credentials: { token: ENV['GOOGLE_TOKEN'] },
          info: { first_name: "Ryan",
                   last_name: "M",
                   email: "ryanmillergm@gmail.com"}
          })

        click_link 'Register using Google'

        user = User.last

        expect(current_path).to eq(edit_user_path(user))
      end

    end
  end
end
