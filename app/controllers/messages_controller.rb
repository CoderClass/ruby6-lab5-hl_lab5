class MessagesController < ApplicationController
  def index
    @messages = Message.order(created_at: 'desc')
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:success] = 'Message sent'
      ActionCable.server.broadcast("chat", message: render_message(@message))
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
  def render_message(message)
    ApplicationController.render(partial: 'messages/message', locals: {message: message})
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
