require 'rails_helper' 

RSpec.describe 'as a logged in user' do
  context 'on the extra information path' do
    it 'can upload a will document, if none is attached' do

      user = User.create(first_name: 'ricky', last_name: 'bobby', email: 'email@email.com', phone: '123')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit profile_path

      expect(current_path).to eq(profile_path)
      click_link 'Add Information'

      expect(current_path).to eq(extra_info_path(user))

      within('.will') do
        click_link 'Add A Will'
      end
    end

    it 'can download file when attached' do
      user = User.create(first_name: 'ricky', last_name: 'bobby', email: 'email@email.com', phone: '123')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      # this is tested in the user model
      user.will.attach(io: File.open("./storage/1TestWill.pdf"), filename: "1TestWill.pdf", content_type: "pdf")

      visit extra_info_path(user)

      within '.will' do
        expect(page).to have_link('Download Will Here')
      end
    end
  end
end