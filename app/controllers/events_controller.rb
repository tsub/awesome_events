class EventsController < ApplicationController
  before_action :authenticate

  def new
    @event = Event.new
    head :ok
  end
end
