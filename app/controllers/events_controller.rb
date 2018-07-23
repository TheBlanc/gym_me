class EventsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new
    @event.title = params[:event][:title]
    @event.location = params[:event][:location]
    @event.time = params[:event][:time]
    @event.description = params[:event][:description]
    @event.type = params[:event][:type]

    if @event.save
      redirect_to event_url(@event.id)
    else
      render :new
    end
  end

end
