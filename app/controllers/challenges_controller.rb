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

    # ============ ADD FRIENDS ============ #
    @friends = @user.friends
    friends = params[:challenge][:users]

    if friends.size > 1
      friends.each do |friend|
        UsersChallenge.create(user_id: friend, challenge: @challenge, user_progress: 0, accepted: false)
      end
    end

    # ============ ADD CHECKINS ============ #
    @check_in = CheckIn.create(users_challenge_id: @users_challenge)

    authorize @challenge

    if @challenge.save
      @chat_room = ChatRoom.create(challenge_id: @challenge.id, name: @skill.title)
      # raise
      redirect_to challenge_path(@challenge)
    else
      redirect_to new_challenge_path
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
    @chat_room = @challenge.chat_room.first
    # raise
    authorize @challenge
  end

  def accept
    @challenge = Challenge.find(params[:challenge_id])
    @user_challenge = UsersChallenge.where(user: @user, challenge: @challenge).first
    @user_challenge.accepted = true
    authorize @user_challenge
    @user_challenge.save
    counter = 0
    @challenge.users_challenges.each do |users_challenge|
      if users_challenge.accepted
        counter += 1
      end
    end
    if counter == @challenge.users_challenges.count
      @challenge.update(starting_date: Date.today)
    end

    redirect_to root_path
  end

  def edit
    @challenge = Challenge.find(params[:id])
    authorize @challenge
  end

  def update
    @challenge = Challenge.find(params[:id])
    @challenge.update(challenge_params)
    @challenge.users_challenges.each do |users_challenge|
      users_challenge.update(user_progress: 0)
    end
    authorize @challenge


    redirect_to challenge_path(@challenge)
  end

  def renew
    @challenge = Challenge.find(params[:challenge_id])
    @challenge.users_challenges.each do |users_challenge|
      users_challenge.update(user_progress: 0)
    end

    authorize @challenge
    redirect_to challenge_path(@challenge)
  end
  def decline
    @challenge = Challenge.find(params[:challenge_id])
    @user_challenge = UsersChallenge.where(user: @user, challenge: @challenge).first
    authorize @user_challenge
    @user_challenge.destroy
    redirect_to root_path
  end

  def finished
    @challenge = Challenge.find(params[:challenge_id])
    authorize @challenge
  end
  private

  def set_user
    @user = current_user
  end

  def challenge_params
    params.require(:challenge).permit(:milestone, :time_type, :count_type, :first_place, :last_place, :starting_date, :validation_type)
  end

  def skill_params
    params.require(:challenge).permit(:skill)
  end

  def friend_params
    params.require(:challenge).permit(:friends)
  end

  def check_in_params
    params.require(:challenge).permit(:check_in)
  end
end
