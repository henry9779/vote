class VoteMailer < ApplicationMailer

  def vote_notify(mail)
    mail to: mail, subject: 'HI'
  end

end
