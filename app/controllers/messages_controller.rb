class MessagesController < ApplicationController
  before_action :set_message, only: :show
  def index
  	@messages = Message.all
  end

  def show

  end
  private
  def set_message
  	@message = Message.find params[:id]
  end
end
