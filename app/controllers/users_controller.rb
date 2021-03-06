class UsersController < ApplicationController
  # before_action :logged_in_user, only: [:index]
  
  def show
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      # Handle a successful save.
      reset_session
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  #def create
  #  @user = User.new(user_params)
  #  if @user.save
      # Handle a successful save.
  #    redirect_to user_url(@user)
  #  else
  #    render 'new'
  #  end
  #end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :bday, :address, :city, :state, :zip, :pNumber, :username)
    end
end