class InvitesController < ApplicationController

  def create
    @invite = Invite.new(invite_params)
    if @invite.save
      if @invite.recipient != nil
        InviteMailer.existing_user_invite(@invite).deliver
        trip = User_trip.find_by_id(@invite.user_trip_id)
        User_trip.create({user_id: @invite.recipient, trip_id: trip.trip_id, role: 'contributor'})
      else 
        InviteMailer.register_invite(@invite, new_user_registration_path(invite_token: @invite.token)).deliver
      end
    else
       # oh no, creating an new invitation failed
    end
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
