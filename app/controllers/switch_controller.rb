class SwitchController < ApplicationController
  def update
    switch = DeadManSwitch.find_by(user_id: current_user.id)
    time = DeadManSwitch.find_by(user_id: current_user.id).start_time.to_i
    length_of_time_for_switch = nil
    if
      switch.interval_type == "days"
      length_of_time_for_switch = time + switch.interval.days.seconds.to_i
    elsif
      switch.interval_type == "months"
      length_of_time_for_switch = time + switch.interval.months.seconds.to_i
    elsif
      switch.interval_type == "years"
      length_of_time_for_switch = time + switch.interval.years.seconds.to_i
    end
  end
end
