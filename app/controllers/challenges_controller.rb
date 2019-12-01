class ChallengesController < ApplicationController
  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new
    @users = User.find(params[:id])
  end

  def show
    @challenge = Challenge.find(params[:id])
  end
end
