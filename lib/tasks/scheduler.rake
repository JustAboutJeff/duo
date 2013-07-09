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
    puts "Building Jeff pair and notifying..."
    jeff = User.create(name: "Jeff", email: "justaboutjeff@gmail.com", password: "password", password_confirmation: "password")
    jr = User.create(name: "JR", email: "jrbelser@gmail.com", password: "password", password_confirmation: "password")
    jeff.set_partner(jr)
    DuoMailer.duo_notify(jeff).deliver
    DuoMailer.duo_notify(jr).deliver
    jeff.destroy
    jr.destroy
    puts "complete."
end
