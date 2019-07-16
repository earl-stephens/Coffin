require 'rails_helper'

RSpec.describe FinancialAccount do
  describe 'validations' do
    it { should validate_presence_of :institution_name }
    it { should validate_presence_of :account_number }
  end
end
