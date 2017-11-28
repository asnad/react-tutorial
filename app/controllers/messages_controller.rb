class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :destroy]
  def index
  	@messages = Message.all
  end

  def create
    message = Message.new(message_params)
    if message.save
      render json: message
    else
      render json: {status: "fail", errors: message.errors.full_messages}
    end
  end
  def destroy
    @message.destroy
    head :no_content
  end
  private
  def set_message
  	@message = Message.find params[:id]
  end

  def message_params
    params.require(:message).permit(:text, :important)
  end
end
