class EventController < ApplicationController
  before_action :session?
  def index
    @new_list=Event.created_before(Date.today)
    @old_list = Event.upcoming_events(Date.today)
    @users = User.all
    @attendee = Attendee.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(user_params)
    @event.user_id = cookies[:userid]
    if @event.save
      redirect_to events_Home_path
    else
      format.html { render :new }
      format.json { render json: @event.errors, status: :unprocessable_entity }
    end
  end

  def all
    @user = User.find(cookies[:userid]).events
  end

  def join
    redirect_to login_path if cookies[:userid] == ''
    @attendee = Attendee.new
  end

  def register
    @attendee = Attendee.new(user_id: cookies[:userid], event_id: params[:event_id])
    if @attendee.save
      redirect_to events_Home_path
    else
      redirect_to join_event_path
    end
  end

  private

  def user_params
    params.require(:event).permit(:title, :description, :event_date)
  end

  def session?
    redirect_to login_path if cookies[:userid].to_i.zero?
  end
end
