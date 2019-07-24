require 'rails_helper'

RSpec.describe "As a visitor" do
  it "if I visit an unauthorized path I am redirected to 404 error" do
    visit profile_edit_path

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
