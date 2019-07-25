require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'with an dead man switch set' do
    before :each do
      yesterday = 1.days.ago
      @user = create(:user)
      @dms = DeadManSwitch.create(user_id: @user.id, interval_in_seconds: 86401,\
        created_at: yesterday, updated_at: yesterday)
    end

    it 'I receive a text message notification if it will expire within one day' do

    end
  end
end
