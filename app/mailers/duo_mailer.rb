class DuoMailer < ActionMailer::Base
  default from: "duo@ifttt.com"

  def duo_notify(user)
    @user = user
    @duo = user.get_duo
    puts "DUO IS BELOW..."
    puts @duo
    mail to: user.email, subject: "Your Weekly IFTTT Duo"
  end
end
