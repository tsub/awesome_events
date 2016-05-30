class EventsController < ApplicationController
  before_action :authenticate

  def new
    @event = User.find(session[:user_id]).created_events.build
    head :ok
  end
end
