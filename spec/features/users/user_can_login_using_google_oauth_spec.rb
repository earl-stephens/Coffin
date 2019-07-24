require 'rails_helper'
require 'vcr'

RSpec.describe 'As a visitor' do
  describe 'when I visit the welcome path' do
    it 'I see a link to Login' do
      visit '/'

      expect(page).to have_link('Login using Google')
    end

    context 'and I click link to login using google and complete oauth process' do
      it "I am taken to my dashboard" do

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
        click_link 'Logout'
        click_link 'Login using Google'

        user = User.last

        expect(current_path).to eq(dashboard_path)
      end
    end

    # context 'and I click link to login using google and complete oauth process' do
    #   it "I am taken root path with error message if something goes wrong" do
    #
    #     visit '/'
    #
    #     OmniAuth.config.test_mode = true
    #
    #     OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
    #       provider: 'google_oa',
    #       credentials: { token: ENV['SomeFakeToken'] },
    #       info: { first_name: "Hacker",
    #                last_name: "Joe",
    #                email: "hackerjoe@gmail.com"}
    #       })
    #
    #     click_link 'Register using Google'
    #     save_and_open_page
    #     expect(current_path).to eq(root_path)
    #   end
    # end
  end
end
