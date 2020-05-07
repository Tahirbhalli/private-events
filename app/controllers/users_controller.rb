class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :session?, except: %i[logout show]
  def login
    #  redirect_to users_path if cookies[:userid]
  end

  def auth
    @user = User.find(params[:uid])
    cookies[:userid] = @user.id
    flash[:suc] = 'Success'
    redirect_to events_Home_path
  rescue StandardError
    flash[:error] = 'User not found'
    render :login

    # render 'sajkhdjksa'# if @user
  end

  def logout
    cookies[:userid] = nil
    redirect_to events_Home_path
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id]).events
    @attended = Attendee.where(user_id: params[:id])
    @attendee = Attendee.all
    @events = Event.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def session?
    # byebug
    redirect_to events_Home_path if cookies[:userid].to_i != 0
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
