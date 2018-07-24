class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
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
    @event.activity_type = params[:event][:activity_type]
    @event.user_id = current_user.id


    if @event.save
      redirect_to root_url
    else
      render :new
      flash[:alert] = "Something went wrong"
    end
  end

end
