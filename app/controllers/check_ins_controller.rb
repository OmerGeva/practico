class CheckInsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def new
    @check_in = CheckIn.new
    @challenge = Challenge.find(params[:challenge_id])
    @users_challenge = UsersChallenge.where(user: current_user, challenge: Challenge.find(params[:challenge_id]))
    authorize @check_in
  end

  private

  def set_check_in
    @check_in = CheckIn.find(params[:id])
  end
end
