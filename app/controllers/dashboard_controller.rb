class DashboardController < ApplicationController

  def home
    @challenges = Challenge.all
    skip_authorization

  end
end
