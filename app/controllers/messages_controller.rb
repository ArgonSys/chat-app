class MessagesController < ApplicationController
  before_action :get_rooms, only:[:index, :create]
  before_action :get_current_room, only:[:index, :create]

  def index
    @messages = @room.messages
    @message = Message.new
  end

  def create
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def get_rooms
    @rooms = current_user.rooms
  end
  def get_current_room
    @room = Room.find(params[:room_id])
  end

  def message_params
    params.require(:message).permit(:content)\
    .merge(user_id: current_user.id)
  end
end
