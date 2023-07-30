class RoomsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @room = Room.new
    @current_user = current_user
    redirect_to new_user_session_path unless @current_user
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
  end

  def create
    @room = Room.create(name: params["room"]["name"])
  end

  def show
    @message = Message.new
    @current_user = current_user
    @single_room = Room.find(params[:id])
    @messages = @single_room.messages
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new
    render "index"
  end
  
end
