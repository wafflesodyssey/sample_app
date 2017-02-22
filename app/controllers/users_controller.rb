class UsersController < ApplicationController

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
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        # Handle a successful update.
      else
        render 'edit'
      end
    end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  end
end
