class EventsController < ApplicationController
  before_action :signed_in_user, only: [:create, :edit, :destroy]

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
    @event = current_user.events.build(event_params)
    if @event.save
	flash[:success] = "Event created!"
	redirect_to @event
    else
	flash[:fail] = "Event not created :("
        render 'static_pages/home'
    end
  end

  def show
   @event = Event.find(params[:id])
  end
  
  def index
   @events = Event.all
  end

  def destroy
    
  end
  
  private

    def event_params
	params.require(:event).permit(:content, :location, :address, :name, :date, :tstart,:tend, :age, :drinks, :price)
    end

end
