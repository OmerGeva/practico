class DashboardController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]


  def home
    @challenges = Challenge.all
    skip_authorization
  end
end
