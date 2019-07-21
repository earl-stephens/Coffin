class DeadManSwitchController < ApplicationController

  def create
    @length_of_time_for_switch = nil
    convert_time(params)
    @user = current_user
    @dead_man_switch = DeadManSwitch.create(user_id: @user.id, interval_in_seconds: @length_of_time_for_switch)
    redirect_to dashboard_path(@length_of_time_for_switch)
  end

  private

  def convert_time(params)
    interval_type = params[:interval]
    time = params[:quantity].to_i
    if
      interval_type == "Days"
      @length_of_time_for_switch = time.days.seconds.to_i
    elsif
      interval_type == "Months"
      @length_of_time_for_switch = time.months.seconds.to_i
    elsif
      interval_type == "Years"
      @length_of_time_for_switch = time.years.seconds.to_i
    end
  end
  # require.params(:user).permit(:interval, :quantity)

end
