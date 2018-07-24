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
      redirect_to root_url
    else
      raise
      flash[:alert] = "Something went wrong"
    end
  end

  def destroy
  end

end
