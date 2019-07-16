class Contact < ApplicationRecord

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :phone
  validates_presence_of :email
  
end
