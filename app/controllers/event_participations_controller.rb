class EventParticipationsController < ApplicationController
    before_action :set_event

    def index       
        redirect_to @event
    end

    def create
      @event_participation = @event.event_participations.build(member_id: current_member.id)
      if @event_participation.save
        redirect_to @event
      else
        redirect_to @event
      end
    end
  
    def destroy
      @event_participation = @event.event_participations.find(params[:id])
      @event_participation.destroy
      redirect_to @event
    end
  
    private
  
    def set_event
      @event = Event.find(params[:event_id])
    end
  end
