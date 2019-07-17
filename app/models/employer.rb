class Employer < ApplicationRecord

  # validations

  validates_presence_of :employer_company
  validates_presence_of :employer_contact
  validates_presence_of :phone

  # relationships

  belongs_to :user

end
