class ExtraInfoController < ApplicationController

  def index
    #current_user?
    @user = User.find(params['id'])
  end

  def edit
    @user = User.find(params['id'])
  end

  def create
    require 'pry'; binding.pry
  end 

  def update
    @user = current_user
    # user = current_user
    # require 'pry'; binding.pry
    # @user.will.attach(File.open('./storage/TestWill.pdf'))
    # @user.will.attach(params)
    redirect_to profile_path
  end

  private

    def upload_params
      params.permit(:will, :authenticity_token, :utf8, :commit, :id)
    end

end
