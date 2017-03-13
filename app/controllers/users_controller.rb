class UsersController < ApplicationController
  before_filter :set_user, except: [:index, :new, :create]
  before_filter :authorize, only: [:edit, :update]
  before_action :require_login, only: [:show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create  #process sign up form and create new user
    if current_user #do not let current user create new account
			redirect_to user_path(current_user)
		else
			@user = User.create(user_params)
    	if @user.id == nil
      	flash[:error] = @user.errors.full_messages.join(", ")
      	redirect_to new_user_path
    	elsif  @user
      	login(@user) #log the user in
      	flash[:success] = "Welcome to the Library App"
      	redirect_to @user #go to show
    	end
  	end
	end

  def show  #show one specific user by ID
    if current_user != @user
      flash[:error] = "You Cannot View This User's Profile"
      redirect_to root_path
    else
      render :show
    end
  end


  def edit
    unless current_user == @user
      redirect_to user_path(current_user)
    end
  end

  def update
	  # only let current_user update their own account
  	if current_user == @user
      if @user.update_attributes(user_params)
        flash[:notice] = "Successfully updated profile."
        redirect_to user_path(@user)
      else
        flash[:error] = @user.errors.full_messages.join(", ")
        redirect_to edit_user_path(@user)
      end
    else
      redirect_to user_path(current_user)
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

    def set_user
      user_id = params[:id]
      @user = User.find_by_id(user_id)
    end

		def require_login
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
