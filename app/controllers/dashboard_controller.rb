class DashboardController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @users_challenges = UsersChallenge.where(user: current_user)
    skip_authorization
  end
end
