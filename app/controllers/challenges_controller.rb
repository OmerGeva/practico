class ChallengesController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @challenge = Challenge.new
    authorize @challenge
  end

  def create
    @challenge = Challenge.new
    @challenge.save
    if @challenge.count_type == 'in a row'
      date = @challenge.starting_date
      @challenge.milestone.times do |i|
        Event.create(start_date: date, challenge: @challenge)
        # date + i.challenge.time_type
      end
    authorize @challenge
  end

  def show
    @challenge = Challenge.find(params[:id])
    authorize @challenge
  end
end
