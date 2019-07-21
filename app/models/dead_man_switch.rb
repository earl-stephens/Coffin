class DeadManSwitch < ApplicationRecord

  # validations

  validates_presence_of :start_time
  validates_presence_of :interval
  validates_presence_of :interval_type

  # relationships

  belongs_to :user

end
