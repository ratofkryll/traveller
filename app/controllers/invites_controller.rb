class InvitesController < ApplicationController
  # before_action :check_recipient

  # def check_recipient
    # recipient = User.find_by_email(email)
    # if recipient
    #   self.recipient = recipient.id
    # end
  # end

  def create
    @invite = Invite.new(invite_params)
    if @invite.save
       InviteMailer.register_invite(@invite, new_user_registration_path).deliver
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
