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
    else params.has_key?('finance_records')
      @user.finance_records.attach(params['finance_records'])
    end
      
    redirect_to profile_path
  end

  private

    def upload_params
      params.permit(:will, :finance_record)
    end
end
