require 'rails_helper'

RSpec.describe Funeral do
  describe 'validations' do
    it { should validate_presence_of :burial_cremation }
  end
end
