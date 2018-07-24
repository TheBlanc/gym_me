class TicketsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @ticket = Ticket.new
    @ticket.user_id = session[:user_id]
    @ticket.event_id = params[:id]

    if @ticket.save
      redirect_to root_url
    else
      render 'event#show'
      flash[:alert] = "Something went wrong"
    end
  end

  def destroy
  end

end
