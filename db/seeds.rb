users = [User.create(name: "Jeff", email: "jeff@ifttt.com", password: "password", password_confirmation: "password", admin: true),
         User.create(name: "Anthony", email: "anthony@ifttt.com", password: "password", password_confirmation: "password", admin: true),
         User.create(name: "Linden", email: "linden@ifttt.com", password: "password", password_confirmation: "password", admin: true),
         User.create(name: "Alexander", email: "alexander@ifttt.com", password: "password", password_confirmation: "password", admin: true),
         User.create(name: "Alan", email: "alan@ifttt.com", password: "password", password_confirmation: "password", admin: false),
         User.create(name: "Abdul", email: "abdul@ifttt.com", password: "password", password_confirmation: "password", admin: false),
         User.create(name: "Scott", email: "scott@ifttt.com", password: "password", password_confirmation: "password", admin: false),
         User.create(name: "Devin", email: "devin@ifttt.com", password: "password", password_confirmation: "password", admin: false),
         User.create(name: "Nate", email: "nate@ifttt.com", password: "password", password_confirmation: "password", admin: false)]

teams = [Team.create(name: "Channel Team"),
         Team.create(name: "Recipe Team"),
         Team.create(name: "Design"),
         Team.create(name: "Leadership")]

12.times do |i|
  populate = teams.sample
  populate.users << users.sample
  populate.save
end