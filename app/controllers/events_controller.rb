class EventsController < ApplicationController
  before_action :signed_in_user, only: [:create, :edit, :destroy]

  def new
    @event = Event.new
  end

  def edit

  end
 
  def create
    @event = current_user.events.build(event_params)
    if @event.save
	flash[:success] = "Event created!"
	redirect_to root_url
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
	params.require(:event).permit(:content, :location, :name, :date)
    end

end