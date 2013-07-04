class DuoMailer < ActionMailer::Base
  default from: "from@example.com"

  # TODO: Implement this send method
  def send_pair(pair_hash={})
    pair_hash.each do |user|
      mail(to: user.email, subject: "Your pair for the week is ...")
    end
  end
end
