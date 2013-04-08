class V1::MyEventsController < ApplicationController
  expose(:my_events) { EventGatheringService.new(current_user).gather }

  def index
    respond_with(my_events)
  end
end
