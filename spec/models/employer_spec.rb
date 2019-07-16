require 'rails_helper'

RSpec.describe Employer do
  describe 'validations' do
    it { should validate_presence_of :employer_company }
    it { should validate_presence_of :employer_contact }
    it { should validate_presence_of :phone }
  end
end
