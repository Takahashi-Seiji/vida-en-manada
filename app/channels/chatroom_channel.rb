class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    chatroom = Chatroom.find(params[:id])
    stream_for chatroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = Message.create!(content: data['message'], user_id: current_user.id, chatroom_id: data['chatroom_id'])
    template = ApplicationController.renderer.render(message)
    ActionCable.server.broadcast("chatroom_#{data['chatroom_id']}", { user_id: current_user.id, message: template })
  end
end
