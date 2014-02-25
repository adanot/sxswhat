class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :calendar, :show]
  before_action :correct_user,	 only: [:edit, :update]
  before_action :admin_user,	 only: :destroy
  def show
	@user = User.find(params[:id])
  end

  def calendar
<<<<<<< HEAD

    @user = User.find(params[:id])
    @events = (current_user.user_calendars.collect(&:event) + current_user.events ).uniq
=======
    user_events = User.find(params[:id]) || current_user
    @events = (user_events.user_calendars.collect(&:event) + user_events.events ).uniq
>>>>>>> 5d59c13f762f3986908fca1d17065aa78023c31d
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
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end


	def correct_user
	  @user = User.find(params[:id])
	  redirect_to(root_url) unless current_user?(@user)
	end

	def admin_user
	  redirect_to(root_url) unless current_user.admin?
	end
end
