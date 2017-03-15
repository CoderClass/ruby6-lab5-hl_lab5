class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:success] = 'Message sent'
      redirect_to root_path
    else
      flash[:error] = 'There is some problem'
      redirect_to root_path
    end
  end

  private
  # def set_message
  #   @message = Message.find(params[:id])
  # end

  def message_params
    params.require(:message).permit(:body)
  end
end
