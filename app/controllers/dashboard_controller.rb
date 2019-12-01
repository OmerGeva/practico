class DashboardController < ApplicationController
  def home
    @challenges = Challenge.all
  end
end
