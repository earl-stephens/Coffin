class UsersController < ApplicationController
  before_action :require_reguser, except: [:new, :create]

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    flash[:success] = 'Your information has been successfully saved.'
    redirect_to "/extra_user_info_edit/#{user.id}"
  end

  def show
    
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :address)
  end
end
