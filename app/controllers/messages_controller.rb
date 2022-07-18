class MessagesController < ApplicationController
  # access to send messages has only logged in users
  before_action :require_user

  # the method is for sending message to chatbox
  def create
    message = current_user.messages.build(message_params)

    # broadcast message to chatroom channel
    if message.save
      ActionCable.server.broadcast "chatroom_channel",
                                    mod_message: message_render(message)
    end
  end

  private

  # whitelisting message params
  def message_params
    params.require(:message).permit(:body)
  end

  # the method is for rendering messages partial
  def message_render(message)
    render(partial: 'message', locals: { message: message })
  end

end
