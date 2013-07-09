desc "This task is called by the Heroku scheduler add-on"

task :notify_duos => :environment do
  if Time.now.friday?
    puts "Building duos and notifying..."
    DuoCalculator.get_duos
    puts "complete."
  end
end