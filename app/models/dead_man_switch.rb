class DeadManSwitch < ApplicationRecord

  # validations

  validates_presence_of :length_of_time

  # relationships

  belongs_to :user

end
