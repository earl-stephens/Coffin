require 'time'
require 'date'

class DeadManSwitch < ApplicationRecord
  # validations
  validates_presence_of :interval_in_seconds


  # relationships
  belongs_to :user

  INTERVALS = ["Days", "Hours", "Years"]

  # instance methods
  def expires_at_in_time
    date = updated_at + interval_in_seconds
    date_in_time = Time.parse(date.to_s)
  end

  def expires_at_in_date_time
    date = updated_at + interval_in_seconds
    date_in_datetime = DateTime.parse(date.to_s)
  end

end
