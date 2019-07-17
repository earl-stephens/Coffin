class FinancialAccount < ApplicationRecord

  # validations

  validates_presence_of :institution_name
  validates_presence_of :account_number

  # relationships

  belongs_to :user

end
