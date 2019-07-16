class User < ApplicationRecord

  # validations

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :phone
  validates_presence_of :email

  # relationships

  has_many :financial_accounts
  has_many :contacts

end
