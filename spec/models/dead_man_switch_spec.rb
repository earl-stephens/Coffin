require 'rails_helper'

RSpec.describe DeadManSwitch do
  describe 'validations' do
    it { should validate_presence_of :interval_in_seconds }
  end

  describe 'relationships' do
    it { should belong_to :user }
  end

  describe 'instance methods' do
    it 'can return expiration date in Time' do
      user = create(:user)

      dead_man_switch = DeadManSwitch.create(user_id: user.id, interval_in_seconds: 86400)
      now_time = Time.now
      tomorrow_time = now_time + 1.days
      now = now_time.to_s
      tomorrow = tomorrow_time.to_s

      expect(dead_man_switch.expires_at_in_time).to eq(tomorrow)
    end

    it 'can return expiration date in DateTime' do
      user = create(:user)

      dead_man_switch = DeadManSwitch.create(user_id: user.id, interval_in_seconds: 86400)
      now_time = DateTime.now
      tomorrow_time = now_time + 1.days
      now = now_time.to_s
      tomorrow = tomorrow_time.to_s

      expect(dead_man_switch.expires_at_in_date_time).to eq(tomorrow)
    end
  end
end
