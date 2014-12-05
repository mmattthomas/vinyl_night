class EventsController < ApplicationController

  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  respond_to :html

  def index
    @events = Event.all
    respond_with(@events)
  end

  def show
    respond_with(@event)
  end

  def new
    @event = Event.new
    respond_with(@event)
  end

  def edit
  end

  def create

    @event = Event.new(event_params)
    @event.create_user = current_user
    @event.save
    respond_with(@event)
  end

  def update
    @event.update(event_params)
    respond_with(@event)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  private
    def set_event
      @event = Event.find(params[:id])
      @users = User.all
    end

    def event_params
      params.require(:event).permit(:name, :create_user_id, :scheduled, :start_time, :end_time, :address, :description, :banner_url)
    end
end
