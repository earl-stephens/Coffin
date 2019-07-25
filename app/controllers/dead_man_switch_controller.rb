class DeadManSwitchController < ApplicationController

  def create
    convert_time(switch_params)
    @user = current_user
    @dead_man_switch = DeadManSwitch.find_or_create_by(user_id: @user.id)
    @dead_man_switch.update(interval_in_seconds: @length_of_time_for_switch)
    data = {
      "updated_at": "#{@dead_man_switch.updated_at.to_i}",
      "interval": "#{@user.dead_man_switch.interval_in_seconds}",
      "user_id": "#{@user.id}"
    }
    data = data.to_json
    service_results(data)
    session[:time_difference] = service_results(data)[:time_difference]
    session[:formatted_date] = expiration_date
    redirect_to notification_path
  end

  def update
    @user = current_user
    @user.dead_man_switch.update(updated_at: Time.now)
    @user.dead_man_switch.save
    @user.dead_man_switch.update(one_day_message_sent:  false)
    @user.dead_man_switch.save
    @user.dead_man_switch.update(one_hour_message_sent: false)
    @user.dead_man_switch.save
    @updated_at = @user.dead_man_switch.updated_at.to_i
    data = {
      "updated_at": "#{@user.dead_man_switch.updated_at.to_i}",
      "interval": "#{@user.dead_man_switch.interval_in_seconds}",
      "user_id": "#{@user.id}"
    }
    data = data.to_json
    session[:time_difference] = service_results(data)[:time_difference]
    session[:formatted_date] = expiration_date
    redirect_to notification_path
  end

  def destroy
    @user = current_user
    @switch = DeadManSwitch.find(@user.dead_man_switch.id)
    @switch.destroy
    flash[:message] = "Your switch has been cancelled."

    redirect_to profile_path(@user)
  end



  private

  def convert_time(switch_params)
    interval_type = switch_params[:interval]
    time = switch_params[:quantity].to_i
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
    return @length_of_time_for_switch
  end

  def expiration_date
    date = @user.dead_man_switch.updated_at + @user.dead_man_switch.interval_in_seconds
    formatted_date = date.strftime('%B %-d, %Y at %l:%M:%S')
  end

  def switch_params
    params.permit(:interval, :quantity)
  end


  def service
    @_service ||= SinatraService.new
  end

  def service_results(data)
    @_service_results ||= service.grab_data(data)
  end
end
