class ExtraInfoController < ApplicationController

  def index
    @user = current_user
  end
  
  def show
  end

  def edit
    @user = User.find(params['id'])
  end

  def create
  end 

  def update
    @user = current_user
    if params.has_key?('will')
      @user.will.attach(params['will'])
      flash[:success] = "Your new will has been added!"
    else params.has_key?('finance_records')
      require 'pry'; binding.pry
      @user.finance_records.attach(params['finance_records'])
      flash[:success] = "Your new financial record has been added!"
    end
    redirect_to extra_info_path(@user)
  end

  private

    def upload_params
      params.permit(:will, :finance_record)
    end
end
