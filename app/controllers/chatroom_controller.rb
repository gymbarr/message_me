class ChatroomController < ApplicationController
  # access to chat page has only logged in users
  before_action :require_user

  # the method for displaying messages in the chatbox and for sending new messages
  def index
    @message = Message.new
    @messages = Message.all
  end

end
