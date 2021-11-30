class UserShiftChannel < ApplicationCable::Channel

  def subscribed
    user_shift = UserShift.find(params[:id])
    stream_for user_shift
  end

  def unsubscribed
  end
end
