class UserChannel < ApplicationCable::Channel
  def subscribed
    @User = User.find(params[:id])
    stream_for @user
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
