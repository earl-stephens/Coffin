require 'rails_helper'

RSpec.describe 'As a primary contact for a user', type: :feature do
  before :each do
    @user = create(:user) # this user is alive at this point
    @dmswitch = DeadManSwitch.create!(user_id: @user.id,
                                    created_at: 16.days.ago,
                                    updated_at: 23.hours.ago,
                                    interval_in_seconds: 86400)
    first_name = 'Marsellus'
    last_name = 'Wallace'
    email = 'bplantico@gmail.com'
    phone = '3038100629'
    role = "primary"

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit new_profile_contact_path

    fill_in 'contact[first_name]', with: first_name
    fill_in 'contact[last_name]', with: last_name
    fill_in 'contact[email]', with: email
    fill_in 'contact[phone]', with: phone
    fill_in 'contact[role]', with: role
  end

  it 'I receive an email to see the report for my user' do

    expect { click_on 'Add Contact' }.to change { ActionMailer::Base.deliveries.count }.by(1)

    expect(current_path).to eq(profile_path)
  end

  xit 'and when I click on the link in the email' do
    click_on 'View Report'

    contact = Contact.last

    visit verified_email_path(verification_token: contact.verification_token)

    expect(contact.verified). to be false

    click_on 'Authenticated Login'
    contact.reload

    expect(current_path).to eq(report_path)
    expect(contact.verified).to be true

  end
end
#
# require "rails_helper"
#
# RSpec.describe ContactNotifierMailer, type: :feature do
#   it "can send a notification email" do
#     user1 = User.create!(first_name: 'John',
#                         last_name: 'Doe',
#                         email: 'johndoe@example.com',
#                         phone: '1234567890',
#                         address: '123 Main St, Denver, CO, 80205',
#                         organ_donor: true,
#                         place_of_birth: 'Fresno,CA',
#                         deceased: true)
#     dmswitch = DeadManSwitch.create!(user_id: user1.id,
#                                     created_at: 16.days.ago,
#                                     updated_at: 23.hours.ago,
#                                     interval_in_seconds: 86400)
#     contact1 = Contact.create!(first_name: 'Alex',
#                               last_name: 'Der',
#                               email: 'alex@der.com',
#                               phone: '1012223456',
#                               role: 0,
#                               user_id: user1.id)
#     contact2 = Contact.create!(first_name: 'Alex',
#                               last_name: 'Dra',
#                               email: 'alex_dra@example.com',
#                               phone: '4445555555',
#                               role: 0,
#                               user_id: user1.id)
#     contact3 = Contact.create!(first_name: 'Mills',
#                               last_name: 'Provosty',
#                               email: 'mills@example.com',
#                               phone: '9990001111',
#                               role: 1,
#                               user_id: user1.id)
#     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
#
#     visit '/notification'
#
#     expect(current_path).to eq(dashboard_path)
#   end
#
#   it 'can send a notice of death' do
#     user1 = User.create!(first_name: 'John',
#                         last_name: 'Doe',
#                         email: 'johndoe@example.com',
#                         phone: '1234567890',
#                         address: '123 Main St, Denver, CO, 80205',
#                         organ_donor: true,
#                         place_of_birth: 'Fresno,CA',
#                         deceased: true)
#     dmswitch = DeadManSwitch.create!(user_id: user1.id,
#                                     created_at: 16.days.ago,
#                                     updated_at: 23.hours.ago,
#                                     interval_in_seconds: 0)
#     contact1 = Contact.create!(first_name: 'Alex',
#                               last_name: 'Der',
#                               email: 'alex@der.com',
#                               phone: '1012223456',
#                               role: 0,
#                               user_id: user1.id)
#     contact2 = Contact.create!(first_name: 'Alex',
#                               last_name: 'Dra',
#                               email: 'alex_dra@example.com',
#                               phone: '4445555555',
#                               role: 0,
#                               user_id: user1.id)
#     contact3 = Contact.create!(first_name: 'Mills',
#                               last_name: 'Provosty',
#                               email: 'mills@example.com',
#                               phone: '9990001111',
#                               role: 1,
#                               user_id: user1.id)
#     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
#
#     visit '/notification'
#
#     user1.reload
#     expect(current_path).to eq(dashboard_path)
#     expect(user1.deceased).to eq(true)
#   end
# end
