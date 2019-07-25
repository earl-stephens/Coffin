class FuneralsController < ApplicationController
  # def show
  #   @user = current_user
  # end

  def new
    @user = current_user
    @funeral = Funeral.new
  end

  def create
    @user = current_user
    @funeral = Funeral.new(funeral_params)
    @funeral.update(user_id: @user.id)
    if @funeral.save
      flash[:message] = "Your funeral arrangement updates have been saved."
      redirect_to profile_path
    else
      flash[:error] = @funeral.errors.full_messages
      render :new
    end
  end

  def edit
    @user = current_user
    @funeral = @user.funeral
  end

  def update
    @user = current_user
    @funeral ||= @user.funeral
    @funeral.update(funeral_params)
    if @funeral.save
      flash[:message] = "Your funeral arrangement updates have been saved."
      redirect_to profile_path
    else
      flash[:error] = @funeral.errors.full_messages
      render :new
    end
  end

  private

  def funeral_params
    params.require(:funeral).permit(:burial_cremation,
                                    :funeral_home_name,
                                    :funeral_home_phone,
                                    :funeral_home_address,
                                    :type_of_service,
                                    :plot_purchased,
                                    :coffin_or_urn_purchased,
                                    :package_purchased,
                                    :docs_or_contract_exist)
  end
end
