class MessagesController < ApplicationController
  # access to send messages has only logged in users
  before_action :require_user

  # the method is for sending message to chatbox
  def create
    message = current_user.messages.build(message_params)

    # redirect to root equals to reload page for updating chatbox
    if message.save
      redirect_to root_path
    end
  end

  private

  # whitelisting message params
  def message_params
    params.require(:message).permit(:body)
  end

end
