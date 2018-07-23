class UserController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new

    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.save?
      redirect_to user_path(@user)

    else
      render :new

    end

  end

  def show
    load_user
    
  end


  private

  def load_user
    @user = User.find(params[:id])
  end

end
