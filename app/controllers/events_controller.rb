class EventsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :edit, :update, :favorite, :destroy]

  def new
    @event = Event.new
  end

  def edit

  end

  def destroy
	Event.find(params[:id]).destroy
	flash[:success] = "Event deleted"
	redirect_to root_url
  end

  def index
	@events = Event.paginate(:page => params[:page], :per_page => 30)
  end 
 
  def create
    @event = current_user.events.new(event_params)
    if @event.save
	flash[:success] = "Event created!"
	redirect_to @event
    else
	flash[:fail] = "Event not created :("
        render action: :new
    end
  end

  def favorite
    UserCalendar.create(
      event_id: params[:id],
      user_id: current_user.id
    ) unless UserCalendar.find_by_event_id_and_user_id(params[:id], current_user.id)

    flash[:success] = 'Event added to the calendar'
    redirect_to Event.find params[:id]   
  end

  def show
   @event = Event.find(params[:id])
  end
  
  def index
   @events = Event.all
  end

  def destroy
    
  end

  def add
	current_user.age = 1
  end  
  private

    def event_params
	params.require(:event).permit(:content, :location, :address, :name, :date, :tstart,:tend, :age, :drinks, :price, :link, :free, :rsvp )
    end

end
