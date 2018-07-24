class UsersController < ApplicationController

  def index
  end
  def show
    load_user
  end
  private

  def load_user
    @user = current_user
  end

end
