class MessagesController < ApplicationController
  skip_after_action :verify_authorized

  def create
    @message = Message.new(messsage_params)
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @message.chat_room = @chat_room
    @message.user = current_user
    if @message.save
      respond_to do |format|
        format.html { redirect_to challenge_path(@chat_room)}
        format.js
      end
    else
      respond_to do |format|
        format.html { render "chat_rooms#show"}
        format.js
      end
    end
  end

  private

  def messsage_params
    params.require(:message).permit(:content)
  end
end
