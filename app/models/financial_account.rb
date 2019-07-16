class FinancialAccount < ApplicationRecord

  validates_presence_of :institution_name
  validates_presence_of :account_number

end
