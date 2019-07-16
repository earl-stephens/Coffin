require 'rails_helper'

RSpec.describe DeadManSwitch do
  describe 'validations' do
    it { should validate_presence_of :length_of_time }
  end
end
