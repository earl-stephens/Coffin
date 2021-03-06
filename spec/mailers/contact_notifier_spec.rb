require "rails_helper"

RSpec.describe ContactNotifierMailer, type: :feature do
  xit "can send a notification email" do
    user1 = User.create!(first_name: 'John',
                        last_name: 'Doe',
                        email: 'johndoe@example.com',
                        phone: '1234567890',
                        address: '123 Main St, Denver, CO, 80205',
                        organ_donor: true,
                        place_of_birth: 'Fresno,CA',
                        deceased: true)
    dmswitch = DeadManSwitch.create!(user_id: user1.id,
                                    created_at: 16.days.ago,
                                    updated_at: 23.hours.ago,
                                    interval_in_seconds: 86400)
    contact1 = Contact.create!(first_name: 'Alex',
                              last_name: 'Der',
                              email: 'alex@der.com',
                              phone: '1012223456',
                              role: 0,
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
                              role: 1,
                              user_id: user1.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit '/notification'

    expect(current_path).to eq(dashboard_path)
  end

  xit 'can send a notice of death' do
    user1 = User.create!(first_name: 'John',
                        last_name: 'Doe',
                        email: 'johndoe@example.com',
                        phone: '1234567890',
                        address: '123 Main St, Denver, CO, 80205',
                        organ_donor: true,
                        place_of_birth: 'Fresno,CA',
                        deceased: true)
    dmswitch = DeadManSwitch.create!(user_id: user1.id,
                                    created_at: 16.days.ago,
                                    updated_at: 23.hours.ago,
                                    interval_in_seconds: 0)
    contact1 = Contact.create!(first_name: 'Alex',
                              last_name: 'Der',
                              email: 'alex@der.com',
                              phone: '1012223456',
                              role: 0,
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
                              role: 1,
                              user_id: user1.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit '/notification'

    user1.reload
    expect(current_path).to eq(dashboard_path)
    expect(user1.deceased).to eq(true)
  end
end
