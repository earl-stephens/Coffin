class ExtraInfoController < ApplicationController

  def index
    @user = current_user
    if @user.will.attached?
      @link = rails_blob_path(@user.will_attachment, disposition: "attachment")
    end
  end
  
  def show
  end

  def edit
    @user = User.find(params['id'])
  end

  def create
    require 'pry'; binding.pry
  end 

  def update
    @user = current_user
    @user.will.attach(params[:will])
    redirect_to profile_path
  end

  private

    def upload_params
      params.permit(:will)
    end

end
