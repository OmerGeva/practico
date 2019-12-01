class ChallengesController < ApplicationController
  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new
  end

  def show
    @challenge = Challenge.find(params[:id])
  end
end
