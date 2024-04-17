class ChatroomsController < ApplicationController
  def show
    begin
      @chatroom = Chatroom.find(params[:id])
      authorize @chatroom
      @message = Message.new
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, alert: 'The chatroom you were looking for could not be found.'
    rescue Pundit::NotAuthorizedError
      redirect_to root_path, alert: 'You are not authorized to view this chatroom.'
    end
  end

  def start_chat
    @missing_animal = MissingAnimal.find(params[:missing_animal_id])
    @chatroom = Chatroom.find_or_create_by(user1_id: current_user.id, user2_id: params[:user_id], missing_animal: @missing_animal) do |chatroom|
      chatroom.name = SecureRandom.hex(10) # generates a random name
      chatroom.status = :pending
    end

    if @chatroom.status == "pending"
      redirect_to root_path, notice: 'Chatroom is pending acceptance by the other user.'
    else
      redirect_to chatroom_path(@chatroom)
    end
  end

  def accept
    @chatroom = Chatroom.find(params[:id])
    if @chatroom.user2_id == current_user.id && @chatroom.pending?
      @chatroom.accepted!
      redirect_to chatroom_path(@chatroom), notice: 'Chatroom accepted'
    else
      redirect_to root_path, alert: 'You are not authorized to accept this chatroom.'
    end
  end

  def destroy
    @chatroom = Chatroom.find(params[:id])
    @chatroom.destroy
    redirect_to root_path, notice: "Chatroom deleted"
  end
end
