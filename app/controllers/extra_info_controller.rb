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
    if params.has_key?('wills')
      @user.wills.attach(params['wills'])
      flash[:success] = "Your new will has been added!"
    elsif params.has_key?('powers_of_attorney')
      @user.powers_of_attorney.attach(params['powers_of_attorney'])
      flash[:success] = "Your new power of attorney has been added!"
    elsif params.has_key?('birth_certificates')
      @user.birth_certificates.attach(params['birth_certificates'])
      flash[:success] = "Your new birth certificate has been added!"
    elsif params.has_key?('finance_records')
      @user.finance_records.attach(params['finance_records'])
      flash[:success] = "Your new financial record has been added!"
    elsif params.has_key?('misc_files')
      @user.misc_files.attach(params['misc_files'])
      flash[:success] = "Your new file has been added!"
    else params.has_key?('va_benefits')
      @user.va_benefits.attach(params['va_benefits'])
      flash[:success] = "Your VA file has been added!"
    end
    redirect_to extra_info_path(@user)
  end

  private

    def upload_params
      params.permit(:will, :finance_records)
    end
end
