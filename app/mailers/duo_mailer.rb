class DuoMailer < ActionMailer::Base
  default from: "duo@ifttt.com"

  def duo_notify(user)
    @user = user

    mail to: user.email, subject: "Your Weekly IFTTT Duo"
  end
end
