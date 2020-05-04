class UsersController < ApplicationController
    def index
        @users = User.all
    end
    def create
        @user = User.new(post_params)

        if @user.save
          redirect_to users_path
        else
          render :new
        end
    end

    def login
    end

    def show
        @user = User.find(params[:id])
    end
    def new
        @user = User.new
    end
    def session

    end
    private

    def post_params
        params.require(:user).permit(:username, :email, :password)
    end

end
