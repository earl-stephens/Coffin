class Contact < ApplicationRecord

  # validations

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :phone
  validates_presence_of :email

  # enumerables

  enum role: [:secondary, :primary]

  # relationships

  belongs_to :user

end
