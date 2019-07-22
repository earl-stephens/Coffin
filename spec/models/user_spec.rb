require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
  end

  describe 'relationships' do
    it { should have_many :financial_accounts }
    it { should have_many :contacts }
    it { should have_one :dead_man_switch }
    it { should have_one :employer }
    it { should have_one :funeral }
  end

  describe 'instance methods' do
    it '.find_primary_contact_email' do
      user1 = User.create!(first_name: 'John',
                          last_name: 'Doe',
                          email: 'johndoe@example.com',
                          phone: '1234567890',
                          address: '123 Main St, Denver, CO, 80205',
                          organ_donor: true,
                          place_of_birth: 'Fresno,CA',
                          deceased: true)
      contact1 = Contact.create!(first_name: 'Alex',
                                last_name: 'Der',
                                email: 'alex@der.com',
                                phone: '1012223456',
                                role: 1,
                                user_id: user1.id)
      contact2 = Contact.create!(first_name: 'Alex',
                                last_name: 'Dra',
                                email: 'alex_dra@example.com',
                                phone: '4445555555',
                                role: 0,
                                user_id: user1.id)
      contact3 = Contact.create!(first_name: 'Mills',
                                last_name: 'Provosty',
                                email: 'mills@example.com',
                                phone: '9990001111',
                                role: 0,
                                user_id: user1.id)

      contact_email = user1.find_primary_contact_email
      expect(contact_email).to eq(contact1.email)
    end
  end

  describe 'attachments' do
    it 'can attach a file' do
      user = User.create(first_name: 'John',
                            last_name: 'Doe',
                            email: 'johndoe@example.com',
                            phone: '1234567890')

      expect(user.will.attached?).to eq(false)

      user.will.attach(io: File.open("./storage/1TestWill.pdf"), filename: "1TestWill.pdf", content_type: "pdf")

      expect(user.will.attached?).to eq(true)
    end
  end
end
