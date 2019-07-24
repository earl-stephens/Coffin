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
    binding.pry
    @user.funeral.create(funeral_params)
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
