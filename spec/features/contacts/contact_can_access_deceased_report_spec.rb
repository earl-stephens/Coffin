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

  it 'and when I click on the link in the email' do
    click_on  "Add Contact"

    contact = Contact.last

    visit contact_login_path(verification_token: contact.verification_token)

    expect(contact.verified).to be false

    click_on 'View Report'
    contact.reload

    expect(current_path).to eq(report_path(contact))
    expect(contact.verified).to be true

  end
end
