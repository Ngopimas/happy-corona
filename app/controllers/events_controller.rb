class EventsController < ApplicationController

  def index
      @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to events_path(@event)
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)

    redirect_to events_path(@event)
  end
  
  def search
      @events = Event.where(category: params[:query])
  end
  
  private
    def event_params
    params.require(:event).permit(:title, :description, :location, :date, :duration, :price, :category)
    end
end
