require 'rails_helper'

RSpec.describe DeadManSwitch do
  describe 'validations' do
    it { should validate_presence_of :length_of_time }
  end

  describe 'relationships' do
    it { should belong_to :user }
  end
end
