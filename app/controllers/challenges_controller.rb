class ChallengesController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @challenge = Challenge.new
    authorize @challenge
  end

  def create
    @challenge = Challenge.new

    authorize @challenge
  end

  def show
    @challenge = Challenge.find(params[:id])
    authorize @challenge
  end
end
