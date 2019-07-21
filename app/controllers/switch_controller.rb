class SwitchController < ApplicationController
  def update
    time = DeadManSwitch.find_by(user_id: current_user.id).length_of_time.to_i
    binding.pry

  end
end
