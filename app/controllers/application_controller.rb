class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  # allow the passing of the strong params (first_name, sex, etc) in devise
  # along with other params into account_update
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :location, :fitness_level, :sex, :description, :street_address, :city, :province, :postal_code, :country])
  end

  helper_method :joined_event?
  helper_method :tickets_left?

  private

  # returns truthy value if current_user has joined an event
  def joined_event?
    current_event = Event.find(params[:id])
    current_user && current_event.users.find_by(id: current_user.id)
  end

  # returns true if tickets are remaining for an event
  def tickets_left?
    current_event = Event.find(params[:id])
    if current_event.capacity == nil
      return true
    elsif (current_event.capacity - current_event.users.length) > 0
      return true
    else
      return false
    end 
  end

end
