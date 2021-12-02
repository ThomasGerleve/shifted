class MessagesController < ApplicationController

  def create
    @user_shift = UserShift.find(params[:user_shift_id])
    @message = Message.new(message_params)
    @message.user_shift = @user_shift
    @message.user = current_user
    if @message.save
      UserShiftChannel.broadcast_to(
        @user_shift,
        render_to_string(partial: "message", locals: { message: @message })
      )
      redirect_to user_shift_path(@user_shift, anchor: "message-#{@message.id}")
    else
      render "user_shifts/:id"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
