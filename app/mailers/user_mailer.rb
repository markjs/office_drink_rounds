class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def invite(invite)
    @invite = invite
    mail to: @invite.email, subject: "Invitation!"
  end
end
