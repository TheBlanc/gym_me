class EventsController < ApplicationController

  def index
    if params[:search] && !params[:search].empty?
        @events = Event.basic_search(params[:search])
        @events = Event.near(params[:search]) if @events.empty?
    else
        @events = Event.all
    end
  end

  def show
    @event = Event.find(params[:id])
    @comments = @event.comments
    @comment = Comment.new
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new
    @event.title = params[:event][:title]
    @event.address = params[:event][:address]
    @event.time = params[:event][:time]
    @event.description = params[:event][:description]
    @event.activity_type = params[:event][:activity_type]
    @event.user_id = current_user.id

    if @event.save
      redirect_to root_url
    else
      flash[:alert] = "Something went wrong"
      render :new
    end
  end

end
