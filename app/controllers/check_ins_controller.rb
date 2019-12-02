class CheckInsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def new
    @check_in = CHECK_IN.new
    authorize @check_in
  end

  private

  def set_check_in
    @check_in = CHECK_IN.find(params[:id])
  end
end
