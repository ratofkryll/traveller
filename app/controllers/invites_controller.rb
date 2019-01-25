class InvitesController < ApplicationController
  # before_action :check_recipient

  # def check_recipient
    # recipient = User.find_by_email(email)
    # if recipient
    #   self.recipient = recipient.id
    # end
  # end

  def create
    # @invite = Invite.new(invite_params)
    
    # if @invite.save

    #   # Check if user already exists
    #   if @invite.recipient != nil
    #     InviteMailer.join_trip(@invite).deliver

    #     #Add user to user_trip table
    #     tripId = @user_trip.find_by(id: @invite.user_trip_id)
    #     @user_trip.create(user_id: @invite.recipient, trip_id: tripId.trip_id)

    #   else
    #     InviteMailer.register_invite(@invite, new_user_path)
    #   end
    # else
    #   puts "Oops something went wrong with sending your invite."
    # end

  end

  def new
    @invite = Invite.new
  end 

  def show
  end

  private

  def invite_params
    params.require(:invite).permit(
      :email,
      :message,
      :user_trip_id,
      :token
    )
  end

end
