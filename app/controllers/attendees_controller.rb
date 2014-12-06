class AttendeesController < ApplicationController
  before_action :set_attendee, only: [:show, :edit, :update, :destroy]
  before_action :set_event, only: [:new, :create]
  before_action :authenticate_user!
  respond_to :html

  def index
    @attendees = Attendee.all
    respond_with(@attendees)
  end

  def show
    respond_with(@attendee)
  end

  def new
    @attendee = Attendee.new
    @attendee.user = current_user
    respond_with(@attendee)
  end

  def edit
  end

  def create
    @attendee = Attendee.new(attendee_params)
    @attendee.user = current_user
    @attendee.save
    respond_with(@attendee)
  end

  def update
    @attendee.update(attendee_params)
    respond_with(@attendee)
  end

  def destroy
    @attendee.destroy
    respond_with(@attendee)
  end

  private
    def set_attendee
      @attendee = Attendee.find(params[:id])
    end

    def set_event
      if params[:event_id]
        @event = Event.find(params[:event_id])
      end
    end

    def attendee_params
      params.require(:attendee).permit(:user_id, :confirm_status, :bring_vinyl, :bring_drinks, :bring_food, :bring_theparty, :event_id, :comments)
    end
end
