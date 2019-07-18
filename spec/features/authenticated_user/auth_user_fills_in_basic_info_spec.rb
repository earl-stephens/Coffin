require "rails_helper"

RSpec.describe 'authenticated user on new user path', type: :feature do
  it 'can fill in basic info' do
    new_user = User.create!(first_name: 'John',
                            last_name: 'Doe',
                            email: 'john@doe.com',
                            phone: '1234567890')
    first_name = 'Jonathan'
    last_name = 'Doe II'
    email = 'john_doe@gmail.com'
    phone = '1112223333'
    address = '123 Main Street, Royal City, Naboo, 12345'

    visit edit_user_path(new_user)

    fill_in :user_first_name, with: first_name
    fill_in :user_last_name, with: last_name
    fill_in :user_email, with: email
    fill_in :user_phone, with: phone
    fill_in :user_address, with: address

    click_on 'Save'

    new_user.reload

    expect(current_path).to eq("/extra_user_info_edit/#{new_user.id}")
    expect(page).to have_content('Successfully created new user.')
    expect(new_user.first_name).to eq(first_name)
    expect(new_user.last_name).to eq(last_name)
  end
end
