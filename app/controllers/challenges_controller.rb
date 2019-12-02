class ChallengesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_user

  def new
    @challenge = Challenge.new
    @friends = @user.friends

    authorize @challenge
  end

  def create
    @skill = Skill.create(title: skill_params[:skill])
    @challenge = Challenge.new(challenge_params)
    @users_challenge = UsersChallenge.create(user: @user, challenge: @challenge, user_progress: 0, accepted: true)
    @challenge.users_challenges << @users_challenge
    @challenge.skill = @skill

    @friends = @user.friends
    friends = params[:challenge][:users]
    if friends.size > 1
      friends.each do |friend|
        UsersChallenge.create(user_id: friend, challenge: @challenge, user_progress: 0, accepted: false)
      end
    end

    # UsersChallenge.where(user: current_user, accepted: false)

    # if friends parameter comes through new challenge form
    # iterate over friends
    # create a user_challenge for each
    # set accepted as true for me and false for friends


    authorize @challenge

    if @challenge.save
      redirect_to challenge_path(@challenge)
    else
      redirect_to new_challenge_path
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
    @chat_room = @challenge.chat_room.first
    authorize @challenge
  end

  def accept
    @challenge = Challenge.find(params[:challenge_id])
    @user_challenge = UsersChallenge.where(user: @user, challenge: @challenge).first
    @user_challenge.accepted = true
    authorize @user_challenge
    @user_challenge.save
    redirect_to root_path
  end

  def decline
    @challenge = Challenge.find(params[:challenge_id])
    @user_challenge = UsersChallenge.where(user: @user, challenge: @challenge).first
    authorize @user_challenge
    @user_challenge.destroy
    redirect_to root_path
  end

  private

  def set_user
    @user = current_user
  end

  def challenge_params
    params.require(:challenge).permit(:milestone, :time_type, :count_type, :first_place, :last_place, :starting_date)
  end

  def skill_params
    params.require(:challenge).permit(:skill)
  end

  def friend_params
    params.require(:challenge).permit(:friends)
  end
end
