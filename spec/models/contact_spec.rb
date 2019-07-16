require 'rails_helper'

RSpec.describe Contact do
  describe 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :phone }
  end

  describe 'enums' do
    before :each do
      @contact = Contact.create(first_name: 'First', last_name: 'Last', email: 'user@email.com', phone: '1111111111')
    end

    it 'Contact role defaults to 0' do
      expect(@contact.role).to eq('secondary')
    end

    it 'Contact role can be changed to primary' do
      @contact.update(role: 1)

      expect(@contact.role).to eq('primary')
    end
  end
end
