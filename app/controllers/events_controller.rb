class EventsController < ApplicationController

  def index
      @events = Event.all
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    @event.save
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def search
      @events = Event.where(category: params[:query])
  end

  private
    def event_params
    params.require(:event).permit(:title, :description, :location, :duration, :price, :category)
    end
end
