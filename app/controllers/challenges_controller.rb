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

      redirect_to challenge_path(@challenge)
    else
      redirect_to new_challenge_path
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
    @users_challenge = UsersChallenge.find_by(challenge_id: @challenge.id, user_id: current_user.id)
    @chat_room = @challenge.chat_room.first
    @weekly_user_check_ins = {}
    @monthly_user_check_ins = {}
    @yearly_user_check_ins = {}


    @challenge.users.each do |user|
      @weekly_user_check_ins[user] = user.check_ins.select { |check_in|
        check_in.users_challenge.challenge == @challenge && check_in.date > Date.today - 7
      }
      @monthly_user_check_ins[user] = user.check_ins.select { |check_in|
        check_in.users_challenge.challenge == @challenge && check_in.date > Date.today - 30
      }
      @yearly_user_check_ins[user] = user.check_ins.select { |check_in|
        check_in.users_challenge.challenge == @challenge && check_in.date > Date.today - 365
      }
    end
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
      # @challenge.users_challenges.each do |users_challenge|
      #   users_challenge.events.destroy_all
      #   update_schedule(users_challenge.user)
      # end
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
    @user_challenge.events.destroy_all
    authorize @user_challenge
    @user_challenge.destroy
    redirect_to root_path
  end

  def read
    @challenge = Challenge.find(params[:challenge_id])
    @users_challenge =  UsersChallenge.find_by(user_id: current_user.id, challenge_id: @challenge.id)
    @users_challenge.update(unread: false)
    raise
    authorize @challenge

    redirect_to challenge_path(@challenge)
  end

  def finished
    @challenge = Challenge.find(params[:challenge_id])
    @users_challenge = UsersChallenge.find_by(user_id: current_user.id, challenge_id: @challenge.id)
    @challenge.users_challenges.each do |users_challenge|
      if users_challenge.user == current_user
        users_challenge.update(unread: false)
      end
    end

    authorize @challenge
  end

  def schedule
    @challenge = Challenge.find(params[:challenge_id])

    authorize @challenge
  end

  def update_schedule(user = current_user)

    @challenge = Challenge.find(params[:challenge_id])
    @users_challenge = UsersChallenge.find_by(challenge_id: @challenge.id, user_id: current_user.id)
    @users_challenge.update(scheduled: true)
    milestone = @challenge.milestone
    hours = params[:hours].to_i
    days_of_week = []
    params.each do |key, value|
      if key.match?(/^day/) && value == '1'
        days_of_week << key[3, key.length]
      end
    end
    authorize @challenge

    counter = 0

    if @challenge.time_type == 'days' && @challenge.count_type == 'total'
      until milestone <= 0
        days_of_week.each do |day|
          unless milestone <= 0
            Event.create(start_time: Date.parse(day) + counter, users_challenge_id: @users_challenge.id, user_id: current_user.id)
            milestone -= 1
          end
        end
        counter += 7
      end
    elsif @challenge.time_type == 'weeks' && @challenge.count_type == 'total'
      until milestone <= 0
        days_of_week.each do |day|
          Event.create(start_time: Date.parse(day) + counter, users_challenge_id: @users_challenge.id, user_id: current_user.id)
        end
        milestone -= 1
        counter += 7
      end
    elsif @challenge.time_type == 'weeks' && @challenge.count_type == 'in a row'
      milestone.times do
        days_of_week.each do |day|
          Event.create(start_time: Date.parse(day) + counter, users_challenge_id: @users_challenge.id, user_id: current_user.id)
        end
        milestone -= 1
        counter += 7
      end
    elsif @challenge.time_type == 'hours' && @challenge.count_type == 'total'
      until milestone <= 0
        days_of_week.each do |day|
          unless milestone <= 0
            Event.create(start_time: Date.parse(day) + counter, users_challenge_id: @users_challenge.id, user_id: current_user.id)
            milestone -= hours
          end
        end
        counter += 7
      end
      elsif @challenge.time_type == 'days' && @challenge.count_type == 'in a row'
        @users_challenge = UsersChallenge.find_by(challenge_id: @challenge.id, user_id: user.id)
        days_of_week = ['sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday']
        until milestone <= 0
          days_of_week.each do |day|
            unless milestone <= 0
              Event.create(start_time: Date.parse(day) + counter, users_challenge_id: @users_challenge.id, user_id: user.id)
            end
              milestone -= 1
          end
          counter += 7
        end
    end

    redirect_to events_path unless @challenge.time_type == 'days' && @challenge.count_type == 'in a row'

    end

  private

  def set_user
    @user = current_user
  end

  def challenge_params
    params.require(:challenge).permit(:milestone, :time_type, :count_type, :first_place, :last_place, :starting_date, :validation_type, :photo_proof)
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
