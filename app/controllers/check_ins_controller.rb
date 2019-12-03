class CheckInsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def new
    @check_in = CheckIn.new
    @challenge = Challenge.find(params[:challenge_id])
    @users_challenge = UsersChallenge.where(user: current_user, challenge: Challenge.find(params[:challenge_id]))
    authorize @check_in
  end

  def create
    @check_in = CheckIn.new(check_in_params)
    @users_challenge = UsersChallenge.find_by(challenge_id: params[:challenge_id], user_id: current_user.id)
    @check_in.users_challenge = @users_challenge
    @check_in.save
    if @users_challenge.challenge.count_type == 'total'
      progress = @users_challenge.user_progress + @check_in.duration
      @users_challenge.update(user_progress: progress)
    elsif @check_in.completed == true
      progress = @users_challenge.user_progress + 1
      @users_challenge.update(user_progress: progress)
    end
    authorize @check_in
    if @users_challenge.user_progress >= @users_challenge.challenge.milestone
      @users_challenge.challenge.update(completed: true)
      redirect_to challenge_finished_path(@users_challenge.challenge)
    else
      redirect_to challenge_path(@users_challenge.challenge)
    end
  end

  private

  def set_check_in
    @check_in = CheckIn.find(params[:id])
  end

  def check_in_params
    params.require(:check_in).permit(:duration, :photo, :completed)
  end
end
