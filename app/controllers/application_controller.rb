class ApplicationController < ActionController::Base


helper_method :joined_event?

private

def joined_event?
  current_event = Event.find(params[:id])
  current_user && current_event.users.find_by(id: current_user.id)

end

end
