class AttendeesController < ApplicationController
  before_action :set_attendee, only: [:show, :edit, :update, :destroy]
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
    @event_name = "this awesome event"
    if params[:event_id]
      @event = Event.find(params[:event_id])
      @event_name = @event.name
    end

    @attendee = Attendee.new
    puts ">>>>>>>>>>>>>>current user #{current_user.inspect}"
    @attendee.user_id = current_user
    respond_with(@attendee)
  end

  def edit
    @event_name = "this awesome event"
    if params[:event_id]
      @event = Event.find(params[:event_id])
      @event_name = @event.name
    end
  end

  def create

    #Only create if it already exists:

    @attendee = Attendee.new(attendee_params)
    event = @attendee.event
    if event.attendees.for_user_id(current_user.id).blank?
      @attendee.user_id = current_user.id
      @attendee.save
      respond_with(@attendee, :location => event_path(@attendee.event))
    else
      #attendance already exists...this can happen if clicking attend from not logged in:
      flash[:danger] = 'You have already responded to this event!'
      respond_with(@attendee, :location => event_path(@attendee.event))
    end
  end

  def update
    @attendee.update(attendee_params)
    respond_with(@attendee, :location => event_path(@attendee.event))
  end

  def destroy
    @attendee.destroy
    respond_with(@attendee)
  end

  private
    def set_attendee
      @attendee = Attendee.find(params[:id])
    end

    def attendee_params
      params.require(:attendee).permit(:user_id, :confirm_status, :bring_vinyl, :bring_drinks, :bring_food, :bring_theparty, :event_id, :comments)
    end
end
