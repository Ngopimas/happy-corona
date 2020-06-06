class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(event_params)
    if @user.save
      redirect_to users_path(@user)
    else
      render :new
    end
  end

  def show
    sql = "user_id = #{current_user.id}"
    @events = Event.where(sql)
    @destination = params[:destination] || "events"
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description)
  end

end
