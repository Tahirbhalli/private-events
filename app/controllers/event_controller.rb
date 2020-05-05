class EventController < ApplicationController
    def index
        @list = Event.all
        @users = User.all
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
    end
    def register
    end

    private

    def user_params
        params.require(:event).permit(:title, :description)
    end
end
