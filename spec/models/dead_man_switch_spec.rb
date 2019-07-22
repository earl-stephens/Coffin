require 'rails_helper'

RSpec.describe DeadManSwitch do
  describe 'validations' do
    it { should validate_presence_of :interval_in_seconds }
  end

  describe 'relationships' do
    it { should belong_to :user }
  end
end
