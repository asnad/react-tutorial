class MessagesController < ApplicationController
  def index
  	@messages = Message.all
  end

  def show
  end
end
