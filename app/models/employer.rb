class Employer < ApplicationRecord

  validates_presence_of :employer_company
  validates_presence_of :employer_contact
  validates_presence_of :phone

end
