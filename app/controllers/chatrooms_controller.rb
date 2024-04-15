class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def start_chat
    @chatroom = Chatroom.find_or_create_by(user1_id: current_user.id, user2_id: params[:user_id]) do |chatroom|
      chatroom.name = SecureRandom.hex(10) # generates a random name
    end

    unless @chatroom.persisted?
      puts @chatroom.errors.full_messages
      return
    end

    redirect_to chatroom_path(@chatroom)
  end
end
