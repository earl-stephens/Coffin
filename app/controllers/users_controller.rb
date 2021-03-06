class UsersController < ApplicationController
  before_action :require_reguser, except: [:new, :create]

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    flash[:success] = 'Your information has been successfully saved.'
    redirect_to profile_path
  end

  def show
    @user = current_user
    @funeral = @user.funeral
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :address, :organ_donor, :place_of_birth, :maiden_name)
  end
end
