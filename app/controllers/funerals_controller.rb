class FuneralsController < ApplicationController
  # def show
  #   @user = current_user
  # end

  def new
    @user = current_user
    @funeral = Funeral.new
  end

  def create

  end
end
