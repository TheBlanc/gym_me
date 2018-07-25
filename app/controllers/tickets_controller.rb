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

    if @ticket.save
      redirect_to event_path(params[:event_id])
    else
      flash[:alert] = "Something went wrong"
      redirect_to event_path(params[:event_id])
    end
  end

  def destroy
  end

end
