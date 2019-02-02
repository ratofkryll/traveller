class InvitesController < ApplicationController

  def create
    @invite = Invite.new(invite_params)
    if @invite.save
      redirect_to trip_path(@invite.trip_id)
      if @invite.recipient != nil
        InviteMailer.existing_user_invite(@invite).deliver
        User_trip.create({user_id: @invite.recipient, trip_id: @invite.trip_id, role: 'contributor'})
      else 
        InviteMailer.register_invite(@invite).deliver
      end
    else
       # oh no, creating an new invitation failed
    end

  end

  def new
    @invite = Invite.new
    @trip = Trip.find_by_id(params[:id])
  end 

  def show
  end

  private

  def invite_params
    params.require(:invite).permit(
      :recipient,
      :email,
      :message,
      :trip_id,
      :sender,
      :token
    )
  end

end
