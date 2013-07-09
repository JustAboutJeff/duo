desc "This task is called by the Heroku scheduler add-on"

require 'duo_calculator'

task :notify_duos => :environment do
  if Time.now.friday?
    puts "Building duos and notifying..."
    DuoCalculator.get_duos
    puts "complete."
  end
end
