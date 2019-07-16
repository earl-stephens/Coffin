require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :phone }
  end

  describe 'relationships' do
    it { should have_many :financial_accounts }
    it { should have_many :contacts }
    it { should have_one :dead_man_switch }
    it { should have_one :employer }

  end
end
