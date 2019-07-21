require 'rails_helper'

RSpec.describe DeadManSwitch do
  describe 'validations' do
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :interval }
    it { should validate_presence_of :interval_type }
  end

  describe 'relationships' do
    it { should belong_to :user }
  end
end
