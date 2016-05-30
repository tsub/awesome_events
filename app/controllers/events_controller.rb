class EventsController < ApplicationController
  before_action :authenticate

  def new
    head :ok
  end
end
