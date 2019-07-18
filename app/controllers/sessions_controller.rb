class SessionsController < ApplicationController
  def googleAuth
    # Gets access tokens from the google server
    auth = request.env["omniauth.auth"]
    user = User.find_or_create_by(google_uid: auth.uid)
    user.first_name = auth.info.first_name
    user.last_name = auth.info.last_name
    user.google_token = auth.credentials.token
    user.email = auth.info.email

    if user.save
      session[:user_id] = user.id
      redirect_to edit_user_path(user)
    else
      flash[:danger] = "Oops! Something went wrong."
      redirect_to root_path
    end
  end
end
