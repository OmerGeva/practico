class EventsController < ApplicationController
  def index
    @events = policy_scope(Event).where(user: current_user)
  end
end
