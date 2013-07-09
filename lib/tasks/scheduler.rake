desc "This task is called by the Heroku scheduler add-on"

require 'duo_calculator'

task :notify_duos => :environment do
  if Time.now.friday?
    puts "Building duos and notifying..."
    DuoCalculator.get_duos
    puts "complete."
  end
end

task :notify_jeff => :environment do
  @jeff = User.create(name: "Jeff", email: "justaboutjeff@gmail.com", password: "password", password_confirmation: "password")
  @jrbelser = User.create(name: "JRBELS", email: "jrbelser@gmail.com", password: "password", password_confirmation: "password")
  @jeff.partner = @jrbelser
  DuoMailer.duo_notify(@jeff).deliver
  DuoMailer.duo_notify(@jrbelser).deliver
  @jeff.destroy
  @jrbelser.destroy
end