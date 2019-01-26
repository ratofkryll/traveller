class InviteMailer < ApplicationMailer

  default from: 'no-reply@tripper.com'

  def register_invite(invite)
    @invite = invite
    mail(to:@invite.email, subject: "Join Tripper now to join my trip!")
  end

  def existing_user_invite(invite)
    @invite = invite
    mail(to:@invite.email, subject: "Join my trip!")
  end 

end
