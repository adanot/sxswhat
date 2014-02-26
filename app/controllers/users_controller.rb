class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :calendar, :show]
  before_action :correct_user,	 only: [:edit, :update]
  before_action :admin_user,	 only: :destroy
  def show
	@user = User.find(params[:id])
  end

  def calendar

    user_events = User.find(params[:id]) || current_user
    @events = (user_events.user_calendars.collect(&:event) + user_events.events ).uniq
  end

  def new
	@user = User.new
  end

  def edit
	@user = User.find(params[:id])
  end

  def index
	@users = User.paginate(page: params[:page])
  end

  def update
	@user = User.find(params[:id])
	if @user.update_attributes(user_params)
	  flash[:success] = "Profile updated"
	  redirect_to @user
	else
	  render 'edit'
	end
  end

  def create
	@user = User.new(user_params)
	if @user.save
		sign_in @user
		flash[:success] = "Welcome to SXSWHAT!"
		redirect_to @user
	else
	  render 'new'
	end
  end

  def destroy
	User.find(params[:id]).destroy
	flash[:success] = "User deleted."
	redirect_to users_url
  end
	private

	  def user_params
		params.require(:user).permit(:first_name, :last_name,:displayname, :email, :password, :password_confirmation, :privacy, :emailopt)
	end


	def correct_user
	  @user = User.find(params[:id])
	  redirect_to(root_url) unless current_user?(@user)
	end

	def admin_user
	  redirect_to(root_url) unless current_user.admin?
	end
end
