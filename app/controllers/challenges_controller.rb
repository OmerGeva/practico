class ChallengesController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new
  end

  def show
    @challenge = Challenge.find(params[:id])
    authorize @challenge
  end
end
