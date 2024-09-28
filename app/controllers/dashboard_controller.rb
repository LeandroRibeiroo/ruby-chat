class DashboardController < ApplicationController
  before_action :require_login

  def show
    @profile = current_profile
  end
end
