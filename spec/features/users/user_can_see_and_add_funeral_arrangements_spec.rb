require 'rails_helper'

RSpec.describe "As a user on the profile page" do
  before :each do
    @user1 = User.create(first_name: "Bob", last_name: "Olsen", email: "bob@gmail.com")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
  end

  it "I can see a section for funeral arrangements" do
    visit profile_path

    within('.funeral-box')
    expect(page).to have_content('Funeral Arrangements')
    expect(page).to have_link('Add Funeral Arrangement')

    click_link 'Add Funeral Arrangement'

    expect(current_path).to eq(new_user_funeral_path(@user1))

    select 'Cremation', from: :funeral_burial_cremation

    fill_in 'Funeral home name', with: "Morbid's Mortuary"
    fill_in 'Funeral home phone', with: "1-800-GO2-HELL"
    fill_in 'Funeral home address', with: "4321 Your Dead St. Denver, Co"

    select 'Hindu', from: :funeral_type_of_service

    choose('funeral[plot_purchased]', option: "true")
    find(:css, '#funeral_plot_purchased_true').click

    choose('funeral[coffin_or_urn_purchased]', option: "true")
    find(:css, '#funeral_coffin_or_urn_purchased_true').click

    choose('funeral[docs_or_contract_exist]', option: "true")
    find(:css, '#funeral_docs_or_contract_exist_true').click

    click_on 'Update'

    @user1.reload
    binding.pry
    expect(@user1.funeral.burial_cremation).to eq('Cremation')

  end
end
