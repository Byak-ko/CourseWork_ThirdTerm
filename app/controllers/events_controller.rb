class EventsController < ApplicationController
  def index
    @events = Event.all
    @event_participations = EventParticipation.where(event_id: @events.pluck(:id))
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :location, :description, :organizer)
  end

end
