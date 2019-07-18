class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    flash[:success] = 'Successfully created new user.'
    redirect_to "/extra_user_info_edit/#{user.id}"
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :address)
  end

end
