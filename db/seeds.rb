seed_users = [User.create(name: "JRBELS", email: "jrbelser@gmail.com", password: "password", password_confirmation: "password"),
              # User.create(name: "Anthony", email: "anthony@ifttt.com", password: "password", password_confirmation: "password"),
              # User.create(name: "Linden", email: "linden@ifttt.com", password: "password", password_confirmation: "password"),
              # User.create(name: "Alexander", email: "alexander@ifttt.com", password: "password", password_confirmation: "password"),
              # User.create(name: "Alan", email: "alan@ifttt.com", password: "password", password_confirmation: "password"),
              # User.create(name: "Abdul", email: "abdul@ifttt.com", password: "password", password_confirmation: "password"),
              # User.create(name: "Scott", email: "scott@ifttt.com", password: "password", password_confirmation: "password"),
              # User.create(name: "Devin", email: "devin@ifttt.com", password: "password", password_confirmation: "password"),
              # User.create(name: "Nate", email: "nate@ifttt.com", password: "password", password_confirmation: "password"),
              User.create(name: "Jeff", email: "justaboutjeff@gmail.com", password: "password", password_confirmation: "password")]

seed_teams = [Team.create(name: "Channel Team"),
              Team.create(name: "Recipe Team"),
              Team.create(name: "Design"),
              Team.create(name: "Leadership")]

seed_users.each do |user|
  stubs = seed_teams.shuffle
  (1..3).to_a.sample.times do
    user.teams << stubs.pop
    user.save
  end
end