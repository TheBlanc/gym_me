class UsersController < ApplicationController



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

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end

  end

  def show
    load_user
  end

  def update
    load_user
      if @user.update_attributes(user_param)
        redirect_to users_path
      else
        render :edit
  end

  def edit
      load_user
  end

def destory
  load_user
  @user.destroy
  redirect_to events_path
end

  private

  def load_user
    @user = User.find(params[:id])
  end
  def user_param
    params.require(:user).permit(first_name:, :last_name, :email, phone_number: , :password, :password_confirmation)

end
