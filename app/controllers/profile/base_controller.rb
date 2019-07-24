class Profile::BaseController < ApplicationController
  before_action :require_reguser
end
