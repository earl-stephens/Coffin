class DeadManSwitch < ApplicationRecord
  # validations


  validates_presence_of :interval_in_seconds


  # relationships

  belongs_to :user

  INTERVALS = ["Days", "Hours", "Years"]

end
