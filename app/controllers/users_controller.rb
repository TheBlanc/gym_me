class UsersController < ApplicationController

  def gym_buddy
    # view is used to gather search params for user#index
  end

  def index
    # check if search parameter is being passed and isnt an empty string
    if params[:search] && !params[:search].empty?

      search_users = User.basic_search(params[:search])
      # iterate through the users and check if the they are looking for gym buddy (ie. user.matching == true)
      available_users = []
      search_users.each do |user|
        if user.matching == true
          available_users << user
        end
      end
      @users = available_users

    else
      all_users = User.all
      available_users = []

      all_users.each do |user|
        if user.matching == true
          available_users << user
        end
      end
      @users = available_users
    end

  end

  def show
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
      @events = @user.events
      @owned_events = @user.owned_events
  end

  def home
    if current_user
      @user = current_user
      @events = @user.events
      @owned_events = @user.owned_events
    else
      redirect_to "devise/sessions#new"
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.age = params[:user][:age]
    @user.gender = params[:user][:gender]
    @user.fitness_level = params[:user][:fitness_level]
    @user.location = params[:user][:location]
    @user.description = params[:user][:description]
    @user.matching = params[:user][:matching]

    unless params[:user][:avatar] == nil
      @user.avatar.attach(params[:user][:avatar])
    end

    if @user.save
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

end
