class UsersController < ApplicationController


  def show
      @user = User.find(params[:id])
      @events = @user.events
      @owned_events = @user.owned_events
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.age = params[:user][:age]
    @user.sex = params[:user][:sex]
    @user.country = params[:user][:country]
    @user.province = params[:user][:province]
    @user.city = params[:user][:city]
    @user.street_address = params[:user][:street_address]
    @user.postal_code = params[:user][:postal_code]
    @user.avatar.attach(params[:user][:avatar])
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

end
