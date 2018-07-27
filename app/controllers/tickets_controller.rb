class TicketsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @ticket = Ticket.new
    @ticket.user_id = current_user.id
    @ticket.event_id = params[:event_id]
    @event = current_event
    @event.capacity -= 1

    if @ticket.save && @event.save
      redirect_to event_path(params[:event_id])
    else
      flash[:alert] = "Something went wrong"
      render 'events#show'
    end
  end

  def destroy
    @ticket = Ticket.find_by(user_id: current_user.id, event_id: current_event)
    @ticket.delete
    event = current_event
    event.capacity += 1
    event.save
    redirect_to event_path(current_event.id)
  end

  def current_event
    Event.find(params[:event_id])
  end

end
