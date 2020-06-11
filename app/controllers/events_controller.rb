class EventsController < ApplicationController

  def index
    if params[:search].present?
      #@events = Event.where("title ILIKE ?", "%#{params[:search][:query]}%")
      sql_query = " \
        events.title @@ :query \
      "
      @events = Event.where(sql_query, query: "%#{params[:search][:query]}%")
    else
      @events = Event.all
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to event_path(@event)
    else
    render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @events = []
    @events << @event
    @markers = @events.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude
      }
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)

    redirect_to event_path(@event)
  end

  def search
      @events = Event.where(category: params[:category])
  end

  private
    def event_params
    params.require(:event).permit(:title, :description, :location, :date, :duration, :price, :category)
    end
end
