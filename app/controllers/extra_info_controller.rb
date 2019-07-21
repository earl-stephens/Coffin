class ExtraInfoController < ApplicationController

  def index
    #current_user?
    @user = User.find(params['id'])
  end

  def edit
    @user = User.find(params['id'])
  end

  def update
    @user = User.find(params['id'])
    require 'pry'; binding.pry
  end

end
