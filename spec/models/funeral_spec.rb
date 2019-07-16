require 'rails_helper'

RSpec.describe Funeral do
  describe 'validations' do
    it { should validate_presence_of :burial_cremation }
  end

  describe  'enums' do
    before :each do
      @funeral = Funeral.create(burial_cremation: 0)
    end

    it 'A burial funeral can be created' do
      expect(@funeral.burial_cremation).to eq('burial')
    end

    it 'Funeral burial_cremation can be changed' do
      @funeral.update(burial_cremation: 1)

      expect(@funeral.burial_cremation).to eq('cremation')
    end

    it 'Funeral type of service enum works' do
      @funeral.update(type_of_service: 0)
      expect(@funeral.type_of_service).to eq('traditional')
      @funeral.update(type_of_service: 1)
      expect(@funeral.type_of_service).to eq('military')
      @funeral.update(type_of_service: 5)
      expect(@funeral.type_of_service).to eq('closed_casket')
    end
  end
end
