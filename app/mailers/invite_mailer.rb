class InviteMailer < ApplicationMailer

  default from: 'no-reply@tripper.com'

  def create
    @invite = Invite.new(invite_params)
    if @invite.save
       InviteMailer.register_invite(@invite, new_user_registration_path).deliver
    else
       # oh no, creating an new invitation failed
    end
  end

  def register_invite(invite)
    @invite = invite
    mail(to:@invite.email, subject: "Join my trip!")
  end

end
