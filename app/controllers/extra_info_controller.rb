class ExtraInfoController < ApplicationController

  def index
    @user = current_user
    @user_progress = @user.progress
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
    elsif params.has_key?('powers_of_attorney')
      @user.powers_of_attorney.attach(params['powers_of_attorney'])
    elsif params.has_key?('birth_certificates')
      @user.birth_certificates.attach(params['birth_certificates'])
    elsif params.has_key?('finance_records')
      @user.finance_records.attach(params['finance_records'])
    elsif params.has_key?('misc_files')
      @user.misc_files.attach(params['misc_files'])
    elsif params.has_key?('va_benefits')
      @user.va_benefits.attach(params['va_benefits'])
    elsif params.has_key?('employment_info')
      @user.employment_info.attach(params['employment_info'])
    elsif params.has_key?('life_insurance')
      @user.life_insurance.attach(params['life_insurance'])
    elsif params.has_key?('ss_info')
      @user.ss_info.attach(params['ss_info'])
    elsif params.has_key?('tax_info')
      @user.tax_info.attach(params['tax_info'])
    elsif params.has_key?('obituary')
      @user.obituary.attach(params['obituary'])
    elsif params.has_key?('last_wishes')
      @user.last_wishes.attach(params['last_wishes'])
    elsif params.has_key?('funeral_info')
      @user.funeral_info.attach(params['funeral_info'])
    else params.has_key?('pet_info')
      @user.pet_info.attach(params['pet_info'])
    end
    redirect_to extra_info_path(@user)
  end

  private

    def upload_params
      params.permit(:will)
    end
end
