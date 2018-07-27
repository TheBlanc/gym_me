class EventsController < ApplicationController

  def index
    # check if search parameter is being passed and isnt an empty string
    if params[:search] && !params[:search].empty?
        @events = Event.basic_search(params[:search])
        @events = Event.near(params[:search]) if @events.empty?

        search_events = Event.basic_search(params[:search])
        # iterate through the events and check if the there are spots available (capacity > 0)
        available_events = []
        search_events.each do |event|
          if event.capacity > 0
            available_events << event
          end
        end 
        @events = available_events

    else
        available_events = []
        all_events = Event.all
        all_events.each do |event|
          if event.capacity > 0
            available_events << event
          end
        end
        @events = available_events
    end

  end

  def show
    @event = Event.find(params[:id])
    @comments = @event.comments
    @comment = Comment.new
    @users = @event.users
    @ticket = Ticket.find_by(user_id: current_user.id, event_id: @event.id)
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
    @event.capacity = params[:event][:capacity]
    @event.need_approval = params[:event][:need_approval]
    @event.user_id = current_user.id

    if @event.save
      redirect_to root_url
    else
      flash[:alert] = "Something went wrong"
      render :new
    end
  end


end
