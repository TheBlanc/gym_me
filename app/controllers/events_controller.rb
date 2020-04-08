class EventsController < ApplicationController

  def discover

  end

  def index
    @events = Event.all
    if params[:search].present?
      radius = params[:radius];
      search_location_lat = Geocoder.search(params[:search])[0].data["lat"]
      search_location_lon = Geocoder.search(params[:search])[0].data["lon"]
      @events = Event.near([search_location_lat, search_location_lon], radius, units: :km)
    end
    @events = @events.where(activity_type: params[:activity_type]) if params[:activity_type].present?
    @events = @events.where("capacity > ?", 0)
    @events = @events.where("time > ?", DateTime.now)
    @events = @events.order(:time)

  end

  def show
    @event = Event.find(params[:id])
    @comments = @event.comments
    @comment = Comment.new
    @users = @event.users

    if current_user
      @ticket = Ticket.find_by(user_id: current_user.id, event_id: @event.id)
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new
    @event.title = params[:event][:title]
    @event.address = params[:event][:address]
    @event.time = params[:event][:time]
    @event.end_date = params[:event][:end_date]
    @event.persistence = params[:event][:persistence]
    @event.description = params[:event][:description]
    @event.activity_type = params[:event][:activity_type]
    @event.capacity = params[:event][:capacity]
    @event.need_approval = params[:event][:need_approval]
    @event.user_id = current_user.id
      if params[:event][:activity_type] == "Yoga/Pilates"
        @event.activity_icon = "lotus-position.svg"
      elsif params[:event][:activity_type] == "Resistence Training"
        @event.activity_icon = "dumbbell.svg"
      elsif params[:event][:activity_type] == "Cardio"
        @event.activity_icon = "athletics.svg"
      else params[:event][:activity_type] == "Recreation"
        @event.activity_icon = "american-football.svg"
      end

    if @event.save
      redirect_to event_path(@event)
    else
      flash[:alert] = "Something went wrong"
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    @event.title = params[:event][:title]
    @event.address = params[:event][:address]
    @event.time = params[:event][:time]
    @event.description = params[:event][:description]
    @event.activity_type = params[:event][:activity_type]
    @event.capacity = params[:event][:capacity]
    @event.need_approval = params[:event][:need_approval]
    @event.user_id = current_user.id

    if @event.save
      redirect_to event_path(@event)
    else
      flash[:alert] = "Something went wrong"
      render :edit
    end

  end


end
