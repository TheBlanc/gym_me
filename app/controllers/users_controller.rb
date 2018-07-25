class UsersController < ApplicationController


  def show
      @user = current_user
      @events = current_user.events
      @owned_events = current_user.owned_events
  end

end
