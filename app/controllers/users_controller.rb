class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.all 
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)    #returns appropriate initialization hash
    if @user.save #if successful with valid signup data, will save
      log_in @user # calls to log_in, having user automatically login after signing up.
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user #render's template for create action. common convention redirecting to newly created user's profile when successful
    else
      render 'new'
    end

    def edit
    end

    def update
      if @user.update_attributes(user_params)
        # Handle a successful update.
        flash[:success] = "Profile updated"
        redirect_to @user
      else
        render 'edit'
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # Before filters.

    # Confirms a logged in user.

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
  end
end
